@echo off
mode con cp select=437 >nul

set C=%SystemDrive:~0,1%
for /f "tokens=2" %%a in ('echo list vol ^| diskpart ^| findstr "\<installer\>"') do (echo select vol %%a & echo delete partition) | diskpart
for /f "tokens=2" %%a in ('echo list vol ^| diskpart ^| findstr "\<%C%\>"') do (echo select vol %%a & echo extend) | diskpart

rem Hide desktop watermark and evaluation build markings
reg add "HKCU\Control Panel\Desktop" /v PaintDesktopVersion /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKU\.DEFAULT\Control Panel\Desktop" /v PaintDesktopVersion /t REG_DWORD /d 0 /f >nul 2>&1

del "%~f0"
