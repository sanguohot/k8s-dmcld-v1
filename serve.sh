#!/bin/bash
# create dmcld_v1
set -o errexit
./install_dmcld_v1.sh
source k8s_core.sh
list_alldir ./.tmp serve