#!/bin/bash

read -p "aws_access_key_id: " AWS_ACCESS_KEY_ID
read -p "aws_secret_access_key: " AWS_SECRET_ACCESS_KEY

[ ! -d "$HOME/.aws" ] && mkdir $HOME/.aws;

echo "$AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY" > $HOME/.aws/passwd-s3fs
chmod 600 $HOME/.aws/passwd-s3fs

cp -t $HOME/.aws ./mount-s3-drives.sh ./buckets.csv
sed "s#Exec=~#Exec=$HOME#g" ./mount-s3-drives.desktop > $HOME/.config/autostart/mount-s3-drives.desktop;