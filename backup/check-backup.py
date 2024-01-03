import filecmp
import stat
import os
import sys


# patch _sig to no longer look at mtime
def _sig(st):
    return (stat.S_IFMT(st.st_mode),
            st.st_size,
            0)


filecmp._sig = _sig


def dircmp_recursive(cur: filecmp.dircmp, orig: filecmp.dircmp):
    if cur != orig:
        rel_path = os.path.relpath(cur.left, orig.left)
        assert rel_path == os.path.relpath(cur.right, orig.right)
        orig.same_files.extend([os.path.join(rel_path, f) for f in cur.same_files])
        orig.diff_files.extend([os.path.join(rel_path, f) for f in cur.diff_files])
        orig.funny_files.extend([os.path.join(rel_path, f) for f in cur.funny_files])
        orig.left_only.extend([os.path.join(rel_path, f) for f in cur.left_only])
        orig.right_only.extend([os.path.join(rel_path, f) for f in cur.right_only])

    for sd in cur.subdirs.values():
        dircmp_recursive(sd, orig)


def check_if_dir(path):
    return '\033[1;34m' if os.path.isdir(path) else ''


L_DIR = "/opt"
R_DIR = "opt"

report = filecmp.dircmp(L_DIR, R_DIR)
dircmp_recursive(report, report)
print(f"Identical files: {len(report.same_files)}")
print(f"Changed files: {len(report.diff_files)}")
print(f"Uncheckable files: {len(report.funny_files)}")
print(f"Files/subdirs only in left: {len(report.left_only)}")
print(f"Files/subdirs only in right: {len(report.right_only)}")
nl = "\n"
changed_files = [f"{f} {os.stat(os.path.join(L_DIR, f)).st_size} {os.stat(os.path.join(R_DIR, f)).st_size}"
                 for f in report.diff_files]
l_only_files = [f"{check_if_dir(os.path.join(L_DIR, f))}{f}\033[0m {os.stat(os.path.join(L_DIR, f)).st_size}"
                for f in report.left_only]
r_only_files = [f"{check_if_dir(os.path.join(R_DIR, f))}{f}\033[0m {os.stat(os.path.join(R_DIR, f)).st_size}"
                for f in report.right_only]
print(f"Changed file list (name, L_SIZE, R_SIZE):\n{nl.join(changed_files)}".strip(nl))
print(f"Uncheckable file list:\n{nl.join(report.funny_files)}".strip(nl))
print(f"Left files only list (name, L_SIZE):\n{nl.join(l_only_files)}".strip(nl))
print(f"Right files only list (name, R_SIZE):\n{nl.join(r_only_files)}".strip(nl))

ret_code = 0
if len(report.diff_files) * 10 > len(report.same_files):
    ret_code = 1
if len(report.left_only) * 10 > len(report.same_files):
    ret_code = 2
if len(report.right_only) * 10 > len(report.same_files):
    ret_code = 3
if '[1;34m' in repr(l_only_files) or '[1;34m' in repr(r_only_files):
    ret_code = 10
if report.funny_files:
    ret_code = 11

sys.exit(ret_code)
