#!bin/bash

#creating a vpc with AWS CLI.

aws ec2 create-vpc --cidr-block "10.100.0.0/16" --tag-specifications "ResourceType=vpc,Tags=[{Key=name,Value=ntier}]"

# vpc-id ="vpc-054db13268bebf1c1"

#create web subnet
aws ec2 create-subnet --vpc-id "vpc-054db13268bebf1c1" --cidr-block "10.100.0.0/24" --tag-specifications "ResourceType=subnet,Tags=[{Key=name,Value=web}]"

#craete app subnet
aws ec2 create-subnet --vpc-id "vpc-054db13268bebf1c1" --cidr-block "10.100.1.0/24" --tag-specifications "ResourceType=subnet,Tags=[{Key=name,Value=app}]"


#create db subnet
aws ec2 create-subnet --vpc-id "vpc-054db13268bebf1c1" --cidr-block "10.100.2.0/24" --tag-specifications "ResourceType=subnet,Tags=[{Key=name,Value=db}]"


#create mgmt subnet
aws ec2 create-subnet --vpc-id "vpc-054db13268bebf1c1" --cidr-block "10.100.3.0/24" --tag-specifications "ResourceType=subnet,Tags=[{Key=name,Value=mgmt}]"
