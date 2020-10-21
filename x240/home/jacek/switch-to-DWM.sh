#!/bin/sh 
OPTIONS=$1
if [ "$OPTIONS" == "compton" ] ; then 
    ./switch-Xsession.sh DWM_compton 
else 
    ./switch-Xsession.sh DWM 

fi
