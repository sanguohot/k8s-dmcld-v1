#!/bin/bash
IN_CONFIG_FILE=config
source dmcld-other/${IN_CONFIG_FILE}
IN_YAML_TEMPLATE_FILE=$1
OUT_YAML_PATH=.tmp/other
OUT_YAML_FILE=${OUT_YAML_PATH}/${IN_YAML_TEMPLATE_FILE/.template./.}

mkdir -p ${OUT_YAML_PATH}

config=`cat dmcld-other/${IN_CONFIG_FILE} && echo -e "\n" && cat ./${IN_CONFIG_FILE}`
templ=`cat dmcld-other/${IN_YAML_TEMPLATE_FILE}`
printf "$config\ncat << EOF\n$templ\nEOF" | bash > ${OUT_YAML_FILE}
