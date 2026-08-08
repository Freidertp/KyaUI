@echo off
title KyaUI
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0KyaUI-Update.ps1" %*
if errorlevel 1 (
    echo.
    pause
)
