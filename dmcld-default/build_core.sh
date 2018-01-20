#!/bin/bash
source config
IN_CONFIG_FILE=config
source dmcld-default/${IN_CONFIG_FILE}
DMCLD_V1_SERVER_ID=$1
DMCLD_V1_DB_NAME=$DMCLD_V1_BASE-$DMCLD_V1_SERVER_ID
IN_YAML_TEMPLATE_FILE=$2
OUT_YAML_PATH=.tmp/$DMCLD_V1_BASE-$DMCLD_V1_SERVER_ID
OUT_YAML_FILE=${OUT_YAML_PATH}/${IN_YAML_TEMPLATE_FILE/.template./.}

mkdir -p ${OUT_YAML_PATH}

config=`cat dmcld-default/${IN_CONFIG_FILE} && echo -e "\nDMCLD_V1_DB_NAME=${DMCLD_V1_DB_NAME}\nDMCLD_V1_SERVER_ID=${DMCLD_V1_SERVER_ID}\n" && cat ./${IN_CONFIG_FILE}`
templ=`cat dmcld-default/${IN_YAML_TEMPLATE_FILE}`
printf "$config\ncat << EOF\n$templ\nEOF" | bash > ${OUT_YAML_FILE}
