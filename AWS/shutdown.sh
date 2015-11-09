#!/bin/bash

INSTANCE_ID=$(cat /usr/local/scripts/instances)


/usr/local/bin/aws ec2 stop-instances --instance-ids $INSTANCE_ID