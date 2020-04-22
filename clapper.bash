#!/usr/bin/env bash

## Usage: clapper.bash [start|stop] 
## Start - starts all ec2 instances with tag 'Clapper:Yes'
## Stop  - stopps all ec2 instances with tag 'Clapper:Yes'

## designed to be run as cron job 
## The valid values for instance-state-code:
## 0 (pending), 16 (running), 32 (shutting-down), 48 (terminated), 64 (stopping), and 80 (stopped)


## optional functions: getAllRunning; getAllStopped; getAllTagClapper; listAllTagClapper; listAllRunningTagClapper; listAllStoppedTagClapper


ENDPOINT_URL="https://ec2.us-iso-east-1.c2s.ic.gov"

function getAllRunning {
	aws ec2 describe-instances --endpoint-url $ENDPOINT_URL --ca-bundle /etc/pki/tls/cert.pem --filter Name=instance-state-code,Values=16
}


function getAllStopped {
	aws ec2 describe-instances --endpoint-url $ENDPOINT_URL --ca-bundle /etc/pki/tls/cert.pem --filter Name=instance-state-code,Values=80
}


function getAllTagClapper {
	aws ec2 describe-instances --endpoint-url $ENDPOINT_URL --ca-bundle /etc/pki/tls/cert.pem --filter Name=tag:Clapper,Values=Yes
}

function listAllTagClapper {
	aws ec2 describe-instances --endpoint-url $ENDPOINT_URL --ca-bundle /etc/pki/tls/cert.pem \
	--filter Name=tag:Clapper,Values=Yes | grep InstanceId | awk '{print $2}' | sed 's/"//g' | sed 's/,//g'
}


function listAllRunningTagClapper {
	aws ec2 describe-instances --endpoint-url $ENDPOINT_URL --ca-bundle /etc/pki/tls/cert.pem \
	--filter Name=tag:Clapper,Values=Yes Name=instance-state-code,Values=16 | \
	grep InstanceId | awk '{print $2}' | sed 's/"//g' | sed 's/,//g'


}

function listAllStoppedTagClapper {
	aws ec2 describe-instances --endpoint-url $ENDPOINT_URL --ca-bundle /etc/pki/tls/cert.pem \
	--filter Name=tag:Clapper,Values=Yes Name=instance-state-code,Values=80 | \
	grep InstanceId | awk '{print $2}' | sed 's/"//g' | sed 's/,//g'


}



function start {
	for i in $(listAllStoppedTagClapper) ; do \
		aws ec2 start-instances \
		--region us-east-1 \
		--endpoint https://ec2.us-iso-east-1.c2s.ic.gov \
		--instance-id $i ; \
		done
}


function stop {
	for i in $(listAllRunningTagClapper) ; do \
		aws ec2 stop-instances \
		--region us-east-1 \
		--endpoint https://ec2.us-iso-east-1.c2s.ic.gov \
		--instance-ids $i ; \
		done
}

### expands the args to call desired function
"$@"




