@echo off
REM Check for administrator privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo This script must be run as administrator.
    echo Right-click and select "Run as administrator".
    pause
    exit /b
)

echo ============================================
echo   Reset AnyDesk Trial - Cleanup Script
echo ============================================

REM Kill AnyDesk processes
echo Closing AnyDesk processes...
taskkill /F /IM AnyDesk.exe /T >nul 2>&1
taskkill /F /IM ad.exe /T >nul 2>&1

REM Remove AnyDesk data from all user profiles
for /D %%u in (C:\Users\*) do (
    if exist "%%u\AppData\Roaming\AnyDesk" (
        echo Taking ownership of AnyDesk folder for user %%u...
        takeown /f "%%u\AppData\Roaming\AnyDesk" /r /d y >nul
        icacls "%%u\AppData\Roaming\AnyDesk" /grant Administrators:F /t >nul
        rd /s /q "%%u\AppData\Roaming\AnyDesk"
        echo Deleted AnyDesk data for user %%u.
    )
)

REM Remove AnyDesk from ProgramData
if exist "C:\ProgramData\AnyDesk" (
    echo Taking ownership of AnyDesk folder in ProgramData...
    takeown /f "C:\ProgramData\AnyDesk" /r /d y >nul
    icacls "C:\ProgramData\AnyDesk" /grant Administrators:F /t >nul
    rd /s /q "C:\ProgramData\AnyDesk"
    echo Deleted AnyDesk folder in ProgramData.
)

REM Remove AnyDesk registry keys
echo Deleting AnyDesk registry keys...
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\AnyDesk" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\AnyDesk" /f >nul 2>&1
reg delete "HKEY_USERS\.DEFAULT\Software\AnyDesk" /f >nul 2>&1

REM Remove uninstall entries to attempt trial reset
echo Removing uninstall entries...
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\AnyDesk" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Uninstall\AnyDesk" /f >nul 2>&1

echo.
echo Operation completed. Please restart your computer if you plan to reinstall AnyDesk.
pause
