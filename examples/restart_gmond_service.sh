#!/bin/bash

##--------------------------------------------------
##
## Script Name: start_gmnod_on_nodes.sh
##
## This script starts the gmond on SLURM cluster nodes
##
## Author: Erol Kahraman (erol.kahraman@tubitak.gov.tr)
## Date: 25.12.2019
## Version: 1.0
##
##--------------------------------------------------


for nodes_no in $(seq 1 80)
do
  if [ $nodes_no -lt 10 ]; then
    echo "node00$nodes_no gmond service is restarting..."
    ssh node00$nodes_no "systemctl restart gmond"
    if [ $? -eq 0 ]; then
      echo "gmond service is restarted successfully"
      echo ""
    else
      echo "Error! gmond service couldn't started"
      echo ""
    fi
  else
    echo "node0$nodes_no gmond service is restarting..."
    ssh node0$nodes_no "systemctl restart gmond"
    if [ $? -eq 0 ]; then
      echo "gmond service is restarted successfully"
      echo ""
    else
      echo "Error! gmond service couldn't started"
      echo ""
    fi
  fi
done
