#!/usr/bin/env python3

import boto3
import sys

if len(sys.argv) != 3:
    print("Usage: delete-s3-versions.py <env> <bucket_name>")
    sys.exit(1)

env = sys.argv[1]
bucket_name = sys.argv[2]

try:
    session = boto3.Session(profile_name=env)
    s3 = session.resource('s3')
    bucket = s3.Bucket(bucket_name)
    bucket.object_versions.all().delete()
    print(f"Deleted all versions from bucket: {bucket_name}")
except Exception as e:
    print(f"Error: {e}")
    sys.exit(1)