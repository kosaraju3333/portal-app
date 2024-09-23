#!/bin/bash

###################################################################
#                                                                 #
# This Script will download the portal app artifacts from AWS s3  #
#                                                                 #
###################################################################

## working directory
working_dir=/home/ubuntu/portal-app

source_code=portal-app-V0.1.tar.gz

### Creating /home/ubuntu/portal-spontansolutions directory if not present
if [ -d "$working_dir" ];
then
    echo "$working_dir is already exist"
else
    echo "********** creating $working_dir directory **********"
    mkdir $working_dir
fi

## Downloading portal app artifactory from AWS S3
echo "********** Downloading portal app artifactory from AWS S3 **********"
aws s3 cp s3://portal-app-spontansolutions/$source_code $working_dir

## Extracting portal app artifactory
echo "********** Extracting portal app artifactory **********"
tar -xvf $working_dir/$source_code -C $working_dir

## Removing portal app artifactory
echo "********** Deleting portal app artifactory ********** "
rm -rf $working_dir/$source_code


