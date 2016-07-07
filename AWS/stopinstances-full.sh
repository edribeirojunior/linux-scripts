#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

#Set Shell Variable SML, runs command where TAG SML is equal "1".  
SML=$(/usr/bin/aws ec2 describe-tags --filters "Name=tag:SML,Values=1" | tr [:upper:] [:lower:] | tr -d '"' | grep resourceid | tr -d ',' | awk -F: '{print $2}')

# Stop instances 
/usr/bin/aws ec2 stop-instances --instance-ids $SML
