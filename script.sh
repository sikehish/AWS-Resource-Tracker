#!/bin/bash

# A shell script that uses cron jobs that reports the usage of AWS resources linked to my account(using AWS CLI)

# Resources covered: AWS S3, AWS EC2, AWS Lambda and AWS IAM

# Enable debugging mode
# set -x

# List all s3 buckets
echo "List of s3 buckets"
s3_buckets=$(aws s3 ls)

if [ -z "$s3_buckets" ]; then
    echo "Err: No existing S3 buckets found"
else
    echo "$s3_buckets"
fi 

echo -e "\n-----------------------------------------------\n"

#  List all ec2 instances
echo "List of ec2 instances"
aws ec2 describe-instances

echo -e "\n-----------------------------------------------\n"

# List all lambda functions
echo "List of lambda functions"
aws lambda list-functions

echo -e "\n-----------------------------------------------\n"

# List all IAM users
echo "List of IAM users"
# aws iam list-users | jq -r '.Users[] | "\(.UserName) \(.UserId)"' # Raw text format
aws iam list-users | jq -r '[.Users[] | {UserName, UserId}]' # JSON format

echo -e "\n-----------------------------------------------\n"