#!/bin/bash
aws iam create-group --group-name JusticeLeague
for name in SuperMan Batman WonderWomen Aquaman
do
 aws iam create-user --user-name $name
 aws iam create-login-profile --user-name $name --password India@123 --password-reset-required
 aws iam add-user-to-group --user-name $name --group-name JusticeLeague
done
