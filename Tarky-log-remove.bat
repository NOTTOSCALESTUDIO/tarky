@echo off
title Tarky log removal
REM ============================================================================
REM  Removes what Tarky-log-setup.bat added:
REM   - the scheduled tasks "Tarky log mirror" and "Tarky log cleanup", and the
REM     copy script in %ProgramData%\Tarky
REM   - optionally, the copies in %USERPROFILE%\TarkovLogs
REM  The game's own logs are never touched.
REM  HOW TO RUN: right-click this file, choose "Run as administrator".
REM ============================================================================
net session >nul 2>&1
if errorlevel 1 (
  echo  This needs administrator rights. Right-click it and choose "Run as administrator".
  pause
  exit /b 1
)
schtasks /Delete /TN "Tarky log mirror" /F
schtasks /Delete /TN "Tarky log cleanup" /F >nul 2>&1
if exist "%ProgramData%\Tarky" rmdir /S /Q "%ProgramData%\Tarky"
echo.
choice /c YN /m "  Also delete the copied logs in %USERPROFILE%\TarkovLogs"
if errorlevel 2 goto end
rmdir /S /Q "%USERPROFILE%\TarkovLogs"
echo  Copies deleted.
:end
echo.
pause
