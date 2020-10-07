#!/bin/sh 

BACKUP_TIMESTAMP="$(date '+week_%V__%Y-%m-%d-%H%M%S')"
LOG="/home/kowalczy/Documents/__LOG__home-backup.sh-${BACKUP_TIMESTAMP}.log"

echo "Backup files and folders $(date '+week_%V__%Y-%m-%d-%H%M%S') " 
#>> $LOG 2>&1
ssh m92p "mkdir -p /adata2TB/datasets/priv-with-compression/`hostname`"
rsync  -avz --progress  --exclude=jacek/.cache /home/jacek m92p:/adata2TB/datasets/priv-with-compression/`hostname`/ 
#>> $LOG 2>&1


echo "DONE $(date '+week_%V__%Y-%m-%d-%H%M%S')" 

