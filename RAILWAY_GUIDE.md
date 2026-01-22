# 🚀 Deploy Todo App Backend to Railway (Free)

This guide will help you deploy your Todo App backend to [Railway](https://railway.app) for free! Railway offers 500 free hours/month which is perfect for development and small projects.

## 🎯 What You'll Get
- Free hosting for your FastAPI backend
- Free PostgreSQL database (10,000 rows limit)
- Automatic SSL/HTTPS
- Continuous deployment from GitHub
- Environment variable management
- Real-time logs and monitoring

## 📋 Prerequisites
- GitHub account
- GitHub repository: `NimraTalha/TODO-Phases_4` (your fork)
- Internet connection

## 🚀 Step-by-Step Deployment

### Step 1: Create Railway Account
1. Go to [https://railway.app](https://railway.app)
2. Click "Sign Up" 
3. Sign in with your GitHub account (recommended)
4. Verify your email address

### Step 2: Deploy Your Backend

#### Option A: Deploy from Dashboard (Recommended)
1. Go to [https://railway.app/dashboard](https://railway.app/dashboard)
2. Click "New Project" 
3. Select "Deploy from GitHub repo"
4. Choose your repository: `NimraTalha/TODO-Phases_4`
5. Select the `Phase-4/backend` directory
6. Railway will automatically detect it's a Python/FastAPI application
7. Click "Deploy"

#### Option B: Using Railway CLI
```bash
# Install Railway CLI
npm install -g @railway/cli

# Login to Railway
railway login

# Initialize project (run in your repo directory)
railway init

# Link to your Railway project
railway link

# Deploy
railway up
```

### Step 3: Configure Environment Variables
After successful deployment:

1. In your Railway project dashboard, click on your backend service
2. Go to the "Variables" tab
3. Add these environment variables:

```
DATABASE_URL=postgresql://... # (Will be auto-filled by PostgreSQL addon)
BETTER_AUTH_SECRET=generate-a-random-secret-string-at-least-32-characters-long
BETTER_AUTH_URL=https://your-frontend-domain.vercel.app # Replace with your actual frontend URL
COHERE_API_KEY=your-cohere-api-key-if-using-ai-features # Optional
```

### Step 4: Add PostgreSQL Database (Free Tier)
1. In your Railway project dashboard
2. Click "New" → "Database" 
3. Select "PostgreSQL"
4. Choose "Free" tier (10,000 rows, 100 connections)
5. Click "Deploy"
6. Railway will automatically connect it and populate the `DATABASE_URL`

### Step 5: Configure Service Settings
1. Click on your backend service
2. Go to "Settings" 
3. Under "HTTP Routes", ensure your service is exposed
4. Check "Generate Domain" to get a free railway.app domain

## 🔧 Configuration Details

### Dockerfile Used
Your backend already has a Dockerfile in `Phase-4/backend/` that:
- Uses Python 3.12-slim as base
- Installs dependencies from requirements.txt
- Exposes port 8000
- Runs with Uvicorn server

### Requirements.txt Includes
- FastAPI (modern Python web framework)
- Uvicorn (ASGI server)
- SQLModel (SQL toolkit)
- PostgreSQL drivers
- Authentication libraries
- Cohere for AI features

## 🌐 Accessing Your Backend
Once deployed, you'll get a URL like:
```
https://your-project-name-production.up.railway.app
```

Your API endpoints will be available at:
- `GET /health` - Health check
- `GET /api/ping` - API test
- `POST /api/auth/register` - User registration
- `POST /api/tasks` - Task management
- `POST /api/chat` - AI chat (if Cohere is configured)

## 🔄 Auto-Deployment
After initial setup:
- Any push to your GitHub repository will trigger automatic deployment
- You can disable this in Settings → GitHub Integration

## 💰 Free Tier Limits
- **Runtime**: 500 hours/month (about 20 days of continuous uptime)
- **Database**: 10,000 rows, 100 connections
- **Storage**: 1 GB per service
- **Bandwidth**: 100 GB/month

## 🛠️ Troubleshooting

### Common Issues:

1. **Deployment fails with "Module not found"**
   - Check that requirements.txt is in the correct directory
   - Verify all dependencies are listed correctly

2. **Database connection errors**
   - Ensure PostgreSQL addon is deployed and connected
   - Check that DATABASE_URL variable is set correctly

3. **Environment variables not working**
   - Verify variable names match exactly what the code expects
   - Check for typos in variable names or values

4. **Port binding issues**
   - The app should use the PORT environment variable
   - Default is 8000 if PORT is not set

### Checking Logs:
1. In Railway dashboard, click on your service
2. Go to "Logs" tab
3. Monitor real-time logs for errors

## 🚀 Connecting Frontend
When you deploy your frontend to Vercel:
1. Update the `NEXT_PUBLIC_API_URL` in your frontend to point to your Railway backend URL
2. Example: `https://your-project-name-production.up.railway.app`

## 📞 Support
If you encounter issues:
1. Check the logs in Railway dashboard
2. Verify all environment variables are set
3. Ensure your GitHub repository is public
4. Confirm the Dockerfile exists in the correct location

---

## 🎉 Congratulations!
Your Todo App backend is now deployed and ready to use! The free tier is perfect for development, testing, and small-scale production use.

Remember to monitor your usage to stay within the free tier limits. For higher traffic applications, you can upgrade later.