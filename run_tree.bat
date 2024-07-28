@echo off
set scriptDir=%~dp0
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%scriptDir%tree.ps1"
echo.
echo Press any key to exit...
pause >nul
