#!/bin/bash

find /data/downloads/ ! -path "/data/downloads/databases/*" ! -path "/data/downloads/FILTERED/*"  -mtime +90 -exec rm -Rf -- {} \;