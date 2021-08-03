#!bin/bash

#creating a vpc with AWS CLI.

aws ec2 create-vpc --cidr-block "10.100.0.0/16" --tag-specifications "ResourceType=vpc,Tags=[{Key=name,Value=ntier}]"