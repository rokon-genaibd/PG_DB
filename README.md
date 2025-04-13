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

