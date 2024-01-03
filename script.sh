#!/bin/bash

# A shell script that uses cron jobs that reports the usage of AWS resources linked to my account (using AWS CLI)

# Resources covered: AWS S3, AWS EC2, AWS Lambda, and AWS IAM

# Enable debugging mode
# set -x

# File to store the resource information
output_file="resourceTracker"

# Redirect stdout to a file
exec 1> >(tee -a "$output_file") 

# List all S3 buckets
echo "List of S3 buckets"
s3_buckets=$(aws s3 ls)

if [ -z "$s3_buckets" ]; then
    echo "Err: No existing S3 buckets found"
else
    echo "$s3_buckets"
fi 

echo -e "\n-----------------------------------------------\n"

# List all EC2 instances
echo "List of EC2 instances"
ec2_info=$(aws ec2 describe-instances)

if [ "$(echo "$ec2_info" | jq -r '.Reservations')" == "[]" ]; then
    echo "Err: No existing EC2 instances found"
else
    echo "$ec2_info"
fi

echo -e "\n-----------------------------------------------\n"

# List all Lambda functions
echo "List of Lambda functions"
lambda_info=$(aws lambda list-functions)

if [ "$(echo "$lambda_info" | jq -r '.Functions')" == "[]" ]; then
    echo "Err: No existing Lambda functions found"
else
    echo "$lambda_info"
fi

echo -e "\n-----------------------------------------------\n"

# List all IAM users
echo "List of IAM users"
aws iam list-users | jq -r '[.Users[] | {UserName, UserId}]' # JSON format

echo -e "\n-----------------------------------------------\n"
