#!/bin/sh 
OPTIONS=$1
if [ "$OPTIONS" == "compton" ] ; then 
    ./start-Xsession.sh DWM_compton 
else 
    ./start-Xsession.sh DWM 

fi
