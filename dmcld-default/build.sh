#!/bin/bash
array=(dmcld-default-deploy.template.yaml dmcld-default-configmap.template.yaml dmcld-default-service.template.yaml)
for data in ${array[@]}  
do  
	dmcld-default/build_core.sh ${data}
done
