#!/bin/bash
aws iam create-group --group-name Avengers
for name in IronMan CaptainAmerica BlackPanther Groot
do
 aws iam create-user --user-name $name
 aws iam create-login-profile --user-name $name --password India@123 --password-reset-required
 aws iam add-user-to-group --user-name $name --group-name Avengers
done