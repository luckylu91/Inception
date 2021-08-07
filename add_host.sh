#!/bin/bash
result=$(cat /etc/hosts | egrep "127.0.0.1\s+lzins")
if [ -z ]
