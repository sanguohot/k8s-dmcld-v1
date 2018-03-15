#!/bin/bash
IN_CONFIG_FILE=config_other
DMCLD_V1_SERVER_ID=$1
if [ ${DMCLD_V1_SERVER_ID} = "qnsoft" ] ; then
    IN_CONFIG_FILE=config_qnsoft
elif [ ${DMCLD_V1_SERVER_ID} = "test" ] ; then
    IN_CONFIG_FILE=config_test
elif [ ${DMCLD_V1_SERVER_ID} = "other" ] ; then
    IN_CONFIG_FILE=config_other
else
    IN_CONFIG_FILE=config_other
fi
IN_YAML_TEMPLATE_FILE=$2
OUT_YAML_PATH=.tmp/$DMCLD_V1_BASE-$DMCLD_V1_SERVER_ID
OUT_YAML_FILE=${OUT_YAML_PATH}/${IN_YAML_TEMPLATE_FILE/.template./.}

mkdir -p ${OUT_YAML_PATH}

config=`cat dmcld-default/${IN_CONFIG_FILE} \
&& cat dmcld-default/config_util \
#&& echo -e "\nDMCLD_V1_DB_NAME=${DMCLD_V1_DB_NAME}\nDMCLD_V1_SERVER_ID=${DMCLD_V1_SERVER_ID}\n" \
&& cat ./config`
templ=`cat dmcld-default/${IN_YAML_TEMPLATE_FILE}`
printf "$config\ncat << EOF\n$templ\nEOF" | bash > ${OUT_YAML_FILE}
