# Deployment Guide for Vercel

This guide explains how to properly deploy both the frontend and backend of the Todo application to Vercel.

**IMPORTANT**: The frontend cannot work without a deployed backend API. You must deploy the backend first before deploying the frontend.

## Backend Deployment

### Step 1: Prepare the Backend for Deployment

1. Create a new file `backend/app/core/config.py` (if not already present) with proper environment variable handling:

```python
from pydantic_settings import BaseSettings, SettingsConfigDict
from pydantic import Field
import os

class Settings(BaseSettings):
    model_config = SettingsConfigDict(
        env_file=".env", env_file_encoding="utf-8", extra="ignore"
    )

    PROJECT_NAME: str = "Todo API"
    BETTER_AUTH_SECRET: str = os.getenv("BETTER_AUTH_SECRET", "dev-secret")
    BETTER_AUTH_URL: str = os.getenv("BETTER_AUTH_URL", "http://localhost:3000")
    DATABASE_URL: str = os.getenv("DATABASE_URL", "")

settings = Settings()
```

2. Update the CORS middleware in `backend/app/main.py` to allow Vercel domains:

```python
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000", "http://localhost:3001", "https://*.vercel.app"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
```

### Step 2: Deploy Backend to Vercel

1. Create a new GitHub repository for the backend
2. Push your backend code to the repository
3. Go to [Vercel](https://vercel.com/) and create a new project
4. Import your backend repository
5. Configure the build settings:
   - Framework Preset: None
   - Build Command: `cd backend && pip install -r requirements.txt && uvicorn app.main:app --host 0.0.0.0 --port $PORT`
   - Output Directory: Leave blank
   - Install Command: `cd backend && pip install -r requirements.txt`
6. Add the following environment variables:
   - `DATABASE_URL`: Your PostgreSQL database URL
   - `BETTER_AUTH_SECRET`: A strong secret key for authentication
   - `BETTER_AUTH_URL`: Your frontend URL (e.g., https://your-frontend.vercel.app)
7. Deploy the project
8. Note the deployment URL (e.g., `https://your-backend-app.vercel.app`)

## Frontend Deployment

### Step 1: Update Frontend Configuration

1. In your frontend `.env.local` file, update the API URL to point to your deployed backend:

```
NEXT_PUBLIC_API_URL=https://your-backend-app.vercel.app/api
NEXT_PUBLIC_BETTER_AUTH_URL=https://your-backend-app.vercel.app
BETTER_AUTH_SECRET=your-secret-key
```

### Step 2: Deploy Frontend to Vercel

1. Create a new GitHub repository for the frontend
2. Push your frontend code to the repository
3. Go to [Vercel](https://vercel.com/) and create a new project
4. Import your frontend repository
5. Configure the build settings:
   - Framework Preset: Next.js
6. Add the following environment variables:
   - `NEXT_PUBLIC_API_URL`: Your deployed backend API URL (e.g., `https://your-backend-app.vercel.app/api`)
   - `NEXT_PUBLIC_BETTER_AUTH_URL`: Your deployed backend URL (e.g., `https://your-backend-app.vercel.app`)
   - `BETTER_AUTH_SECRET`: Same secret key used in the backend
7. Deploy the project

## Alternative: Single Deployment with Docker

If you prefer to deploy both frontend and backend together:

1. Create a `vercel.json` file in the root of your project:

```json
{
  "version": 2,
  "builds": [
    {
      "src": "backend/app/main.py",
      "use": "@vercel/python",
      "config": { "maxLambdaSize": "15mb", "runtime": "python3.9" }
    },
    {
      "src": "frontend/next.config.js",
      "use": "@vercel/next"
    }
  ],
  "routes": [
    {
      "src": "/api/(.*)",
      "dest": "backend/app/main.py"
    },
    {
      "src": "/(.*)",
      "dest": "frontend/$1"
    }
  ]
}
```

Note: This approach may not work well with Next.js due to routing conflicts. It's recommended to deploy separately.

## Testing the Deployment

After deployment:

1. Visit your frontend URL (e.g., `https://your-frontend.vercel.app`)
2. Try signing up with a new account
3. Try signing in with the created account
4. The "Failed to fetch" error should be resolved

## Troubleshooting

### "Failed to fetch" Error Persists

1. Check browser developer tools for detailed error messages
2. Verify that your `NEXT_PUBLIC_API_URL` points to the correct backend URL
3. Ensure your backend is deployed and accessible
4. Check that CORS settings in your backend allow requests from your frontend domain
5. Verify that your backend environment variables are correctly set

### Authentication Issues

1. Ensure the `BETTER_AUTH_SECRET` is identical in both frontend and backend
2. Verify that `BETTER_AUTH_URL` in the backend points to your frontend URL
3. Check that JWT tokens are being properly stored and sent with requests

### Database Connection Issues

1. Ensure your `DATABASE_URL` environment variable is correctly set
2. Verify that your database is accessible from Vercel
3. Check that your database credentials are correct