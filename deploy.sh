#!/bin/bash
set -e

echo "Creating AWS Profile"

if [ -z "$AWS_ACCESS_KEY_ID" ]; then
  printf "${ERROR}environment variable (AWS_ACCESS_KEY_ID) not set ${NC}"
  exit 1
fi
if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
  printf "${ERROR}environment variable (AWS_SECRET_ACCESS_KEY) not set ${NC}"
  exit 1
fi
if [ -z "$AWS_DEFAULT_REGION" ]; then
  printf "${ERROR}environment variable (AWS_DEFAULT_REGION) not set ${NC}"
  exit 1
fi


mkdir -p /root/.aws
cat <<EOF > /root/.aws/credentials
[default]
aws_access_key_id = "${AWS_ACCESS_KEY_ID}"
aws_secret_access_key = "${AWS_SECRET_ACCESS_KEY}"
EOF

if [ -n "$AWS_SESSION_TOKEN" ]; then
  echo "aws_session_token = $AWS_SESSION_TOKEN" >> /root/.aws/credentials
fi


cat <<EOF > /root/.aws/config
[default]
region = "$AWS_DEFAULT_REGION"
output = json
EOF

echo "aws sts get-caller-identity"
aws sts get-caller-identity

# CLI ARGUEMENTS
option=$1
usage="\
  BitOps AWS CLI Plugin Usage Information \
  Usage:  \
    deploy.sh <option>  \
  Options:  \
    create-s3 \
"

if [[ -z "${option}" ]]; then
  echo $usage
fi

if [[ "${option}" == "create-s3" ]]; then
  echo "aws s3api create-bucket --bucket $AWS_S3_BUCKET --create-bucket-configuration LocationConstraint=$AWS_DEFAULT_REGION"
  aws s3api create-bucket --bucket $AWS_S3_BUCKET --create-bucket-configuration LocationConstraint=$AWS_DEFAULT_REGION
fi