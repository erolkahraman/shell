#!/usr/bin/bash


list_image() {
    images=$(docker image ls | awk '{print $1,$2,$3}' | tail -n +2 | cut )
    echo ${images[0]}
    # for eleman in "${images[*]}"
    # do
    #     echo $eleman
    #     echo =======
    # done
}

list_image