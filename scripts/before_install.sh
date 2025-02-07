
#!/bin/bash

##before_install
export FOLDER=/app/nextjs

if PM2_HOME='/home/ubuntu/pm2' pm2 list | grep -q "nextjs"; then
  # Delete the PM2 process for nextjs
  PM2_HOME='/home/ubuntu/pm2' pm2 delete nextjs
  PM2_HOME='/home/ubuntu/pm2' pm2 save
  echo "Process 'nextjs' deleted from pm2."
else
  echo "Process 'nextjs' not found in pm2."
fi

if [ -d $FOLDER ]; then
    # Remove all contents inside the directory without removing the directory itself
    rm -rf ${FOLDER:?}/*
fi
