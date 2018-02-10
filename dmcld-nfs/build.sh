#!/bin/bash
array=(dmcld-nfs-pv.template.yaml dmcld-nfs-pvc.template.yaml)
for data in ${array[@]}  
do  
	dmcld-nfs/build_core.sh ${data}
done
