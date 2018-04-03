#!/bin/bash
IN_CONFIG_FILE=

DMCLD_V1_PROXY_PORT=$1
DMCLD_V1_PROXY_NAME=
DMCLD_V1_PROXY_IMAGE=
DMCLD_V1_PROXY_PROTOCOL=
DMCLD_V1_PROXY_CONFIG_KEY="first"
if [ ${DMCLD_V1_PROXY_PORT} -eq 8888 ] ; then
    IN_CONFIG_FILE=config_tcp_8888
elif [ ${DMCLD_V1_PROXY_PORT} -eq 8080  ] ; then
    IN_CONFIG_FILE=config_tcp_8080
elif [ ${DMCLD_V1_PROXY_PORT} -eq 2022  ] ; then
    IN_CONFIG_FILE=config_udp_2022
elif [ ${DMCLD_V1_PROXY_PORT} -eq 4042  ] ; then
    IN_CONFIG_FILE=config_udp_4042
elif [ ${DMCLD_V1_PROXY_PORT} -eq 5052  ] ; then
    IN_CONFIG_FILE=config_udp_5052
else
    echo "\nUnexpeced error proxy port ${DMCLD_V1_PROXY_PORT}\n"
    exit 1
fi

IN_YAML_TEMPLATE_FILE=$2
OUT_YAML_PATH=".tmp/proxy-"${DMCLD_V1_PROXY_PORT}
OUT_YAML_FILE=${OUT_YAML_PATH}/${IN_YAML_TEMPLATE_FILE/.template./.}

mkdir -p ${OUT_YAML_PATH}

config=`cat dmcld-proxy/${IN_CONFIG_FILE} && echo -e "\n" && cat dmcld-proxy/config_util`
templ=`cat dmcld-proxy/${IN_YAML_TEMPLATE_FILE}`
printf "$config\ncat << EOF\n$templ\nEOF" | bash > ${OUT_YAML_FILE}
