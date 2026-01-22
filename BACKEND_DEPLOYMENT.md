# Backend Deployment Guide

This guide explains how to deploy the Todo App backend to various platforms.

## Deploy to Railway

1. **Create a Railway account** at [railway.app](https://railway.app)

2. **Install Railway CLI** (optional):
   ```bash
   npm install -g @railway/cli
   ```

3. **Deploy using Railway button** (recommended):
   [![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template?template=https://github.com/NimraTalha/TODO-Phases_4)

4. **Or deploy manually**:
   - Fork this repository
   - Connect your GitHub account to Railway
   - Create a new project and select this repository
   - Set the build command to: `cd Phase-4/backend && pip install -r requirements.txt`
   - Set the start command to: `uvicorn app.main:app --host 0.0.0.0 --port $PORT`

5. **Set environment variables** in Railway:
   - `DATABASE_URL`: PostgreSQL database URL
   - `COHERE_API_KEY`: Your Cohere API key (optional)
   - `BETTER_AUTH_SECRET`: Secret key for authentication
   - `BETTER_AUTH_URL`: Frontend URL

## Deploy to Heroku

1. **Create a Heroku account** at [heroku.com](https://heroku.com)

2. **Install Heroku CLI**:
   ```bash
   # For Windows
   choco install heroku-cli
   
   # For macOS
   brew tap heroku/brew && brew install heroku
   
   # For Linux
   curl https://cli-assets.heroku.com/install.sh | sh
   ```

3. **Login to Heroku**:
   ```bash
   heroku login
   ```

4. **Create a new Heroku app**:
   ```bash
   heroku create your-app-name
   ```

5. **Set buildpack**:
   ```bash
   heroku buildpacks:set heroku/python
   ```

6. **Set environment variables**:
   ```bash
   heroku config:set DATABASE_URL="your_database_url"
   heroku config:set COHERE_API_KEY="your_cohere_api_key"
   heroku config:set BETTER_AUTH_SECRET="your_secret"
   heroku config:set BETTER_AUTH_URL="your_frontend_url"
   ```

7. **Deploy**:
   ```bash
   git add .
   git commit -m "Ready for Heroku deployment"
   git push heroku main
   ```

## Deploy to Render

1. **Create a Render account** at [render.com](https://render.com)

2. **Connect your GitHub account** to Render

3. **Create a new Web Service**:
   - Select your forked repository
   - Environment: Python
   - Branch: main
   - Runtime: Python 3.12

4. **Set build command**:
   ```
   cd Phase-4/backend && pip install -r requirements.txt
   ```

5. **Set start command**:
   ```
   uvicorn app.main:app --host 0.0.0.0 --port $PORT
   ```

6. **Set environment variables**:
   - `DATABASE_URL`: PostgreSQL database URL
   - `COHERE_API_KEY`: Your Cohere API key (optional)
   - `BETTER_AUTH_SECRET`: Secret key for authentication
   - `BETTER_AUTH_URL`: Frontend URL

## Deploy using Docker

1. **Build the Docker image**:
   ```bash
   cd Phase-4/backend
   docker build -t todo-backend .
   ```

2. **Run the container**:
   ```bash
   docker run -p 8000:8000 \
     -e DATABASE_URL="postgresql://user:password@host:port/database" \
     -e COHERE_API_KEY="your_cohere_api_key" \
     -e BETTER_AUTH_SECRET="your_secret" \
     -e BETTER_AUTH_URL="your_frontend_url" \
     todo-backend
   ```

3. **Or use docker-compose** (recommended for local development):
   ```bash
   docker-compose up -d
   ```

## Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| `DATABASE_URL` | PostgreSQL database connection string | Yes |
| `COHERE_API_KEY` | Cohere API key for AI features | Optional |
| `BETTER_AUTH_SECRET` | Secret key for authentication | Yes |
| `BETTER_AUTH_URL` | Frontend application URL | Yes |

## Database Setup

The application uses PostgreSQL with SQLModel. When deploying:

1. **For production**, use a managed PostgreSQL service (Railway, AWS RDS, Google Cloud SQL, etc.)

2. **For development**, the docker-compose file includes a PostgreSQL container

3. **Database migrations** happen automatically on startup

## Health Checks

The backend provides health check endpoints:
- `GET /health` - Overall health status
- `GET /test-db` - Database connectivity test
- `GET /api/ping` - API endpoint test

## Scaling

The backend is designed to be horizontally scalable:
- Stateless design
- Database connection pooling
- Compatible with load balancers

## Troubleshooting

1. **Database Connection Issues**:
   - Verify `DATABASE_URL` format: `postgresql://user:password@host:port/database`
   - Check firewall settings if hosted remotely

2. **Environment Variables Missing**:
   - Ensure all required environment variables are set
   - Check for typos in variable names

3. **Port Binding Issues**:
   - Use `$PORT` environment variable in production
   - Default port is 8000 for local development