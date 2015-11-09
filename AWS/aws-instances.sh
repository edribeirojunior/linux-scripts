#!/bin/bash

if [ -s /usr/local/scripts/instances ]; then
    echo "Updating instances ID's"
    aws ec2 describe-tags --filters "Name=tag:Startup,Values=1" | tr [:upper:] [:lower:] | tr -d '"' | grep resourceid | tr -d ',' | awk -F: '{print $2}' >> /usr/local/scripts/instances

else

    echo "Creating Instances File"
    touch /usr/local/scripts/instances

    if [ -s /usr/local/scripts/instances ]; then
           echo "Updating instances ID's"
           aws ec2 describe-tags --filters "Name=tag:Startup,Values=1" | tr [:upper:] [:lower:] | tr -d '"' | grep resourceid | tr -d ',' | awk -F: '{print $2}' >> /usr/local/scripts/instances
    fi
fi




