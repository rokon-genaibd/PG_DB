# PostgreSQL Docker Setup

This setup creates a PostgreSQL database in Docker with the following configurations:

- Database name: nawabii
- User: rokon
- Password: rokon@genaibd.com
- Admin email: rokon@genaibd.com
- Admin password: rokon@2025

## Getting Started

1. Create necessary directories:

```bash
mkdir -p /home/rokon/Desktop/PG_DB/init-scripts
mkdir -p /home/rokon/Desktop/PG_DB/config
```

2. Start the PostgreSQL container:

```bash
cd /home/rokon/Desktop/PG_DB
docker-compose up -d
```

## Connection Information

You can connect to the PostgreSQL database using the following connection string:

# Project Name

## Deployment

This project uses GitHub Actions to automatically deploy to an AWS EC2 instance.

### Setting up GitHub Secrets

Add the following secrets to your GitHub repository:

1. `AWS_SSH_KEY` - Your private SSH key for connecting to the EC2 instance
2. `AWS_HOST` - The hostname or IP address of your EC2 instance
3. `AWS_USERNAME` - The username for SSH connection (e.g., `ec2-user` or `ubuntu`)

### EC2 Configuration

Make sure your EC2 instance:
- Has Git installed
- Has the necessary permissions to access your repository
- Has all required dependencies installed for your application
- Has a directory `~/app` where the application will be deployed

You may need to customize the deployment commands in the GitHub workflow file based on your specific application requirements.

