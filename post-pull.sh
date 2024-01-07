#!/bin/bash

cd "${0%/*}"

cd scripts
python3 setup-generator.py
