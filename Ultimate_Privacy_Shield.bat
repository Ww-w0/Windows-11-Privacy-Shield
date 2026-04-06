@echo off
title Windows 11 Privacy & Performance Shield - Ultimate Edition
:: Run as Administrator check
net session >nul 2>&1 || (echo Please run as Administrator! & pause & exit)

echo [1/10] Removing Windows Recall...
dism /online /disable-feature /featurename:Recall /norestart

echo [2/10] Disabling Telemetry & Services...
sc stop "DiagTrack" && sc config "DiagTrack" start= disabled
sc stop "dmwappushservice" && sc config "dmwappushservice" start= disabled

echo [3/10] Disabling Advertising ID...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f

echo [4/10] Disabling Search History & Bing...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchHistoryEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f

echo [5/10] Disabling Nearby Sharing...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CDP" /v "CdpSessionUserAuthzPolicy" /t REG_DWORD /d 0 /f

echo [6/10] Disabling Cortana & Widgets...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Dsh" /v "AllowNewsAndInterests" /t REG_DWORD /d 0 /f

echo [7/10] Hiding Recent Files & Frequent Folders...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d 0 /f

echo [8/10] Disabling Delivery Optimization (P2P Updates)...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d 0 /f
sc stop "DoSvc" && sc config "DoSvc" start= disabled

echo [9/10] Disabling Background Apps Globally...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d 1 /f

echo [10/10] Cleaning Temp Files...
del /s /f /q %temp%\*.*

echo.
echo ======================================================
echo    ALL TASKS COMPLETED! SYSTEM IS NOW PROTECTED.
echo ======================================================
echo Please restart your PC to apply all changes.
pause
