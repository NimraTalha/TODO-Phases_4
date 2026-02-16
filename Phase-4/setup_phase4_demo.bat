@echo off
REM Setup script for Todo Application Demo - Phase 4
REM This script outlines the steps needed to run the AI-driven scaling demo

echo.
echo ================================================
echo    Todo Application Demo - Phase 4 Setup
echo ================================================
echo.

echo Prerequisites:
echo 1. Docker Desktop must be running
echo 2. Kubernetes cluster (minikube or kind) must be active
echo 3. kubectl-ai plugin must be installed
echo.

echo Checking prerequisites...
echo.

echo Checking kubectl...
kubectl version --client
if %errorlevel% neq 0 (
    echo ERROR: kubectl is not installed or not in PATH
    goto :end
) else (
    echo kubectl is available
)

echo.
echo Checking kubectl-ai plugin...
kubectl ai --help >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: kubectl-ai plugin is not installed
    echo Install it using: kubectl krew install ai
    goto :end
) else (
    echo kubectl-ai plugin is available
)

echo.
echo Checking for active Kubernetes cluster...
kubectl cluster-info >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: No active Kubernetes cluster found
    echo Start minikube with: minikube start
    echo OR start kind cluster with: kind create cluster
    goto :end
) else (
    echo Active Kubernetes cluster found
)

echo.
echo All prerequisites met! Proceeding with deployment...
echo.

echo Deploying the Todo application using Helm...
helm upgrade --install todo-app charts/todo-app/ || echo "Helm chart not found, trying individual deployments..."

echo.
echo Verifying deployments...
kubectl get deployments
echo.

echo ================================================
echo Ready for Phase 4: AI-Driven Scaling
echo ================================================
echo.

echo To run Phase 4 commands manually:
echo 1. kubectl ai "scale the frontend deployment to 3 replicas"
echo 2. kubectl ai "show me how many replicas the frontend deployment has"
echo.

:end
pause