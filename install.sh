#!/bin/bash
yum update -y
wget s3://url
tar xvzf splunk_pacakge_name.tgz -C /opt
cd /opt
chmod 744 splunk_pacakge_name.rpm
rpm -i splunk_pacakge_name.rpm
./splunk start --accept-license
./splunk enable boot-start
