#!/bin/bash
# create dmcld_v1
source config
source dmcld-default/config
kubectl delete -f .tmp/${DMCLD_V1_SERVER_ID}/
kubectl delete -f .tmp/proxy/
kubectl delete -f .tmp/other/
kubectl delete -f .tmp/drp/
rm -rf .tmp