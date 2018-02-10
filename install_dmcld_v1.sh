#!/bin/bash
# create dmcld_v1
set -o errexit
#先build nfs
dmcld-nfs/build.sh
dmcld-default/build.sh
dmcld-proxy/build.sh
dmcld-drp/build.sh