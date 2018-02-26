#!/bin/bash
IN_CONFIG_FILE=config
source dmcld-nfs/${IN_CONFIG_FILE}
IN_YAML_TEMPLATE_FILE=$1
OUT_YAML_PATH=.tmp/nfs
OUT_YAML_FILE=${OUT_YAML_PATH}/${IN_YAML_TEMPLATE_FILE/.template./.}

mkdir -p ${OUT_YAML_PATH}

config=`cat dmcld-nfs/${IN_CONFIG_FILE} && echo -e "\n" && cat ./${IN_CONFIG_FILE}`
templ=`cat dmcld-nfs/${IN_YAML_TEMPLATE_FILE}`
printf "$config\ncat << EOF\n$templ\nEOF" | bash > ${OUT_YAML_FILE}