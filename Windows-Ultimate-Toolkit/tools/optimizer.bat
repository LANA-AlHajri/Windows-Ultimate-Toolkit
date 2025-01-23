@echo off
title Windows Ultimate Toolkit
color 0A

echo ================================================
echo        Windows Ultimate Toolkit v1.0
echo        Created by LANA-AlHajri
echo        Discord: ln0w
echo ================================================

:: Create Restore Point with timestamp
set "DATE=%date:~-4,4%%date:~-7,2%%date:~-10,2%"
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "WUT_Optimizer_%DATE%", 100, 7

:: Registry Optimizations
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d "64" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCP1323Opts" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f

:: Network Optimizations
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global chimney=enabled
netsh int tcp set global dca=enabled
netsh int tcp set global netdma=enabled
netsh int tcp set global ecncapability=enabled
netsh int tcp set global timestamps=disabled
netsh int tcp set heuristics disabled
netsh winsock reset
netsh int ip reset
ipconfig /flushdns
ipconfig /registerdns

:: Power Optimizations
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
powercfg /change monitor-timeout-ac 15
powercfg /change monitor-timeout-dc 5
powercfg /change standby-timeout-ac 0
powercfg /change hibernate-timeout-ac 0

:: Memory Optimization
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d "983040" /f

echo Optimization Complete! System requires restart.
pause
