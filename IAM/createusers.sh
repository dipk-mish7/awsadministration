#!/bin/bash

for name in BlackPanther CaptainAmerica Thor Hulk BlackWidow Groot Nebula Spiderman
do
 aws iam create-user --user-name $name
done
