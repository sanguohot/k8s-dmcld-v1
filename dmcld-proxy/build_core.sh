#!/bin/bash
IN_CONFIG_FILE=config
source dmcld-proxy/${IN_CONFIG_FILE}

DMCLD_V1_PROXY_PORT=$1
DMCLD_V1_PROXY_NAME=
DMCLD_V1_PROXY_IMAGE=
DMCLD_V1_PROXY_PROTOCOL=
DMCLD_V1_PROXY_CONFIG_KEY="first"
if [ ${DMCLD_V1_PROXY_PORT} -eq ${DMCLD_V1_PROXY_PORT_TCP_8888} ] ; then
    DMCLD_V1_PROXY_IMAGE=${DMCLD_V1_PROXY_IMAGE_8888}
    DMCLD_V1_PROXY_NAME="dmcld-v1-proxy-tcp-"${DMCLD_V1_PROXY_PORT}
    DMCLD_V1_PROXY_PROTOCOL="TCP"
elif [ ${DMCLD_V1_PROXY_PORT} -eq ${DMCLD_V1_PROXY_PORT_TCP_8080}  ] ; then
    DMCLD_V1_PROXY_IMAGE=${DMCLD_V1_PROXY_IMAGE_8080}
    DMCLD_V1_PROXY_NAME="dmcld-v1-proxy-tcp-"${DMCLD_V1_PROXY_PORT}
    DMCLD_V1_PROXY_PROTOCOL="TCP"
elif [ ${DMCLD_V1_PROXY_PORT} -eq ${DMCLD_V1_PROXY_PORT_UDP_2022}  ] ; then
    DMCLD_V1_PROXY_IMAGE=${DMCLD_V1_PROXY_IMAGE_2022}
    DMCLD_V1_PROXY_NAME="dmcld-v1-proxy-udp-"${DMCLD_V1_PROXY_PORT}
    DMCLD_V1_PROXY_PROTOCOL="UDP"
    DMCLD_V1_PROXY_CONFIG_KEY="proxy-2022"
else
    DMCLD_V1_PROXY_IMAGE=${DMCLD_V1_PROXY_IMAGE_8888}
    DMCLD_V1_PROXY_NAME="dmcld-v1-proxy-tcp-"${DMCLD_V1_PROXY_PORT}
    DMCLD_V1_PROXY_PROTOCOL="TCP"
fi

IN_YAML_TEMPLATE_FILE=$2
OUT_YAML_PATH=".tmp/proxy-"${DMCLD_V1_PROXY_PORT}
OUT_YAML_FILE=${OUT_YAML_PATH}/${IN_YAML_TEMPLATE_FILE/.template./.}

mkdir -p ${OUT_YAML_PATH}

config=`cat dmcld-proxy/${IN_CONFIG_FILE} && echo -e "\nDMCLD_V1_PROXY_CONFIG_KEY=${DMCLD_V1_PROXY_CONFIG_KEY}\nDMCLD_V1_PROXY_PROTOCOL=${DMCLD_V1_PROXY_PROTOCOL}\nDMCLD_V1_PROXY_NAME=${DMCLD_V1_PROXY_NAME}\nDMCLD_V1_PROXY_PORT=${DMCLD_V1_PROXY_PORT}\nDMCLD_V1_PROXY_IMAGE=${DMCLD_V1_PROXY_IMAGE}\n" && cat ./${IN_CONFIG_FILE}`
util_config=`cat ./${IN_CONFIG_FILE}`
templ=`cat dmcld-proxy/${IN_YAML_TEMPLATE_FILE}`
printf "$config\ncat << EOF\n$templ\nEOF" | bash > ${OUT_YAML_FILE}
