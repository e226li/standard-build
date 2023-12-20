# Minio

## Configuring Prometheus

Create a user `prometheus` with policy

```s3
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "admin:Prometheus"
            ]
        }
    ]
}
```

then run `mc alias set metrics http://172.30.26.1:9000 prometheus {password} && mc admin prometheus generate metrics` and add the output into /opt/prometheus/prometheus.yml