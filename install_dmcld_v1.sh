#!/bin/bash
# create dmcld_v1
set -o errexit

dmcld-default/build.sh
dmcld-proxy/build.sh
dmcld-drp/build.sh