#!/bin/bash

sed 1d $HOME/.aws/buckets.csv | while read line; do
  IFS=, read Bucket Path Region <<< $line;
  echo $line;
  MountDir=$HOME/S3/$Bucket/$Path;
  [ ! -d "$MountDir" ] && mkdir -p $MountDir;
  s3fs $Bucket:/$Path $MountDir -o passwd_file=$HOME/.aws/passwd-s3fs -o endpoint=$Region -o url="https://s3-$Region.amazonaws.com"
done