#!/bin/bash

mkdir nmap
nmap=$1
while scen_nmap ; do
   if [[ $# -q0 ]]; then
        nmap $nmap | tee -a >> log.txt
   fi
done

   
