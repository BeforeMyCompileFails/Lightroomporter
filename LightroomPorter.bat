:: ---------------------------------------------
:: This is a simple Windows .bat script to backup and restore Lightroom Classic settings 
:: including presets, profiles, and preferences — using WinRAR.
:: by Denis (BeforeMyCompileFails), 2025
:: ---------------------------------------------

@echo off
setlocal enabledelayedexpansion

:: Remove trailing backslash from script directory if it exists
set "SCRIPT_DIR=%~dp0"
if "%SCRIPT_DIR:~-1%"=="\" set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"

set "RAR_NAME=Lightroom_Settings_Backup.rar"
set "RAR_PATH=%SCRIPT_DIR%\%RAR_NAME%"
set "TEMP_DIR=%TEMP%\LightroomBackupTemp"

:: Lightroom folders
set "LR_PRESETS=%APPDATA%\Adobe\Lightroom"
set "CR_PRESETS=%APPDATA%\Adobe\CameraRaw"

:: Menu
echo.
echo What do you want to do?
echo [1] Backup Lightroom Classic settings (create .rar)
echo [2] Restore to new PC (extract .rar)
echo.

set /p choice=Enter choice (1 or 2): 

if "%choice%"=="1" goto backup
if "%choice%"=="2" goto restore

echo Invalid choice. Exiting...
goto end

:backup
echo.
echo Backing up Lightroom settings...

if exist "%TEMP_DIR%" rd /s /q "%TEMP_DIR%"
mkdir "%TEMP_DIR%\Presets"
mkdir "%TEMP_DIR%\CameraRaw"

xcopy "%LR_PRESETS%" "%TEMP_DIR%\Presets" /E /I /Y > nul
xcopy "%CR_PRESETS%" "%TEMP_DIR%\CameraRaw" /E /I /Y > nul

if exist "%RAR_PATH%" del "%RAR_PATH%"
"C:\Program Files\WinRAR\WinRAR.exe" a -r -ep1 "%RAR_PATH%" "%TEMP_DIR%\*" > nul

echo.
echo ✅ Backup complete: %RAR_PATH%
goto end

:restore
echo.
echo Looking for backup archive at: %RAR_PATH%
if not exist "%RAR_PATH%" (
    echo ❌ Archive not found.
    set /p RAR_PATH=Enter full path to your .rar file: 
)

if not exist "%RAR_PATH%" (
    echo ❌ File not found. Exiting...
    goto end
)

echo Restoring Lightroom settings...

if exist "%TEMP_DIR%" rd /s /q "%TEMP_DIR%"
mkdir "%TEMP_DIR%"
"C:\Program Files\WinRAR\WinRAR.exe" x -o+ "%RAR_PATH%" "%TEMP_DIR%\" > nul

xcopy "%TEMP_DIR%\Presets" "%LR_PRESETS%" /E /I /Y > nul
xcopy "%TEMP_DIR%\CameraRaw" "%CR_PRESETS%" /E /I /Y > nul

echo.
echo ✅ Restore complete. You can now launch Lightroom.
goto end

:end
echo.
pause
