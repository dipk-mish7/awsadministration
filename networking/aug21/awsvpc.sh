#!bin/bash

#creating a vpc with AWS CLI.

aws ec2 create-vpc --cidr-block "10.100.0.0/16" --tag-specifications "ResourceType=vpc,Tags=[{Key=name,Value=ntier}]"

# vpc-id ="vpc-0c1de300195d23eca"

#create web subnet
aws ec2 create-subnet --vpc-id $vpc_id --cidr-block "10.100.0.0/24" --tag-specifications "ResourceType=subnet,Tags=[{Key=name,Value=web}]" --availability-zone "us-west-2a"

#craete app subnet
aws ec2 create-subnet --vpc-id $vpc_id --cidr-block "10.100.1.0/24" --tag-specifications "ResourceType=subnet,Tags=[{Key=name,Value=app}]" --availability-zone "us-west-2b"


#create db subnet
aws ec2 create-subnet --vpc-id $vpc_id --cidr-block "10.100.2.0/24" --tag-specifications "ResourceType=subnet,Tags=[{Key=name,Value=db}]" --availability-zone "us-west-2c"


#create mgmt subnet
aws ec2 create-subnet --vpc-id $vpc_id --cidr-block "10.100.3.0/24" --tag-specifications "ResourceType=subnet,Tags=[{Key=name,Value=mgmt}]" --availability-zone "us-west-2d"

#create Internet Gateway

aws ec2 create-internet-gateway --tag-specifications "ResourceType=internet-gateway,Tags=[{Key=name,Value=ntierigw}]"

#Attach Internet Gateway

aws ec2 attach-internet-gateway --internet-gateway-id $igw_id --vpc-id $vpc_id
#create Pub-Route Table

aws ec2 create-route-table --vpc-id $vpc_id --tag-specifications "ResourceType=route-table,Tags=[{Key=name,Value=public-route}]"

#create Pvt-Route Table

aws ec2 create-route-table --vpc-id $vpc_id --tag-specifications "ResourceType=route-table,Tags=[{Key=name,Value=private-route}]"

#Associate Rt table

aws ec2 associate-route-table --route-table-id $pub_rt_table --subnet-id "subnet-0fe4d48c30202fda6"

aws ec2 associate-route-table --route-table-id $pub_rt_table --subnet-id "subnet-01898679e4e06c3ff"

aws ec2 associate-route-table --route-table-id $pvt_rt_table --subnet-id "subnet-01f8dc1bd456f6282"
aws ec2 associate-route-table --route-table-id $pvt_rt_table --subnet-id "subnet-0d8e4bff2f062e609"

#create route

aws ec2 create-route --route-table-id "rtb-01afe40e92a3fe279" --destination-cidr-block "0.0.0.0/0" --gateway-id "igw-0cf2af7bcc68a4795"