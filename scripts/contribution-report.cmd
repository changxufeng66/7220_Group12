@echo off
REM Wrapper for contribution-report.ps1 that bypasses the Windows execution policy.
REM Keep this file ASCII-only: cmd.exe reads it in the OEM codepage.
REM
REM Usage: scripts\contribution-report.cmd            (writes docs/contribution-summary.md)
REM        scripts\contribution-report.cmd -Since "2.weeks"

chcp 65001 >nul
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0contribution-report.ps1" %*
