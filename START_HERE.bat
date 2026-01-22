@echo off
echo.
echo ========================================================
echo        TODO APP - START DEPLOYMENT PROCESS
echo ========================================================
echo.
echo Welcome to your Todo App deployment center!
echo.
echo You have two main tasks:
echo 1. Upload project to GitHub (for backend deployment)
echo 2. Deploy backend to Railway (free hosting)
echo.
echo ========================================================
echo STEP 1: UPLOAD TO GITHUB
echo ========================================================
echo.
echo Run this in your project directory:
echo.
echo git init
echo git add .
echo git commit -m "Initial commit: Professional Todo Application with Next.js"
echo git remote add origin https://github.com/NimraTalha/TODO-Phases_4.git
echo git branch -M main
echo git push -u origin main
echo.
echo ========================================================
echo STEP 2: DEPLOY BACKEND TO RAILWAY (FREE!)
echo ========================================================
echo.
echo Your backend will be deployed to Railway for FREE!
echo 500 hours/month free - perfect for development!
echo.
echo Follow these steps:
echo 1. Complete GitHub upload first
echo 2. Open RAILWAY_GUIDE.md for detailed instructions
echo 3. Or run RAILWAY_DEPLOY.bat for guided deployment
echo 4. Your backend will be live at a railway.app URL
echo.
echo ========================================================
echo QUICK ACCESS:
echo ========================================================
echo.
echo Press 1 - Open GitHub upload instructions
echo Press 2 - Open Railway deployment guide  
echo Press 3 - Run Railway deployment helper
echo Press 4 - Open deployment summary
echo Press 5 - Exit
echo.
echo ========================================================
echo.

:menu
set /p choice="Enter your choice (1-5): "

if "%choice%"=="1" (
    goto github
) else if "%choice%"=="2" (
    goto railway_guide
) else if "%choice%"=="3" (
    goto railway_deploy
) else if "%choice%"=="4" (
    goto summary
) else if "%choice%"=="5" (
    goto exit
) else (
    echo Invalid choice. Please try again.
    timeout /t 2 /nobreak >nul
    cls
    goto menu
)

:github
echo.
echo GitHub Upload Instructions:
echo.
echo 1. Make sure you have created the repository: https://github.com/NimraTalha/TODO-Phases_4
echo 2. Open Command Prompt in this directory
echo 3. Run these commands one by one:
echo.
echo    git init
echo    git add .
echo    git commit -m "Initial commit: Professional Todo Application with Next.js"
echo    git remote add origin https://github.com/NimraTalha/TODO-Phases_4.git
echo    git branch -M main
echo    git push -u origin main
echo.
echo 4. Wait for upload to complete
echo.
pause
goto menu

:railway_guide
start "" "RAILWAY_GUIDE.md"
echo.
echo Railway deployment guide opened!
echo Follow the step-by-step instructions in the file.
echo.
pause
goto menu

:railway_deploy
start "" "RAILWAY_DEPLOY.bat"
echo.
echo Railway deployment helper opened!
echo Follow the guided instructions.
echo.
pause
goto menu

:summary
start "" "DEPLOYMENT_SUMMARY.md"
echo.
echo Deployment summary opened!
echo.
pause
goto menu

:exit
echo.
echo Thank you for using Todo App!
echo.
echo Remember:
echo 1. Upload to GitHub first
echo 2. Then deploy backend to Railway
echo 3. Connect frontend to backend URL
echo.
echo Happy coding! ^_^
pause