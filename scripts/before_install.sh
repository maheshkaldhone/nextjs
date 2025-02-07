
#!/bin/bash

##before_install
export FOLDER=/home/ubuntu/nextjs

if /home/ubuntu/.nvm/versions/node/v18.20.6/bin/pm2 list | grep -q "nextjs"; then
  # Delete the PM2 process for nextjs
  /home/ubuntu/.nvm/versions/node/v18.20.6/bin/pm2 delete nextjs
  /home/ubuntu/.nvm/versions/node/v18.20.6/bin/pm2 save
  echo "Process 'nextjs' deleted from pm2."
else
  echo "Process 'nextjs' not found in pm2."
fi

if [ -d $FOLDER ]; then
    # Remove all contents inside the directory without removing the directory itself
    rm -rf ${FOLDER:?}/*
fi
