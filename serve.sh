#!/bin/bash
# create dmcld_v1
set -o errexit
source config
source dmcld-default/config
./install_dmcld_v1.sh
kubectl create -f .tmp/${DMCLD_V1_SERVER_ID}/
kubectl create -f .tmp/proxy/
kubectl create -f .tmp/other/
kubectl create -f .tmp/drp/