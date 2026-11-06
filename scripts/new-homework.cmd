@echo off
REM Wrapper: run the PowerShell script with execution policy bypass
REM (so nobody has to change Windows system settings).
REM This file must stay ASCII-only: cmd.exe reads it in the OEM codepage
REM and non-ASCII bytes get garbled into bogus commands.
REM
REM Usage: scripts\new-homework.cmd -Week 3 -Id lab02 -Title "Linear regression"

chcp 65001 >nul
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0new-homework.ps1" %*
