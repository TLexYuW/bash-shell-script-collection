#!/bin/bash

# Configuration
PACKAGE_FILE="lambda-apis-shaded.jar"
PACKAGE_FILE_PATH="../$PACKAGE_FILE"
AWS_LAMBDA_FUNC_PROD="API_Prod"
AWS_LAMBDA_FUNC_TEST="API_Test"
AWS_API_PROD="https://654321.execute-api.ap-southeast-1.amazonaws.com/prod"
AWS_API_TEST="https://123456.execute-api.ap-southeast-1.amazonaws.com/prod"
AWS_CLI_PROFILE="default"
AWS_S3_BUCKET="lambdacode"

# Function to upload code to S3
upload_code_to_s3() {
    local env=$1
    
    if [ $env == "prod" ]
    then
        local S3_KEY="/$AWS_LAMBDA_FUNC_PROD"
    else
        local S3_KEY="/$AWS_LAMBDA_FUNC_TEST"
    fi

    uploadPath="s3://$AWS_S3_BUCKET$S3_KEY/"
    echo "Upload Path $uploadPath"

    echo "Uploading code to S3 ($env)..."
    # aws s3 cp "$PACKAGE_FILE_PATH" "$uploadPath" --acl public-read --cache-control max-age="0" --profile "$AWS_CLI_PROFILE"
    echo "Upload to S3 complete!!"
}

# Function to deploy to AWS Lambda (Test)
deploy_to_aws_lambda_test() {
    echo "Starting deployment to AWS Lambda (Test)..."
    local Lambda_Func="$AWS_LAMBDA_FUNC_TEST"
    local BucketName="$AWS_S3_BUCKET"
    local BucketKey="$Lambda_Func/$PACKAGE_FILE"

    upload_code_to_s3 "test"
    
    echo "Updating code in Lambda..."
    # aws lambda update-function-code --function-name "$Lambda_Func" --s3-bucket "$BucketName" --s3-key "$BucketKey" --profile "$AWS_CLI_PROFILE"
    echo "Deployment to AWS Lambda (Test) complete!!"
}

# Function to deploy to AWS Lambda (Prod)
deploy_to_aws_lambda_prod() {
    echo "Starting deployment to AWS Lambda (Prod)..."
    local Lambda_Func="$AWS_LAMBDA_FUNC_PROD"
    local BucketName="$AWS_S3_BUCKET"
    local BucketKey="$Lambda_Func/$PACKAGE_FILE"

    upload_code_to_s3 "prod"

    echo "Updating code in Lambda..."
    # aws lambda update-function-code --function-name "$Lambda_Func" --s3-bucket "$BucketName" --s3-key "$BucketKey" --profile "$AWS_CLI_PROFILE"
    echo "Deployment to AWS Lambda (Prod) complete!!"
}

# Function to view Lambda logs
lambda_log() {
    local functionName="$1"
    local logGroup="/aws/lambda/$functionName"

    echo "Viewing logs for Lambda function: $functionName"
    echo "logGroup: $logGroup"
    
    # aws logs tail "$logGroup" --follow --profile "$AWS_CLI_PROFILE"
}
