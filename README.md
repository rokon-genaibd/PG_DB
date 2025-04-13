# PostgreSQL Docker Setup

This repository contains a containerized PostgreSQL database setup that can be deployed locally or to a remote server and accessed from anywhere.

## Configuration Details

- Database name: nawabii
- User: rokon
- Password: rokon@genaibd.com
- Admin email: rokon@genaibd.com
- Admin password: rokon@2025

## Quick Start

1. Clone this repository
2. Run the setup script:

```bash
./setup.sh
```

This will:
- Check for required dependencies
- Create necessary directories
- Start the PostgreSQL container
- Display connection information

## Remote Access

The PostgreSQL database is configured to accept connections from any IP address. To connect from a remote machine:

1. Make sure port 5432 is open in your firewall/security group
2. Use the connection string provided when the setup script completes
3. For EC2 or cloud deployments, use your server's public IP or domain name

Example connection string:
```
postgresql://rokon:rokon@genaibd.com@<your-server-ip>:5432/nawabii
```

## Connecting with Tools

### Using psql

```bash
psql -h <your-server-ip> -p 5432 -U rokon -d nawabii
```

### Using a GUI Client (e.g., pgAdmin, DBeaver)

- Host: <your-server-ip>
- Port: 5432
- Database: nawabii
- Username: rokon
- Password: rokon@genaibd.com

## Security Considerations

- The database is configured to accept connections from any IP
- For production use, consider restricting access in `pg_hba.conf` to specific IPs
- Change default passwords for production environments

## Deployment with GitHub Actions

This project includes a GitHub Actions workflow for automatic deployment to an EC2 instance.

### Setting up GitHub Secrets

Add the following secrets to your GitHub repository:

1. `AWS_SSH_KEY` - Your private SSH key for connecting to the EC2 instance
2. `AWS_HOST` - The hostname or IP address of your EC2 instance
3. `AWS_USERNAME` - The username for SSH connection (e.g., `ec2-user` or `ubuntu`)

### Manual Deployment

If you prefer to deploy manually to your server:

1. Copy all files to your server
2. Run the setup script:
   ```bash
   ./setup.sh
   ```

## Project Structure

```
.
├── .env                    # Environment variables (DB credentials)
├── .github/workflows/      # GitHub Actions workflow for deployment
├── config/                 # PostgreSQL configuration files
│   ├── pg_hba.conf         # Client authentication configuration
│   └── postgresql.conf     # Main PostgreSQL configuration
├── docker-compose.yml      # Docker Compose configuration
├── init-scripts/           # Initialization scripts (run on first startup)
│   └── init-db.sql         # Creates initial database structure
├── README.md               # This file
└── setup.sh                # Setup script
```

