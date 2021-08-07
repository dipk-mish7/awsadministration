#!/bin/bash

for name in BlackPanther CaptainAmerica Thor Hulk BlackWidow Groot Nebula Spiderman
do
 aws iam create-user --user-name $name
 aws iam create-login-profile --user-name $name --password India@123 --password-reset-required
done
