#!/bin/bash

# A shell script that uses cron jobs that reports the usage of AWS resources linked to my account(using AWS CLI)

# Resources covered: AWS S3, AWS EC2, AWS Lambda and AWS IAM

# List all s3 buckets
echo "List of s3 buckets"
aws s3 ls

#  List all ec2 instances
echo "List of ec2 instances"
aws ec2 describe-instances

# List all lambda functions
echo "List of lambda functions"
aws lambda list-functions

echo "\n-----------------------------------------------\n"

# List all IAM users
echo "List of IAM users"
aws iam list-users