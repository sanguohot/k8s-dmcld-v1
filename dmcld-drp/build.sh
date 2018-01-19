#!/bin/bash
array=(dmcld-drp-deploy.template.yaml dmcld-drp-configmap.template.yaml dmcld-drp-service.template.yaml)
for data in ${array[@]}  
do  
	dmcld-drp/build_core.sh ${data}
done
