@echo off
echo.
echo ================================================
echo    Todo App Backend Deployment Script
echo ================================================
echo.
echo This script will help you deploy the backend
echo to your chosen platform.
echo.
echo Available options:
echo 1. Deploy to Railway (Recommended)
echo 2. Deploy to Heroku
echo 3. Deploy to Render
echo 4. Deploy locally with Docker
echo 5. Deploy to AWS
echo 6. Deploy to Google Cloud
echo 7. Exit
echo ================================================
echo.

set /p choice="Enter your choice (1-7): "

if "%choice%"=="1" (
    goto railway
) else if "%choice%"=="2" (
    goto heroku
) else if "%choice%"=="3" (
    goto render
) else if "%choice%"=="4" (
    goto docker
) else if "%choice%"=="5" (
    goto aws
) else if "%choice%"=="6" (
    goto gcp
) else if "%choice%"=="7" (
    goto exit
) else (
    echo Invalid choice. Please try again.
    pause
    cls
    start "" "%~dpnx0"
    exit
)

:railway
echo.
echo ================================================
echo           Deploying to Railway
echo ================================================
echo.
echo 1. Go to https://railway.app and create an account
echo 2. Fork this repository to your GitHub account
echo 3. Click "Deploy on Railway" button in BACKEND_DEPLOYMENT.md
echo 4. Follow the prompts to connect your repository
echo 5. Set the required environment variables
echo.
echo OR use Railway CLI:
echo - Install: npm install -g @railway/cli
echo - Login: railway login
echo - Link: railway link
echo - Deploy: railway up
echo.
pause
goto end

:heroku
echo.
echo ================================================
echo            Deploying to Heroku
echo ================================================
echo.
echo 1. Go to https://heroku.com and create an account
echo 2. Install Heroku CLI: choco install heroku-cli (Windows)
echo 3. Login: heroku login
echo 4. Create app: heroku create your-app-name
echo 5. Set buildpack: heroku buildpacks:set heroku/python
echo 6. Set config vars: heroku config:set KEY=VALUE
echo 7. Deploy: git push heroku main
echo.
pause
goto end

:render
echo.
echo ================================================
echo            Deploying to Render
echo ================================================
echo.
echo 1. Go to https://render.com and create an account
echo 2. Connect your GitHub account
echo 3. Create a new Web Service
echo 4. Select your forked repository
echo 5. Set runtime to Python 3.12
echo 6. Set build command: cd Phase-4/backend && pip install -r requirements.txt
echo 7. Set start command: uvicorn app.main:app --host 0.0.0.0 --port $PORT
echo 8. Set environment variables
echo.
pause
goto end

:docker
echo.
echo ================================================
echo       Deploying locally with Docker
echo ================================================
echo.
echo Make sure you have Docker Desktop installed
echo.
echo 1. Open PowerShell/CMD as Administrator
echo 2. Navigate to the project directory
echo 3. Run: docker-compose up -d
echo 4. The backend will be available at http://localhost:8000
echo.
echo To stop: docker-compose down
echo.
pause
goto end

:aws
echo.
echo ================================================
echo            Deploying to AWS
echo ================================================
echo.
echo Using AWS Elastic Beanstalk:
echo 1. Go to AWS Console -> Elastic Beanstalk
echo 2. Create a new application
echo 3. Upload the Phase-4/backend directory as a ZIP
echo 4. Set environment variables in Configuration
echo 5. Deploy
echo.
echo Alternative: Use AWS Fargate with ECS
echo 1. Build Docker image: docker build -t todo-backend .
echo 2. Push to ECR and deploy with Fargate
echo.
pause
goto end

:gcp
echo.
echo ================================================
echo          Deploying to Google Cloud
echo ================================================
echo.
echo Using Google Cloud Run:
echo 1. Install Google Cloud SDK
echo 2. Authenticate: gcloud auth login
echo 3. Enable services: gcloud services enable run.googleapis.com
echo 4. Build and deploy: gcloud run deploy --source .
echo 5. Set environment variables in the console
echo.
echo Alternative: Use Google App Engine
echo 1. Create app.yaml file
echo 2. Deploy with: gcloud app deploy
echo.
pause
goto end

:exit
echo.
echo Thank you for using Todo App!
echo.
pause
exit

:end
echo.
echo Deployment guide opened in BACKEND_DEPLOYMENT.md
start "" "BACKEND_DEPLOYMENT.md"
pause