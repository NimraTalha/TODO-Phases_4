# Docker Deployment Guide

This guide explains how to deploy the Todo application using Docker and Docker Compose.

## Prerequisites

- Docker Engine (version 20.10 or later)
- Docker Compose (version 2.0 or later)

## Quick Start

To deploy the entire application stack with a single command:

```bash
cd Phase-2
docker-compose up -d
```

The application will be available at:
- Frontend: http://localhost:3000
- Backend API: http://localhost:8000
- Backend API Docs: http://localhost:8000/docs

## Architecture

The Docker deployment consists of three services:
1. **PostgreSQL Database**: Persistent storage for application data
2. **Backend (FastAPI)**: Python API server
3. **Frontend (Next.js)**: React-based user interface

## Building Images

To build the Docker images separately:

```bash
# Build backend image
cd Phase-2/backend
docker build -t todo-backend .

# Build frontend image
cd Phase-2/frontend
docker build -t todo-frontend .
```

## Running with Docker Compose

### Start Services
```bash
cd Phase-2
docker-compose up -d
```

### View Logs
```bash
docker-compose logs -f
```

### Stop Services
```bash
docker-compose down
```

### Stop and Remove Volumes
```bash
docker-compose down -v
```

## Environment Variables

The application uses the following environment variables:

### Backend
- `DATABASE_URL`: PostgreSQL connection string
- `BETTER_AUTH_SECRET`: Secret key for authentication
- `BETTER_AUTH_URL`: Backend URL for auth

### Frontend
- `NEXT_PUBLIC_API_URL`: Backend API URL
- `NEXT_PUBLIC_BETTER_AUTH_URL`: Backend auth URL

These are configured in the `.env` file in the Phase-2 directory.

## Database Migration

On first run, the application will automatically create the required database tables. The database schema is managed by the backend application.

## Production Considerations

For production deployments, consider the following:

1. **Secrets Management**: Use Docker secrets or external vault solutions instead of environment variables for sensitive data.

2. **SSL/TLS**: Add a reverse proxy (like nginx) with SSL termination for secure connections.

3. **Database Backup**: Implement regular database backups using PostgreSQL dump utilities.

4. **Monitoring**: Add monitoring and logging solutions like Prometheus and ELK stack.

5. **Resource Limits**: Define resource limits in docker-compose.yml to prevent resource exhaustion.

Example production-ready docker-compose override:
```yaml
version: '3.8'
services:
  backend:
    deploy:
      resources:
        limits:
          cpus: '0.5'
          memory: 512M
        reservations:
          cpus: '0.25'
          memory: 256M
    restart: unless-stopped
    
  frontend:
    deploy:
      resources:
        limits:
          cpus: '0.5'
          memory: 256M
        reservations:
          cpus: '0.25'
          memory: 128M
    restart: unless-stopped
```

## Troubleshooting

### Common Issues

1. **Port Already in Use**: If ports 3000, 8000, or 5432 are already in use, stop conflicting services or modify the docker-compose.yml file to use different ports.

2. **Database Connection Errors**: Ensure the database service is healthy before starting the backend service. The docker-compose.yml defines proper dependencies.

3. **Build Failures**: Check that all dependencies are properly defined in requirements.txt (for backend) and package.json (for frontend).

### Useful Commands

```bash
# Check running containers
docker ps

# Check container logs
docker logs <container-name>

# Execute commands inside a container
docker exec -it <container-name> sh

# Check Docker Compose service status
docker-compose ps

# Rebuild images
docker-compose build --no-cache
```

## Scaling

To scale the frontend service (for load balancing):
```bash
docker-compose up -d --scale frontend=3
```

Note: For proper load balancing in production, you'd typically add a reverse proxy like nginx in front of multiple frontend instances.

## Updating

To update to a newer version of the application:

1. Pull the latest code
2. Rebuild the images:
   ```bash
   docker-compose build
   ```
3. Restart the services:
   ```bash
   docker-compose up -d
   ```

## Cleanup

To remove all containers, networks, and volumes:
```bash
docker-compose down -v
```

To also remove the built images:
```bash
docker-compose down -v --rmi all
```