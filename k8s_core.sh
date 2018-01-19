#!/bin/bash
clean="clean"
serve="serve"
list_alldir(){
    for file2 in `ls -a $1`
    do
        if [ x"$file2" != x"." -a x"$file2" != x".." ];then
            if [ -d "$1/$file2" ];then
                if [ "$2" == "$clean" ]
                then
                   kubectl delete -f $1/$file2
                else
                   kubectl create -f $1/$file2
                fi
                list_alldir "$1/$file2"
            fi
        fi
    done
}