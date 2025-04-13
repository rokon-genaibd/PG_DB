#!/bin/bash

# Create required directories
mkdir -p /home/rokon/Desktop/PG_DB/init-scripts
mkdir -p /home/rokon/Desktop/PG_DB/config

# Set permissions for scripts
chmod +x /home/rokon/Desktop/PG_DB/setup.sh

# Start PostgreSQL container
cd /home/rokon/Desktop/PG_DB
docker-compose up -d

# Wait for PostgreSQL to start
echo "Waiting for PostgreSQL to start..."
sleep 10

# Display connection information
echo "PostgreSQL is now running!"
echo "Connection URL: postgresql://rokon:rokon@genaibd.com@$(curl -s http://checkip.amazonaws.com):5432/nawabii"
echo "Make sure port 5432 is open in your EC2 security group"
