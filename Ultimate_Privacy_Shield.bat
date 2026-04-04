@echo off
title Ultimate Windows 11 Privacy & Performance Shield
echo ======================================================
echo    Windows 11 Privacy & Performance Optimization
echo ======================================================
echo.

:: [1] Removing AI Windows Recall (The Core Step)
echo [1/7] Removing Windows Recall feature...
dism /online /disable-feature /featurename:Recall /norestart

:: [2] Disabling Telemetry & Data Collection Services
echo [2/7] Stopping and Disabling Telemetry Services...
sc stop "DiagTrack" && sc config "DiagTrack" start= disabled
sc stop "dmwappushservice" && sc config "dmwappushservice" start= disabled
sc stop "SysMain" && sc config "SysMain" start= disabled

:: [3] Privacy & Advertising ID (Registry Tweak)
echo [3/7] Disabling Advertising ID and Personalized Offers...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f

:: [4] Search Privacy (Disabling Web Results & History)
echo [4/7] Cleaning Search History and Disabling Bing Search...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchHistoryEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "SafeSearchMode" /t REG_DWORD /d 1 /f

:: [5] Nearby Sharing & Feedback
echo [5/7] Disabling Nearby Sharing and Feedback Requests...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CDP" /v "CdpSessionUserAuthzPolicy" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f

:: [6] Cortana & AI Widgets
echo [6/7] Disabling Cortana and Windows Widgets...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Dsh" /v "AllowNewsAndInterests" /t REG_DWORD /d 0 /f

:: [7] Cleaning Temp Files (Optional Performance Boost)
echo [7/7] Cleaning Temporary files...
del /s /f /q %temp%\*.*
del /s /f /q C:\Windows\temp\*.*

echo.
echo ======================================================
echo    ALL TASKS COMPLETED SUCCESSFULLY!
echo    Note: Windows Recall will be removed after restart.
echo ======================================================
echo Press any key to RESTART your PC now...
pause
shutdown /r /t 5

Recall: يحذفها برمجياً من جذور النظام (لن تجديها في الإعدادات بعد الآن).

Telemetry: يغلق "مواسير" البيانات التي ترسل معلومات استخدامك لمايكروسوفت.

Advertising ID: يمنع بناء ملف تعريفي لإهتماماتك الشخصية.

Search: يمنع ويندوز من تسجيل ما تبحثين عنه محلياً أو إرساله لـ Bing.

Cortana & Widgets: يعطل المساعد الصوتي وخدمات الأخبار والطقس التي تتبع موقعك الجغرافي.

Restart: سيقوم بإعادة تشغيل الجهاز تلقائياً خلال 5 ثوانٍ بعد الضغط على أي مفتاح.