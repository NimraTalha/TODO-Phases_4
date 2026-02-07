# Deployment Guide for Vercel

This guide explains how to properly deploy both the frontend and backend of the Todo application to Vercel.

**IMPORTANT**: The frontend cannot work without a deployed backend API. You must deploy the backend first before deploying the frontend.

## Backend Deployment

### Step 1: Prepare the Backend for Deployment

1. Update the CORS middleware in `backend/app/main.py` to allow Vercel domains:

```python
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000", "http://localhost:3001", "https://*.vercel.app"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
```

2. We've added the following files to help with deployment:
   - `runtime.txt` - Specifies Python version
   - `Procfile` - Defines the startup command

### Step 2: Deploy Backend to Railway (Recommended)

1. Go to [railway.app](https://railway.app) and sign up with your GitHub account
2. Click "New Project" → "Deploy from GitHub repo"
3. Select your repository containing the backend code
4. Railway will automatically detect it's a Python project
5. Go to "Settings" → "Environment Variables" and add:
   - `DATABASE_URL`: Click "Generate" to create a free PostgreSQL database
   - `BETTER_AUTH_SECRET`: Create a strong random secret (e.g., use a password generator)
   - `BETTER_AUTH_URL`: Your frontend URL (e.g., https://your-frontend.vercel.app)
   - `COHERE_API_KEY`: If you're using AI features (optional)
6. Go to "Deployments" tab and click "Redeploy"
7. Once complete, you'll get a URL like `https://your-project-name.up.railway.app`

### Alternative: Deploy Backend to Render

1. Go to [render.com](https://render.com) and sign up
2. Click "New +" → "Web Service" → "Connect your Git repository"
3. Select your repository containing the backend code
4. Configure the build:
   - Environment: Python
   - Runtime: python-3.11 (or latest)
   - Build Command: `pip install -r requirements.txt`
   - Start Command: `uvicorn app.main:app --host 0.0.0.0 --port $PORT`
5. Add environment variables:
   - `DATABASE_URL`: Create a free PostgreSQL database through Render
   - `BETTER_AUTH_SECRET`: A strong random secret
   - `BETTER_AUTH_URL`: Your frontend URL
   - `COHERE_API_KEY`: If you're using AI features (optional)
6. Click "Create Web Service"
7. Once deployed, you'll get a URL like `https://your-app.onrender.com`

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