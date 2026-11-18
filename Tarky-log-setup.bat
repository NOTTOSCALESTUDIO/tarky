@echo off
setlocal EnableExtensions EnableDelayedExpansion
title Tarky log setup
REM ============================================================================
REM  Tarky log setup  -  for Tarkov Story Route (https://nottoscalestudio.github.io/tarky/)
REM
REM  WHY: Chrome won't let websites read folders under Program Files, which is
REM  where Steam installs Tarkov. This file sets up a hidden Windows task that
REM  copies the three log files the guide needs into a normal folder Chrome can read:
REM      %USERPROFILE%\TarkovLogs
REM
REM  WHAT IT DOES:
REM   1. Finds Tarkov's Logs folder (Steam libraries, then the official launcher).
REM   2. Creates a scheduled task "Tarky log mirror" that runs every minute as
REM      SYSTEM (so no window ever pops up over your game) and runs robocopy,
REM      which copies only new or changed push-notifications, backend and application
REM      logs (task events, game mode, and which account was playing).
REM   3. Optionally keeps only recent copies: the copy task skips logs older than
REM      your chosen number of days, and a second hidden task "Tarky log cleanup"
REM      deletes older copied sessions every hour. (The guide only reads the newest
REM      sessions; older ones matter only for a one-off "Import past completions".)
REM   4. Runs it once and checks the copies arrived.
REM
REM  It never changes, moves or deletes the game's own files.
REM  To undo: run Tarky-log-remove.bat (also as administrator).
REM  HOW TO RUN: right-click this file, choose "Run as administrator".
REM ============================================================================

REM --- Needs admin, because the task runs as SYSTEM. "net session" only works as admin.
net session >nul 2>&1
if errorlevel 1 (
  echo.
  echo  This needs administrator rights.
  echo  Close this window, right-click Tarky-log-setup.bat and choose "Run as administrator".
  echo.
  pause
  exit /b 1
)

set "DST=%USERPROFILE%\TarkovLogs"
set "SRC="

REM --- 1a. Steam: read Steam's folder from the registry, then check every Steam library.
for /f "tokens=2,*" %%a in ('reg query "HKCU\Software\Valve\Steam" /v SteamPath 2^>nul ^| find "SteamPath"') do set "STEAM=%%b"
if defined STEAM (
  set "STEAM=!STEAM:/=\!"
  if exist "!STEAM!\steamapps\common\Escape from Tarkov\build\Logs" set "SRC=!STEAM!\steamapps\common\Escape from Tarkov\build\Logs"
  if not defined SRC if exist "!STEAM!\steamapps\libraryfolders.vdf" (
    REM Each Steam library appears in libraryfolders.vdf as:  "path"   "D:\\SteamLibrary"
    for /f "usebackq tokens=2 delims=	" %%p in (`findstr /c:"\"path\"" "!STEAM!\steamapps\libraryfolders.vdf"`) do (
      set "LIB=%%~p"
      set "LIB=!LIB:\\=\!"
      if not defined SRC if exist "!LIB!\steamapps\common\Escape from Tarkov\build\Logs" set "SRC=!LIB!\steamapps\common\Escape from Tarkov\build\Logs"
    )
  )
)

REM --- 1b. Official Battlestate launcher: its usual install folders.
for %%d in ("C:\Battlestate Games\Escape from Tarkov" "C:\Battlestate Games\EFT" "D:\Battlestate Games\Escape from Tarkov" "D:\Battlestate Games\EFT") do (
  if not defined SRC if exist "%%~d\Logs" set "SRC=%%~d\Logs"
  if not defined SRC if exist "%%~d\build\Logs" set "SRC=%%~d\build\Logs"
)

REM --- 1c. Not found: ask. (Tip: in File Explorer, open the Logs folder, click the
REM     address bar, copy the path and paste it here.)
if defined SRC goto found
echo.
echo  Couldn't find Tarkov's Logs folder automatically.
set /p "SRC=  Paste the full path to your Tarkov Logs folder and press Enter: "
REM Remove any quotes around the pasted path.
set SRC=%SRC:"=%
:found
if not exist "!SRC!" (
  echo.
  echo  That folder doesn't exist: !SRC!
  pause
  exit /b 1
)

echo.
echo  Tarkov logs:   !SRC!
echo  Copies go to:  !DST!
echo.
choice /c YN /m "  Set up the copy task with these folders"
if errorlevel 2 exit /b 0

REM --- How long to keep copies. Enter = 30 days; 0 = keep everything.
echo.
echo  How many days of copied logs to keep? The guide only needs recent ones;
echo  older ones are only for a one-off "Import past completions".
set "DAYS=30"
set /p "DAYS=  Days to keep (Enter for 30, 0 to keep all): "
REM Whole numbers only; anything else falls back to 30.
echo !DAYS!| findstr /r "^[0-9][0-9]*$" >nul || set "DAYS=30"
REM Strip leading zeros (cmd would read "030" as octal); all zeros means 0.
for /f "tokens=* delims=0" %%n in ("!DAYS!") do set "DAYS=%%n"
if "!DAYS!"=="" set "DAYS=0"
set "AGE="
if !DAYS! GTR 0 set "AGE= /MAXAGE:!DAYS!"

REM --- 2. Create (or replace, /F) the task. Every minute, hidden, as SYSTEM.
REM     robocopy  SOURCE  DEST  [file types]  /S = include session subfolders
REM     /R:0 /W:0 = skip a busy file instead of retrying (it's copied next minute)
REM     /MAXAGE:n = skip logs older than n days (so cleaned-up copies don't come back)
if not exist "!DST!" mkdir "!DST!"
schtasks /Create /F /RU SYSTEM /SC MINUTE /MO 1 /TN "Tarky log mirror" /TR "robocopy \"!SRC!\" \"!DST!\" *push-notifications*.log *backend*.log *application*.log /S /R:0 /W:0!AGE!"
if errorlevel 1 (
  echo.
  echo  Couldn't create the task. If the paths are very long, Windows may refuse them.
  pause
  exit /b 1
)

REM --- 3. Cleanup of copied sessions older than DAYS (skipped if DAYS is 0).
REM     Runs hourly (so it still happens if the PC is off overnight). forfiles finds
REM     log_ folders last changed more than DAYS days ago and removes them.
REM     It only ever looks inside TarkovLogs; the game's own logs are never touched.
if !DAYS! GTR 0 (
  schtasks /Create /F /RU SYSTEM /SC HOURLY /TN "Tarky log cleanup" /TR "forfiles /p \"!DST!\" /m log_* /d -!DAYS! /c \"cmd /c if @isdir==TRUE rmdir /s /q @path\"" >nul
  schtasks /Run /TN "Tarky log cleanup" >nul
  echo  Keeping !DAYS! days of copies. Older ones are removed every hour.
) else (
  schtasks /Delete /TN "Tarky log cleanup" /F >nul 2>&1
  echo  Keeping all copies.
)

REM --- 4. Run once now and check.
schtasks /Run /TN "Tarky log mirror" >nul
echo.
echo  Copying for the first time...
timeout /t 8 /nobreak >nul
dir /b /ad "!DST!\log_*" >nul 2>&1
if errorlevel 1 (
  echo  No copies yet. Wait a minute and look in !DST!.
) else (
  echo  Done. Logs are being copied to !DST!
  echo.
  echo  Next: in the guide, tap "Game logs", then "Choose Logs folder",
  echo  and pick the TarkovLogs folder inside C:\Users\%USERNAME%.
)
echo.
pause
