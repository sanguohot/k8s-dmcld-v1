#!/bin/bash
array=( \ 
		dmcld-simsrv-deploy.template.yaml \ 
		dmcld-simsrv-configmap.template.yaml \ 
		dmcld-simsrv-service.template.yaml \ 
		dmcld-javaweb-deploy.template.yaml \ 
		dmcld-javaweb-configmap.template.yaml \ 
		dmcld-javaweb-service.template.yaml \ 
		)
for data in ${array[@]}  
do  
	dmcld-other/build_core.sh ${data}
done
