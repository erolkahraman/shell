#!/bin/bash

CAT="/bin/cat"
GR="/bin/grep"
SORT="/bin/sort"
WC="/usr/bin/wc"
UQ="/usr/bin/uniq"
CUT="/bin/cut"
TR="/usr/bin/tr"

CPU_N=$($CAT /proc/cpuinfo | $GR "physical id" | $SORT | $UQ | $WC -l) # Number of CPUs

# CPU COREs
CORE_N=$($CAT /proc/cpuinfo | $GR "cpu cores" | $UQ | $CUT -d: -f 2 | $TR -d " ") # Number of COREs

# HyperTread YES/NO
HT=$($CAT /proc/cpuinfo | $GR "siblings" | $SORT | $UQ | $CUT -d: -f 2 )
clear
printf "==================================\n"
if [ "${HT}" -gt "${CORE_N}" ]; then
        printf "\e[1;32mHyperThread is enabled.\e[0m\n"
        HTCHECK=1
else
        printf "\e[1;31mHyperThread is disabled.\e[0m\n"

fi

PCOREs=$(bc -l <<<$CPU_N*$CORE_N)
VCOREs=$(bc -l <<<$CPU_N*$HT)

printf "Number of physical CPUs\t\t: %s\n" $CPU_N
printf "Number of COREs per CPU\t\t: %s\n" $CORE_N
printf "Total number of physical COREs \t: %d\n" $PCOREs

if [ $HTCHECK ]; then
        printf "Total number of virtual COREs \t: %d\n" $VCOREs
else
        printf "There are no virtual COREs\n"
fi
printf "==================================\n"
