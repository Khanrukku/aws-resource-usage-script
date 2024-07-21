#!/bin/bash
#
#
####################   THIS SCRIPT PRINT THE AWS  RESOURCE USAGE ##################
####################   AUTHOR : RUKAIYA KHAN                     #################
###################    DATE :  21 JULY 2024                       #################


# Print the AWS region configured
echo "AWS Region:"
aws configure get region
echo ""

# List all EC2 instances
echo "EC2 Instances:"
aws ec2 describe-instances --query "Reservations[*].Instances[*].{ID:InstanceId,Type:InstanceType,State:State.Name}" --output table
echo ""

# List all S3 buckets
echo "S3 Buckets:"
aws s3 ls
echo ""

# List all RDS instances
echo "RDS Instances:"
aws rds describe-db-instances --query "DBInstances[*].{ID:DBInstanceIdentifier,Type:DBInstanceClass,Engine:Engine,Status:DBInstanceStatus}" --output table
echo ""

# List all Lambda functions
echo "Lambda Functions:"
aws lambda list-functions --query "Functions[*].{Name:FunctionName,Runtime:Runtime,Handler:Handler}" --output table
echo ""

# List all CloudWatch alarms
echo "CloudWatch Alarms:"
aws cloudwatch describe-alarms --query "MetricAlarms[*].{AlarmName:AlarmName,State:StateValue,MetricName:MetricName,Namespace:Namespace}" --output table
echo ""

# List all IAM users
echo "IAM Users:"
aws iam list-users --query "Users[*].{UserName:UserName,UserId:UserId,CreateDate:CreateDate}" --output table
echo ""
