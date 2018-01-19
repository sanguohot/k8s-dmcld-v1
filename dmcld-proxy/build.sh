#!/bin/bash
array=(dmcld-proxy-deploy.template.yaml dmcld-proxy-configmap.template.yaml dmcld-proxy-service.template.yaml proxy-config.template)
for data in ${array[@]}  
do  
	dmcld-proxy/build_core.sh ${data}
done
