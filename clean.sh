#!/bin/bash
# create dmcld_v1
source k8s_core.sh
list_alldir /opt/k8s_install/yml/dmcld-v1/.tmp clean
rm -rf .tmp