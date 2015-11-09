#!/bin/bash

INSTANCE_ID=$(cat /usr/local/scripts/instances)

/usr/local/bin/aws ec2 start-instances --instance-ids $INSTANCE_ID