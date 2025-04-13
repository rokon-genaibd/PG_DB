#!/bin/bash

# Exit on any error
set -e

# Check if Docker and Docker Compose are installed
if ! command -v docker &> /dev/null; then
  echo "Docker is not installed. Please install Docker first."
  exit 1
fi

# Create required directories
mkdir -p config
mkdir -p init-scripts

# Set permissions for scripts
chmod +x setup.sh

# Load environment variables
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
else
  echo "Error: .env file missing. Please create it with the required variables."
  exit 1
fi

# Check if container is already running and stop it if needed
if docker ps | grep -q "nawabii-postgres"; then
  echo "Stopping existing PostgreSQL container..."
  docker-compose down
fi

# Start PostgreSQL container
echo "Starting PostgreSQL container..."
docker-compose up -d

# Wait for PostgreSQL to start
echo "Waiting for PostgreSQL to start..."
sleep 5

# Check container status
if [ "$(docker inspect -f '{{.State.Running}}' nawabii-postgres 2>/dev/null)" != "true" ]; then
  echo "Container failed to start. Checking logs:"
  docker-compose logs
  exit 1
fi

# Wait for PostgreSQL to be ready
echo "Checking PostgreSQL readiness..."
for i in {1..30}; do
  if docker exec nawabii-postgres pg_isready -U ${DB_USER} -d ${DB_NAME}; then
    break
  fi
  echo "Waiting for PostgreSQL to be ready... ($i/30)"
  sleep 2
  if [ $i -eq 30 ]; then
    echo "PostgreSQL failed to become ready. Please check logs:"
    docker-compose logs
    exit 1
  fi
done

# Display connection information
echo "✅ PostgreSQL is now running!"
public_ip=$(curl -s http://checkip.amazonaws.com || echo "localhost")
echo ""
echo "-------------------------------------------------------------------"
echo "🔌 Local Connection URL: postgresql://${DB_USER}:${DB_PASSWORD}@localhost:5432/${DB_NAME}"
echo "🌐 Remote Connection URL: postgresql://${DB_USER}:${DB_PASSWORD}@${public_ip}:5432/${DB_NAME}"
echo "-------------------------------------------------------------------"
echo ""
echo "⚠️  Important: Make sure port 5432 is open in your firewall or security group"
echo "📝 Database name: ${DB_NAME}"
echo "👤 User: ${DB_USER}"

# Show container status
echo ""
echo "Container status:"
docker ps --filter "name=nawabii-postgres"
