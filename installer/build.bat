@echo off
echo ================================================
echo  EHFGM Media Stream — Building Installer
echo ================================================
echo.

:: Check Inno Setup is installed
if not exist "C:\Program Files (x86)\Inno Setup 6\ISCC.exe" (
    echo ERROR: Inno Setup 6 not found!
    echo Please install from: https://jrsoftware.org/isinfo.php
    pause
    exit /b 1
)

:: Create output folder if not exists
if not exist "..\output" mkdir "..\output"

echo Building installer...
echo.

"C:\Program Files (x86)\Inno Setup 6\ISCC.exe" setup.iss

echo.
if %errorlevel% == 0 (
    echo ================================================
    echo  SUCCESS! Installer created in output/ folder
    echo ================================================
) else (
    echo ================================================
    echo  ERROR! Build failed. Check errors above.
    echo ================================================
)

pause