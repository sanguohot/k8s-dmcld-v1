#!/bin/bash
source dmcld-proxy/config_util
yaml_array=(dmcld-proxy-deploy.template.yaml dmcld-proxy-configmap.template.yaml dmcld-proxy-service.template.yaml proxy-config.template)
#要将$a分割开，先存储旧的分隔符
OLD_IFS="$IFS"
#设置分隔符
IFS=","
#如下会自动分隔
arr=($DMCLD_V1_PROXY_PORTS)
#恢复原来的分隔符
IFS="$OLD_IFS"
#遍历数组
for s in ${arr[@]}
do
    for data in ${yaml_array[@]}
    do
        dmcld-proxy/build_core.sh $s ${data}
    done
done


