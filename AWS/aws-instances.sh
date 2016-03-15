#!/bin/bash

if [ -e /usr/local/scripts/instances ]; then
    echo "Cleaning instances file..."
    cp /dev/null /usr/local/scripts/instances
    echo "Updating instances ID's..."
    /usr/bin/aws ec2 describe-tags --filters "Name=tag:Shutdown,Values=1" | tr [:upper:] [:lower:] | tr -d '"' | grep resourceid | tr -d ',' | awk -F: '{print $2}' >> /usr/local/scripts/instances
    echo "Instance File Updated"
else

    echo "Creating Instances File"
    touch /usr/local/scripts/instances

    if [ -e /usr/local/scripts/instances ]; then
   echo "Updating instances ID's..."
       /usr/bin/aws ec2 describe-tags --filters "Name=tag:Shutdown,Values=1" | tr [:upper:] [:lower:] | tr -d '"' | grep resourceid | tr -d ',' | awk -F: '{print $2}' >> /usr/local/scripts/instances
   echo "Instance File Updated"
    fi
fi


