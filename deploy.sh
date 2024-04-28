#!/bin/bash

SERVER_USER="root"
SERVER_IP="83-229-85-212.cloud-xip.com"
LOCAL_DIR="./app"
REMOTE_DIR="/var/www/html"

echo "Deploying files from $LOCAL_DIR to $SERVER_USER@$SERVER_IP:$REMOTE_DIR"

# Sync files to the server using rsync
rsync -rlpDvz --delete $LOCAL_DIR/ $SERVER_USER@$SERVER_IP:$REMOTE_DIR
if [ $? -eq 0 ]; then
    echo "Rsync completed successfully."
else
    echo "Rsync failed with status $?"
    exit 1
fi

echo "Deployment complete."
