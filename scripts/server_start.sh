#!/bin/bash
#server_start
# Navigate to app folder
cd /app/nextjs

if PM2_HOME='/home/ubuntu/pm2' pm2 list | grep -q "nextjs"; then
  # Delete the PM2 process for nextjs
  PM2_HOME='/home/ubuntu/pm2' pm2 delete nextjs
  echo "Process 'nextjs' deleted from pm2."
else
  echo "Process 'nextjs' not found in pm2."
fi

# Start the application 
PM2_HOME='/home/ubuntu/pm2' pm2 start npm --name "nextjs" -- run start

# Freeze process list for automatic respawn
PM2_HOME='/home/ubuntu/pm2' pm2 save

# Restart all processes
# pm2 restart all
