#!/bin/bash
source config
yaml_array=(dmcld-default-deploy.template.yaml dmcld-default-configmap.template.yaml dmcld-default-service.template.yaml)
#要将$a分割开，先存储旧的分隔符
OLD_IFS="$IFS"
#设置分隔符
IFS=","
#如下会自动分隔
arr=($DMCLD_V1_SERVER_IDS)
#恢复原来的分隔符
IFS="$OLD_IFS"
#遍历数组
for s in ${arr[@]}
do
    for data in ${yaml_array[@]}
    do
        dmcld-default/build_core.sh $s ${data}
    done
done


