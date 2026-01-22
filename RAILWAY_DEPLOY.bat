@echo off
echo.
echo ========================================================
echo        Todo App Backend - Railway Deployment
echo ========================================================
echo.
echo This script will guide you through deploying your 
echo backend to Railway for FREE!
echo.
echo Railway offers 500 free hours/month which is perfect
echo for development and small projects.
echo.
echo STEP 1: Create Railway Account
echo --------------------------------------------------------
echo 1. Open your browser and go to: https://railway.app
echo 2. Sign up using your GitHub account (recommended)
echo 3. Verify your email address
echo.
echo STEP 2: Install Railway CLI (Optional but recommended)
echo --------------------------------------------------------
echo Run in PowerShell/CMD as administrator:
echo npm install -g @railway/cli
echo.
echo STEP 3: Deploy to Railway
echo --------------------------------------------------------
echo Option A - Using Railway Dashboard (Easiest):
echo 1. Go to https://railway.app/dashboard
echo 2. Click "New Project"
echo 3. Select "Deploy from GitHub repo"
echo 4. Choose your forked repository: NimraTalha/TODO-Phases_4
echo 5. Select the Phase-4/backend directory
echo 6. Railway will automatically detect it's a Python app
echo 7. Click "Deploy"
echo.
echo Option B - Using Railway CLI:
echo 1. Open CMD/Powershell in this directory
echo 2. Run: railway login
echo 3. Run: railway init
echo 4. Run: railway link
echo 5. Run: railway up
echo.
echo STEP 4: Configure Environment Variables
echo --------------------------------------------------------
echo After deployment, go to your project in Railway dashboard:
echo 1. Click on "Variables" tab
echo 2. Add these variables:
echo    - DATABASE_URL (Railway will provide PostgreSQL addon)
echo    - BETTER_AUTH_SECRET=your-random-secret-string
echo    - BETTER_AUTH_URL=https://your-frontend-url.vercel.app
echo    - COHERE_API_KEY (optional, leave blank if not using AI)
echo.
echo STEP 5: Add PostgreSQL Database (Free Tier)
echo --------------------------------------------------------
echo 1. In your Railway project dashboard
echo 2. Click "New" -> "Database"
echo 3. Select "PostgreSQL" 
echo 4. Choose "Free" tier
echo 5. Connect it to your backend service
echo 6. Railway will automatically populate DATABASE_URL
echo.
echo.
echo IMPORTANT NOTES:
echo --------------------------------------------------------
echo - The free tier gives you 500 hours/month
echo - Database free tier has 10,000 rows limit
echo - Perfect for development and small projects
echo - For production, you may need to upgrade later
echo.
echo TROUBLESHOOTING:
echo --------------------------------------------------------
echo If deployment fails:
echo 1. Check that your repository is public
echo 2. Verify all environment variables are set
echo 3. Ensure the Dockerfile in Phase-4/backend is correct
echo 4. Check logs in Railway dashboard
echo.
echo.
echo Press any key to open Railway website...
pause >nul
start https://railway.app
echo.
echo Deployment guide saved in RAILWAY_GUIDE.md
echo Opening guide file...
start "" "RAILWAY_GUIDE.md"
pause