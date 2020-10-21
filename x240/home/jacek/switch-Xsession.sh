#!/bin/sh -x

SESSION=$1
cp xinitrc_${SESSION}.template .xinitrc

echo "logout and login again to use this $SESSION session"
 


