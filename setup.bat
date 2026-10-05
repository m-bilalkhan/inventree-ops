@echo off
title InvenTree - first time setup
cd /d "%~dp0"
echo.
echo === InvenTree setup (first run takes 5-15 minutes) ===
echo.
docker info >nul 2>&1
if errorlevel 1 (
  echo [ERROR] Docker is not running. Start Docker Desktop, wait until it says "running", then run this again.
  pause
  exit /b 1
)
echo [1/4] Downloading images...
docker compose pull || goto fail
echo [2/4] Setting up the database...
docker compose run --rm inventree-server invoke update || goto fail
echo [3/4] Loading demo company data...
docker compose run --rm inventree-server invoke dev.setup-test -i || goto fail
echo [4/4] Starting InvenTree...
docker compose up -d || goto fail
echo.
echo Done! Waiting for the server to be ready, then opening http://localhost:8080
echo Login: admin / inventree
timeout /t 60 >nul
start http://localhost:8080
pause
exit /b 0
:fail
echo.
echo [ERROR] A step failed. Copy the messages above and send them to Claude.
pause
exit /b 1
