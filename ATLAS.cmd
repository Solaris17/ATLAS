@Echo off
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)
color 9F
SET fingerprint=22
SET build=2.1.5
SET iconcache=%localappdata%\IconCache.db
SET FILENAME=ATLAS Log-%RANDOM%
title A.T.L.A.S Stable v%BUILD%
cls

:checkPrivileges 
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto prelim) else ( goto getPrivileges ) 

:getPrivileges 
if '%1'=='ELEV' (shift & goto prelim)  
Echo. 
Echo					 ######     #    #     # ######  ###  #####     #    #     # 
Echo					 #     #   # #   ##    # #     #  #  #     #   # #   ##   ## 
Echo					 #     #  #   #  # #   # #     #  #  #        #   #  # # # # 
Echo					 ######  #     # #  #  # #     #  #  #       #     # #  #  # 
Echo					 #     # ####### #   # # #     #  #  #       ####### #     # 
Echo					 #     # #     # #    ## #     #  #  #     # #     # #     # 
Echo					 ######  #     # #     # ######  ###  #####  #     # #     # 
Echo.
::- Bandicam (Unregistered)                             
for /f "delims=: tokens=*" %%A in ('findstr /b ::- "%~f0"') do @echo(%%A
setlocal DisableDelayedExpansion
set "batchPath=%~0"
setlocal EnableDelayedExpansion
Echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs" 
Echo UAC.ShellExecute "!batchPath!", "ELEV", "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs" 
"%temp%\OEgetPrivileges.vbs" 
exit /B

:prelim
sc config winmgmt start= auto  >nul 2>&1

sc start winmgmt  >nul 2>&1

wmic COMPUTERSYSTEM GET BootupState | findstr /i "fail-safe" > nul
if %errorlevel% EQU 0 goto safemode

:virchk
@echo off
CLS
color 9F
cls
Echo Scanning for running AV software. (MSE doesnt count)
Echo.
tasklist /FI "IMAGENAME eq SBAMSvc.exe" 2>NUL | find /I /N "SBAMSvc.exe" >nul
if "%ERRORLEVEL%"=="0" goto vipre
tasklist /FI "IMAGENAME eq mcshield.exe" 2>NUL | find /I /N "mcshield.exe" >nul
if "%ERRORLEVEL%"=="0" goto McAfee
tasklist /FI "IMAGENAME eq cis.exe" 2>NUL | find /I /N "cis.exe" >NUL
if "%ERRORLEVEL%"=="0" goto comodo
tasklist /FI "IMAGENAME eq avgcmgr.exe" 2>NUL | find /I /N "avgcmgr.exe" >nul
if "%ERRORLEVEL%"=="0" goto AVG
tasklist /FI "IMAGENAME eq AvastSvc.exe" 2>NUL | find /I /N "AvastSvc.exe" >nul
if "%ERRORLEVEL%"=="0" goto Avast
tasklist /FI "IMAGENAME eq avp.exe" 2>NUL | find /I /N "avp.exe" >nul
if "%ERRORLEVEL%"=="0" goto Kaspersky
tasklist /FI "IMAGENAME eq n360.exe" 2>NUL | find /I /N "n360.exe" >nul
if "%ERRORLEVEL%"=="0" goto Norton
tasklist /FI "IMAGENAME eq ekrn.exe" 2>NUL | find /I /N "ekrn.exe" >nul
if "%ERRORLEVEL%"=="0" goto eset
tasklist /FI "IMAGENAME eq avgnt.exe" 2>NUL | find /I /N "avgnt.exe" >nul
if "%ERRORLEVEL%"=="0" goto avira
tasklist /FI "IMAGENAME eq Avengine.exe" 2>NUL | find /I /N "Avengine.exe" >nul
if "%ERRORLEVEL%"=="0" goto panda
tasklist /FI "IMAGENAME eq coreframeworkhost.exe" 2>NUL | find /I /N "coreframeworkhost.exe" >nul
if "%ERRORLEVEL%"=="0" goto Trend
tasklist /FI "IMAGENAME eq a2guard.exe" 2>NUL | find /I /N "a2guard.exe" >nul
if "%ERRORLEVEL%"=="0" goto Emsisoft
tasklist /FI "IMAGENAME eq clamtray.exe" 2>NUL | find /I /N "clamtray.exe" >nul
if "%ERRORLEVEL%"=="0" goto clam
tasklist /FI "IMAGENAME eq sdfssvc.exe" 2>NUL | find /I /N "sdfssvc.exe" >nul
if "%ERRORLEVEL%"=="0" goto spybot
tasklist /FI "IMAGENAME eq adawareservvice.exe" 2>NUL | find /I /N "adawareservvice.exe" >nul
if "%ERRORLEVEL%"=="0" goto adaware
tasklist /FI "IMAGENAME eq mbam.exe" 2>NUL | find /I /N "mbam.exe" >nul
if "%ERRORLEVEL%"=="0" goto mbam
tasklist /FI "IMAGENAME eq rapportservice.exe" 2>NUL | find /I /N "rapportservice.exe" >nul
if "%ERRORLEVEL%"=="0" goto rapport
tasklist /FI "IMAGENAME eq rscp_svc.exe" 2>NUL | find /I /N "rscp_svc.exe" >nul
if "%ERRORLEVEL%"=="0" goto reasoncore
tasklist /FI "IMAGENAME eq SavService.exe" 2>NUL | find /I /N "SavService.exe" >nul
if "%ERRORLEVEL%"=="0" goto sophos
tasklist /FI "IMAGENAME eq WRSA.exe" 2>NUL | find /I /N "WRSA.exe" >nul
if "%ERRORLEVEL%"=="0" goto webroot
tasklist /FI "IMAGENAME eq bdagent.exe" 2>NUL | find /I /N "bdagent.exe" >nul
if "%ERRORLEVEL%"=="0" goto bitdefender
goto autocheck

:vipre
call :colorEcho 4e "WARNING Vipre is running"
Echo.
Echo.
pause
Echo.
goto virmen
:McAfee
call :colorEcho 4e "WARNING McAfee is running"
Echo.
Echo.
pause
Echo.
goto virmen
:comodo
call :colorEcho 4e "WARNING Comodo is running"
Echo.
Echo.
pause
Echo.
goto virmen
:AVG
call :colorEcho 4e "WARNING AVG is running"
Echo.
Echo.
pause
Echo.
goto virmen
:Avast
call :colorEcho 4e "WARNING Avast is running"
Echo.
Echo.
pause
Echo.
goto virmen
:Kaspersky
call :colorEcho 4e "WARNING Kaspersky is running"
Echo.
Echo.
pause
Echo.
goto virmen
:Norton
call :colorEcho 4e "WARNING Norton is running"
Echo.
Echo.
pause
Echo.
goto virmen
:eset
call :colorEcho 4e "WARNING ESET (nod32) is running"
Echo.
Echo.
pause
Echo.
goto virmen
:avira
call :colorEcho 4e "WARNING Avira is running"
Echo.
Echo.
pause
Echo.
goto virmen
:panda
call :colorEcho 4e "WARNING Panda is running"
Echo.
Echo.
pause
Echo.
goto virmen
:Trend
call :colorEcho 4e "WARNING Trend Micro is running"
Echo.
Echo.
pause
Echo.
goto virmen
:Emsisoft
call :colorEcho 4e "WARNING Emsisoft is running"
Echo.
Echo.
pause
Echo.
goto virmen
:clam
call :colorEcho 4e "WARNING Clam AV is running"
Echo.
Echo.
pause
Echo.
goto virmen
:spybot
call :colorEcho 4e "WARNING SPYBOT is running"
Echo.
Echo.
pause
Echo.
goto virmen
:adaware
call :colorEcho 4e "WARNING Ad-Aware is running"
Echo.
Echo.
pause
Echo.
goto virmen
:mbam
call :colorEcho 4e "WARNING Malwarebytes is running"
Echo.
Echo.
pause
Echo.
goto virmen
:rapport
call :colorEcho 4e "WARNING Trusteer Rapport is running"
Echo.
Echo.
pause
Echo.
goto virmen
:reasoncore
call :colorEcho 4e "WARNING Reasoncore Security is running"
Echo.
Echo.
pause
Echo.
goto virmen
:sophos
call :colorEcho 4e "WARNING Sophos is running"
Echo.
Echo.
pause
Echo.
goto virmen
:webroot
call :colorEcho 4e "WARNING Webroot is running"
Echo.
Echo.
pause
Echo.
goto virmen
:bitdefender
call :colorEcho 4e "WARNING BitDefender is running"
Echo.
Echo.
pause
Echo.
goto virmen

:virmen
cls
Color 4F
Echo Running Anti-Virus software was detected on this system!!
Echo.
Echo Please make sure it is disabled before continuing!
Echo.
Echo 1 = Its off continue
Echo.
Echo 2 = Run Scan again
ECHO.
Echo 3 = Exit
set choice=
ECHO.
Echo Select (1) (2) or (3)
Echo.
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto autocheck
if '%choice%'=='2' goto virchk
if '%choice%'=='3' goto exit
goto invvir

:invvir
Echo.
call :colorEcho 4e "Invalid Selection Please Try again..."
Echo.
Echo.
pause
goto virmen

:autocheck
Echo.
cls
color 9F
ECHO Checking connection, please wait...
PING -n 1 www.google.com|find "Reply from " >NUL
IF NOT ERRORLEVEL 1 goto xpcheck
IF     ERRORLEVEL 1 goto nodetect

:nodetect
cls
Color 4F
Echo.
Echo Hey we detected you aren't online do you want to run LIMP?
Echo.
Echo 1 = YES
Echo.
Echo 2 = NO
ECHO.
set choice=
ECHO.
Echo Select (1) or (2)
Echo.
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto limp
if '%choice%'=='2' goto cryptocheck
goto invnodetect

:invnodetect
Echo.
call :colorEcho 4e "Invalid Selection Please Try again..."
Echo.
Echo.
pause
goto nodetect

:cryptocheck
Echo.
cls
color 9F
Echo Checking for Cryptolocker and varients...
Echo.
IF EXIST "%userprofile%\documents\*DECRYPT*.txt" ( GOTO found ) ELSE ( GOTO xpcryptocheck )

:xpcryptocheck
Echo.
cls
color 9F
Echo Checking for Cryptolocker and varients...
Echo.
IF EXIST "%userprofile%\my documents\*DECRYPT*.txt" ( GOTO found ) ELSE ( GOTO check2 )
:check2
IF EXIST "C:\Program Files\*restore_files*.txt" ( GOTO found ) ELSE ( GOTO notfound )

:found
cls
Echo.
color 4F
Echo.
Echo WARNING WE FOUND CRYPTO LOCKER REMNANTS ON THIS MACHINE
Echo.
Echo PLEASE USE CAUTION WHEN WORKING
Echo.
pause
goto disclaimer

:notfound
goto disclaimer

:disclaimer
setlocal & pushd.
cls
color 9F
Echo.
:::                           \ __ __| |        \     ___| 
:::                          _ \   |   |       _ \  \___ \ 
:::                         ___ \  |   |      ___ \       |
:::                       _/    _\_|  _____|_/    _\_____/ 
Echo.
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
Echo.
Echo Brought to you by: David Smith (Solaris17)
Echo.
Echo This script and its Author(s) offer no warranty expressed or implied.
Echo.
call :colorEcho 4e "DO NOT RUN THIS ON A MACHINE WITH MULTIPLE USER ACCOUNTS"
Echo.
Echo.
call :colorEcho 4e "THIS IS NOT A DIAGNOSTIC TOOL!! GET PERMISSION FROM SUPERVISOR TO RUN REPAIRS"
Echo.
Echo.
call :colorEcho 4e "DO NOT EXIT OUT OF ATLAS UNLESS ABSOLUTELY NECESSARY"
Echo.
Echo.
Echo ATLAS will backup start menu items to the desktop, Replace them after.
Echo.
Echo This can take a few minutes or a few hours to complete.
Echo.
Echo Log file, registry hives and BCD located @ C:\727PC\ATLAS
Echo.
pause
Echo.
goto menu

:menu
Cls
Echo.
Echo 1 = Start ATLAS
Echo.
Echo 2 = Eidos (Recovery)
Echo.
Echo 3 = L.I.M.P (No Network)
Echo.
Echo 4 = ATLAS (Failsafe)
Echo.
Echo 5 = Tools
ECHO.
Echo 6 = About
Echo.
Echo 7 = Report
Echo.
Echo 8 = Exit
set choice=
ECHO.
Echo Make a selection, Descriptions are availible in the sub menus.
Echo.
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto detect
if '%choice%'=='2' goto eidos
if '%choice%'=='3' goto limp
if '%choice%'=='4' goto at_failsafe
if '%choice%'=='5' goto tools
if '%choice%'=='6' goto about
if '%choice%'=='7' goto reportup
if '%choice%'=='8' goto exit
if '%choice%'=='' goto bupdate
goto invmen

:invmen
Echo.
call :colorEcho 4e "Invalid Selection Please Try again..."
Echo.
Echo.
pause
goto menu

:xpcheck
@Echo off
cls
ver | findstr /i "5\.1\." > nul
IF %ERRORLEVEL% EQU 0 goto dlbits
ver | findstr /i "5\.2\." > nul
IF %ERRORLEVEL% EQU 0 goto dlbits
goto pvcheck

:dlbits
@Echo off
cls
color 9F
Echo To ensure proper XP connectivity please download XP Support Tools (Bitsadmin)
Echo.
start iexplore.exe http://download.microsoft.com/download/d/3/8/d38066aa-4e37-4ae8-bce3-a4ce662b2024/WindowsXP-KB838079-SupportTools-ENU.exe
Echo Alternatively http://www.teamdotexe.org/Downloads/XPbits.exe
Echo.
Echo Please try and run ATLAS again if the version check fails.
Echo.
Echo XP needs time to record the bitsadmin location.
Echo.
pause
goto pvcheck

:pvcheck
Cls
set /P vchkput=Would you like to check for updates [Y/N]? 
if /I "%vchkput%" EQU "Y" goto vcheck
if /I "%vchkput%" EQU "N" goto cryptocheck
goto invpcheck

:invpcheck
Echo.
call :colorEcho 4e "Invalid Selection Please Try again..."
Echo.
Echo.
pause
goto pvcheck

:vcheck
@echo off
cls
color 9F
bitsadmin /transfer Version /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Stable/version.txt "%userprofile%\desktop\version.txt"
Echo.
Echo Checking version of ATLAS on the server.
Echo.
Echo Server version of ATLAS detected...
Echo.
type "%userprofile%\desktop\version.txt"
Echo.
Echo.
Echo Version of ATLAS running is %build%
Echo.
DEL "%userprofile%\desktop\version.txt"
Echo Do you want to update?
Echo.
Echo 1 = YES
Echo.
Echo 2 = NO
ECHO.
set choice=
ECHO.
Echo Select (1) or (2)
Echo.
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto update
if '%choice%'=='2' goto cryptocheck
goto invcheck

:invcheck
Echo.
call :colorEcho 4e "Invalid Selection Please Try again..."
Echo.
Echo.
pause
goto vcheck

:update
@Echo off
cls
Echo.
bitsadmin /transfer ATLAS /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Stable/ATLAS.cmd "%userprofile%\desktop\ATLAS-%random%.cmd"
Echo.
Echo Download Complete!
Echo.
CD "%userprofile%\desktop\"
Echo.
FOR /f "tokens=*" %%G IN ('dir /b ATLAS-*.bat') DO start %%G
Echo.
goto end

:bcheck
@echo off
cls
color 9F
bitsadmin /transfer Version /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Beta/version.txt "%userprofile%\desktop\version.txt"
Echo.
Echo Checking version of ATLAS BETA on the server.
Echo.
Echo Server version of ATLAS detected...
Echo.
type "%userprofile%\desktop\version.txt"
Echo.
Echo.
Echo Version of ATLAS running is %build%
Echo.
DEL "%userprofile%\desktop\version.txt"
Echo Do you want to update?
Echo.
Echo 1 = YES
Echo.
Echo 2 = NO
ECHO.
set choice=
ECHO.
Echo Select (1) or (2)
Echo.
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto bupdate
if '%choice%'=='2' goto cryptocheck
goto invbcheck

:invbcheck
Echo.
call :colorEcho 4e "Invalid Selection Please Try again..."
Echo.
Echo.
pause
goto bcheck

:bupdate
@Echo off
cls
Echo.
bitsadmin /transfer ATLAS /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Beta/ATLAS.cmd "%userprofile%\desktop\ATLAS-%random%.cmd"
Echo.
Echo Download Complete!
Echo.
CD "%userprofile%\desktop\"
Echo.
FOR /f "tokens=*" %%G IN ('dir /b ATLAS-*.bat') DO start %%G
Echo.
goto end

:detect
@Echo off
cls
ver | findstr /i "5\.1\." > nul
IF %ERRORLEVEL% EQU 0 goto pscheck
ver | findstr /i "5\.2\." > nul
IF %ERRORLEVEL% EQU 0 goto pscheck
ver | findstr /i "6\.0\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_Vista
ver | findstr /i "6\.1\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_current
ver | findstr /i "6\.2\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_current
ver | findstr /i "6\.3\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_current
ver | findstr /i "10\.0\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_current
goto warn

:warn
cls
call :colorEcho 4e "Machine OS cannot be determined"
Echo.
Echo 1 = Windows 7, 8, 8.1, 10. (Server: 08, 2011, 2012)
Echo.
Echo 2 = Windows Vista
Echo.
Echo 3 = Windows 2000, 2003, XP. (Server: 2003)
ECHO.
Echo 4 = Exit
set choice=
ECHO.
Echo Select (1) (2) (3) or (4).
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto ver_current
if '%choice%'=='2' goto ver_Vista
if '%choice%'=='3' goto pscheck
if '%choice%'=='4' goto exit
goto invwarn

:invwarn
Echo.
call :colorEcho 4e "Invalid Selection Please Try again..."
Echo.
Echo.
pause
goto warn

:pscheck
cls
Echo.
start Powershell.exe
IF %errorlevel% EQU 0 goto ver_legacy

:nops
cls
Echo.
Echo WOAH CHAMP
Echo.
Echo Power Shell was NOT detected on this system
Echo.
ECHO Power Shell is needed to run some fixes in XP
Echo.
Echo Please Run ATLAS (Failsafe) as an ALT until you can update or install PS
Echo.
Echo https://www.microsoft.com/en-us/download/details.aspx?id=7217
Echo.
Echo 1 = Run ATLAS Failsafe
Echo.
Echo 2 = Continue
ECHO.
Echo 3 = Exit
set choice=
ECHO.
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto atfailsafe
if '%choice%'=='2' goto ver_legacy
if '%choice%'=='3' goto exit
goto pswarn

:pswarn
Echo.
call :colorEcho 4e "Invalid Selection Please Try again..."
Echo.
Echo.
pause
goto nops

:ver_legacy
cls
Echo.
Echo                ******************************************************
Echo                *    Automated Technician Labor Assistance System    *
Echo                *                     Legacy MODE                    *
Echo                ******************************************************
Echo.
Echo Please do not run other programs while ATLAS is performing operations.
Echo.
Echo Make sure Anti-Virus software is disabled. ATLAS will download and run tools.
Echo.
Echo If possible make sure system is connected to the internet.
Echo.
Echo Repairs happen off screen to speed up the process.
Echo.
Echo RUN ATLAS (FAILSAFE) AND DO UPDATES IF ATLAS CRASHES XP NEEDS POWERSHELL^!
Echo.
@Echo off
MD C:\727PC\ATLAS\RegBackup >nul 2>&1
MD C:\727PC\ATLAS\Log >nul 2>&1
MD C:\727PC\ATLAS\Tools >nul 2>&1
taskkill /F /IM powershell.exe /T >nul 2>&1
call :XP >> "C:\727PC\ATLAS\Log\%Filename%.log" 2>&1

:XP
Echo.
Echo Setting environmental path to make sure it is not damaged.
Echo If this causes issues with some applications not opening replace PATH
Echo With the line shown below. This is a copy of the current PATH
Echo Instructions here http://www.computerhope.com/issues/ch000549.htm
Echo.
path
Echo.
path=%SystemRoot%\system32;%SystemRoot%;%SystemRoot%\System32\Wbem;%SystemRoot%\system32\WindowsPowerShell\v1.0;C:\Program Files\Support Tools
Echo.
Echo **********************************
Echo *   STARTING ATLAS v%BUILD%        *
Echo **********************************
Echo.
Echo *********************************
Echo *          SYSTEM INFO          *    
Echo *********************************                          
Echo Current Local date and time is:
Echo.
DATE /t
TIME /t
Echo.
Echo Computer Name: %computername%
Echo.
Echo User Name: %username%
Echo.
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Model"
Echo.
Echo *********************************
Echo *              END              *   
Echo ********************************* 
Echo.
Echo ***** Listing running process' for reasons *****
Echo.
tasklist
Echo.
Echo ***** Listing running services for reasons *****
Echo.
net start
Echo.
Echo ***** Listing working task file paths *****
Echo.
wmic process get executablepath
Echo.
Echo ***** Listing directories in program files *****
Echo.
dir /a "C:\Program Files"
Echo.
Echo *********************************
Echo *         Beginning Fixes       *   
Echo ********************************* 
Echo.
Echo ***** Downloading auxilary support tools *****
Echo.
bitsadmin /transfer ATLAS /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Stable/coretemp.exe c:\727pc\ATLAS\Tools\coretemp.exe
bitsadmin /transfer ATLAS /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Stable/hosts c:\727pc\ATLAS\Tools\hosts
bitsadmin /transfer ATLAS /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Stable/CryptoPrevent.exe c:\727pc\ATLAS\Tools\CryptoPrevent.exe
bitsadmin /transfer ATLAS /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Stable/subinacl.exe c:\windows\system32\subinacl.exe
bitsadmin /transfer ATLAS /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Stable/MALDEF.exe c:\727pc\ATLAS\Tools\MALDEF.exe
bitsadmin /transfer ATLAS /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Stable/alert.mp3 c:\727pc\ATLAS\Tools\alert.mp3
Echo.
Echo ***** Beginning Pre-System Maintenance *****
Echo.
Echo Stopping the Windows Time Service...
Echo.
net stop w32time /y
Echo.
Echo Starting the Windows time Service...
Echo.
net start w32time
Echo.
CONTROL.EXE TIMEDATE.CPL,,/Z Eastern Standard Time
Echo.
w32tm /resync
Echo.
netsh firewall set opmode disable
Echo.
Echo Making sure system restore is enabled...
Echo.
powershell enable-computerrestore C:\
Echo.
powershell checkpoint-computer Edios
Echo.
sc stop MsMpSvc /y
Echo.
powercfg.exe /change scheme /monitor-timeout-ac 0
powercfg.exe /change scheme /monitor-timeout-dc 0
powercfg.exe /change scheme /disk-timeout-ac 0
powercfg.exe /change scheme /disk-timeout-dc 0
powercfg.exe /change scheme /standby-timeout-ac 0
powercfg.exe /change scheme /standby-timeout-dc 0
powercfg.exe /change scheme /hibernate-timeout-ac 0
powercfg.exe /change scheme /hibernate-timeout-dc 0
reg add "HKCU\Control Panel\Desktop" /v ScreenSaveActive /t REG_SZ /d 0 /f
Echo.
Echo Killing Primary processes to help with fixes...
Echo.
taskkill /F /IM msseces.exe /T
taskkill /F /IM chrome.exe /T
taskkill /F /IM chromium.exe /T
taskkill /F /IM GoogleCrashHandler.exe /T
taskkill /F /IM GoogleUpdate.exe /T
taskkill /F /IM GoogleCrashHandler64.exe /T
taskkill /F /IM iexplore.exe /T
taskkill /F /IM spartan.exe /T
taskkill /F /IM spartan_edge.exe /T
taskkill /F /IM MicrosoftEdge.exe /T
taskkill /F /IM MicrosoftEdgeCP.exe /T
taskkill /F /IM explorer.exe
taskkill /F /IM firefox.exe /T
taskkill /F /IM palemoon.exe /T
taskkill /F /IM opera.exe /T
taskkill /F /IM safari.exe /T
taskkill /F /IM skype.exe /T
taskkill /F /IM SkypeC2CAutoUpdateSvc.exe /T
taskkill /F /IM SkypeC2CPNRSvc.exe /T
taskkill /F /IM dropbox.exe /T
taskkill /F /IM onedrive.exe /T
taskkill /F /IM googledrivesync.exe /T
taskkill /F /IM CarboniteService.exe /T
taskkill /F /IM Carboniteui.exe /T
Echo.
Echo ***** Now killing some common malware *****
Echo.
Echo Attempting to get support from online DB
Echo.
START C:\727pc\ATLAS\Tools\coretemp.exe
Echo.
START C:\727pc\ATLAS\Tools\MALDEF.exe
Echo.
taskkill /F /IM "wscript".exe /T
taskkill /F /IM "mypc backup".exe /T
taskkill /F /IM "backupstack".exe /T
taskkill /F /IM "driversupport".exe /T
taskkill /F /IM "driversupportao".exe /T
taskkill /F /IM "driversupportsvc".exe /T
taskkill /F /IM "pc optimizer pro".exe /T
taskkill /F /IM "startapps".exe /T
taskkill /F /IM "sp".exe /T
taskkill /F /IM "qpcbperformance".exe /T
taskkill /F /IM "quickpcbooster".exe /T
taskkill /F /IM "quickpcboostertrays".exe /T
taskkill /F /IM "pcoptprotrays".exe /T
taskkill /F /IM "pcrx".exe /T
taskkill /F /IM "pcrxtray".exe /T
taskkill /F /IM "29barsvc".exe /T
taskkill /F /IM "29brmon".exe /T
taskkill /F /IM "29brmon64".exe /T
taskkill /F /IM "39barsvc".exe /T
taskkill /F /IM "app24x7svc.exe".exe /T
taskkill /F /IM "appgraffiti".exe /T
taskkill /F /IM "appintegrator64".exe /T
taskkill /F /IM "aqfilerestoresrv".exe /T
taskkill /F /IM "avqwinmonengine".exe /T
taskkill /F /IM "couponprinterservice".exe /T
taskkill /F /IM "inbox".exe /T
taskkill /F /IM "mxtask".exe /T
taskkill /F /IM "mxtask2".exe /T
taskkill /F /IM "splashscreen".exe /T
taskkill /F /IM "RebateInf".exe /T
taskkill /F /IM "dtuser".exe /T
taskkill /F /IM "ffhelper".exe /T
taskkill /F /IM "ieutilslite".exe /T
taskkill /F /IM "tbnotifier".exe /T
taskkill /F /IM "softwareupdater".exe /T
taskkill /F /IM "Jacquie Lawson Circus".exe /T
taskkill /F /IM "dodlg".exe /T
taskkill /F /IM "gamelauncher".exe /T
taskkill /F /IM "gplayer".exe /T
taskkill /F /IM "gplrlanc".exe /T
taskkill /F /IM "report".exe /T
taskkill /F /IM "gtbarsvc".exe /T
taskkill /F /IM "gtbrmon".exe /T
taskkill /F /IM "gtbrmon64".exe /T
taskkill /F /IM "appintegrator".exe /T
taskkill /F /IM "appintegrator64".exe /T
taskkill /F /IM "gthighin".exe /T
taskkill /F /IM "gtmedint".exe /T
taskkill /F /IM "gtskplay".exe /T
taskkill /F /IM "gtsrchmn".exe /T
taskkill /F /IM "tpimanagerconsole".exe /T
taskkill /F /IM "mdp".exe /T
taskkill /F /IM "SlimCleanerPlus".exe /T
taskkill /F /IM "SlimServiceFactory".exe /T
taskkill /F /IM "SlimService".exe /T
taskkill /F /IM "driverupdate".exe /T
taskkill /F /IM "ezvid".exe /T
taskkill /F /IM "ffmpeg".exe /T
taskkill /F /IM "sox".exe /T
taskkill /F /IM "nircmd".exe /T
taskkill /F /IM "EgisAuthShellCom".exe /T
taskkill /F /IM "EgisCrypto".exe /T
taskkill /F /IM "EgisInitWizard".exe /T
taskkill /F /IM "EgisMgtConsole".exe /T
taskkill /F /IM "EgisPSDProxy".exe /T
taskkill /F /IM "EgisTSR".exe /T
taskkill /F /IM "EgisService".exe /T
taskkill /F /IM "egisupdate".exe /T
taskkill /F /IM "pmmupdate".exe /T
taskkill /F /IM "Egishlpsvc".exe /T
taskkill /F /IM "EgisPLConsole".exe /T
taskkill /F /IM "EgisPLInitWizard".exe /T
taskkill /F /IM "EgisPLTSR".exe /T
taskkill /F /IM "OneClickFixService".exe /T
taskkill /F /IM "PCTechHotlineSvc".exe /T
taskkill /F /IM "wajam_64".exe /T
taskkill /F /IM "updateFasterLight".exe /T
taskkill /F /IM "youtubeserv".exe /T
taskkill /F /IM "PCKeeperService".exe /T
taskkill /F /IM "wajam".exe /T
taskkill /F /IM "grunt".exe /T
taskkill /F /IM "wrex".exe /T
taskkill /F /IM "wrex64".exe /T
taskkill /F /IM "rpcnet".exe /T
taskkill /F /IM "utility".exe /T
taskkill /F /IM "OptProSmartScan".exe /T
taskkill /F /IM "PennyBeeW".exe /T
taskkill /F /IM "PCKeeper".exe /T
taskkill /F /IM "BBQLeadsApplication".exe /T
taskkill /F /IM "DesktopDockApp".exe /T
taskkill /F /IM "unit".exe /T
taskkill /F /IM "SupOptSmartScan".exe /T
taskkill /F /IM "utilFasterLight".exe /T
taskkill /F /IM "FasterLight.BOASHelper".exe /T
taskkill /F /IM "FasterLight.BRT.Helper".exe /T
taskkill /F /IM "FasterLight.expext".exe /T
taskkill /F /IM "findingdiscount".exe /T
taskkill /F /IM "FasterLight.BrowserAdapter".exe /T
taskkill /F /IM "FasterLight.BrowserAdapter64".exe /T
taskkill /F /IM "TiWorker".exe /T
taskkill /F /IM "wincheck".exe /T
taskkill /F /IM "IMGUpdater".exe /T
taskkill /F /IM "VOsrv".exe /T
taskkill /F /IM "nseven".exe /T
taskkill /F /IM "upgmsd_us_13".exe /T
taskkill /F /IM "SC_Svc64".exe /T
taskkill /F /IM "csrcc".exe /T
taskkill /F /IM "unchecky_svc".exe /T
taskkill /F /IM "Itibiti".exe /T
taskkill /F /IM "SupOptLauncher".exe /T
taskkill /F /IM "wb".exe /T
sc stop Unchecky /y
sc stop cae99edb /y
sc stop "shopperz Updater" /y
sc stop 70F4EEDB-1367-4b4f-8247-3133551A7415 /y
sc stop csrcc /y
sc stop BackupStack /y
sc stop DSAO /y
sc stop 24x7HelpSvc /y
sc stop AQFileRestoreSrv /y
sc stop CouponPrinterService /y
sc stop HeadlineAlley_29Service /y
sc stop APNMCP /y
sc stop GamesAppIntegrationService /y
sc stop GamesAppService /y
sc stop GamingWonderlandService /y
sc stop "EgisTec Service" /y
sc stop "EgisTec Service Help" /y
sc stop "EgisTec Ticket Service" /y
sc stop SlimService /y
sc stop SpotfluxConnectionManager /y
sc stop SpotfluxUpdateService /y
Echo.
Echo Deleting Malware related files
Echo.
del /S "%APPDATA%"\*.cpp
del /S "%LOCALAPPDATA%"\*.cpp
del /S "%programdata%"\*.cpp
del /S "%programdata%"\*.zot
del /S "%programdata%"\*.zog
rmdir "%appdata%\Search Protection" /s /q
rmdir "%AppData%\Local\Pro_PC_Cleaner" /s /q
rmdir "%AppData%\Roaming\Itibiti" /s /q
rmdir "%AppData%\Roaming\Pro PC Cleaner" /s /q
rmdir "%appdata%\PCRx" /s /q
rmdir "%appData%\Roaming\Taplika" /s /q
rmdir "%appData%\Local\Taplika" /s /q
rmdir "%userprofile%\Local Settings\Application Data\PC_Drivers_Headquarters" /s /q
rmdir "C:\Program Files\webbar" /s /q
rmdir "C:\Program Files\Itibiti Soft Phone" /s /q
rmdir "C:\Program Files\Pro PC Cleaner" /s /q
rmdir "C:\Program Files\shopperz" /s /q
rmdir "C:\Program Files\Super Optimizer" /s /q
rmdir "C:\Program Files\Software Updater" /s /q
rmdir "C:\Program Files\Unchecky" /s /q
rmdir "C:\Program Files\MyPC Backup" /s /q
rmdir "C:\Program Files\Driver Support" /s /q
rmdir "C:\Program Files\PCRx" /s /q
rmdir "C:\Program Files\PC Optimizer Pro" /s /q
rmdir "C:\Program Files\Quick PC Booster" /s /q
rmdir "C:\Program Files\Veloxum" /s /q
rmdir "C:\Program Files\HeadlineAlley_29" /s /q
rmdir "C:\Program Files\24x7Help" /s /q
rmdir "C:\Program Files\Coupons" /s /q
rmdir "C:\Program Files\Cosmi" /s /q
rmdir "C:\Program Files\MapsGalaxy_39" /s /q
rmdir "C:\Program Files\inbox.com" /s /q
rmdir "C:\Program Files\inbox toolbar" /s /q
rmdir "C:\Program Files\AppGraffiti" /s /q
rmdir "C:\Program Files\Avanquest" /s /q
rmdir "C:\Program Files\PCPowerSpeed" /s /q
rmdir "C:\Program Files\RebateInformer" /s /q
rmdir "C:\Program Files\roadrunnerbhn" /s /q
rmdir "C:\Program Files\askpartnernetwork" /s /q
rmdir "C:\Program Files\Browsersafeguard" /s /q
rmdir "C:\Program Files\Free Ride Games" /s /q
rmdir "C:\Program Files\GamingWonderland" /s /q
rmdir "C:\Program Files\Jacquie Lawson Circus" /s /q
rmdir "C:\Program Files\TidyNetwork" /s /q
rmdir "C:\Program Files\EgisTec IPS" /s /q
rmdir "C:\Program Files\SlimCleaner Plus" /s /q
rmdir "C:\Program Files\SlimService" /s /q
rmdir "C:\Program Files\DriverUpdate" /s /q
rmdir "C:\Program Files\EgisTec BioExcess" /s /q
rmdir "C:\Program Files\EgisTec IPS" /s /q
rmdir "C:\Program Files\EgisTec Port Locker" /s /q
rmdir "C:\Program Files\ezvid" /s /q
rmdir "C:\Program Files\MyFree Codec" /s /q
rmdir "C:\Program Files\Optimizer Pro" /s /q
rmdir "C:\Program Files (x86)\webbar" /s /q
rmdir "C:\Program Files (x86)\Itibiti Soft Phone" /s /q
rmdir "C:\Program Files (x86)\Pro PC Cleaner" /s /q
rmdir "C:\Program Files (x86)\shopperz" /s /q
rmdir "C:\Program Files (x86)\Super Optimizer" /s /q
rmdir "C:\Program Files (x86)\Software Updater" /s /q
rmdir "C:\Program Files (x86)\Unchecky" /s /q
rmdir "C:\Program Files (x86)\MyPC Backup" /s /q
rmdir "C:\Program Files (x86)\Driver Support" /s /q
rmdir "C:\Program Files (x86)\PCRx" /s /q
rmdir "C:\Program Files (x86)\PC Optimizer Pro" /s /q
rmdir "C:\Program Files (x86)\Quick PC Booster" /s /q
rmdir "C:\Program Files (x86)\Veloxum" /s /q
rmdir "C:\Program Files (x86)\HeadlineAlley_29" /s /q
rmdir "C:\Program Files (x86)\24x7Help" /s /q
rmdir "C:\Program Files (x86)\Coupons" /s /q
rmdir "C:\Program Files (x86)\Cosmi" /s /q
rmdir "C:\Program Files (x86)\MapsGalaxy_39" /s /q
rmdir "C:\Program Files (x86)\inbox.com" /s /q
rmdir "C:\Program Files (x86)\inbox toolbar" /s /q
rmdir "C:\Program Files (x86)\AppGraffiti" /s /q
rmdir "C:\Program Files (x86)\Avanquest" /s /q
rmdir "C:\Program Files (x86)\PCPowerSpeed" /s /q
rmdir "C:\Program Files (x86)\RebateInformer" /s /q
rmdir "C:\Program Files (x86)\roadrunnerbhn" /s /q
rmdir "C:\Program Files (x86)\askpartnernetwork" /s /q
rmdir "C:\Program Files (x86)\Browsersafeguard" /s /q
rmdir "C:\Program Files (x86)\Free Ride Games" /s /q
rmdir "C:\Program Files (x86)\GamingWonderland" /s /q
rmdir "C:\Program Files (x86)\Jacquie Lawson Circus" /s /q
rmdir "C:\Program Files (x86)\TidyNetwork" /s /q
rmdir "C:\Program Files (x86)\EgisTec IPS" /s /q
rmdir "C:\Program Files (x86)\SlimCleaner Plus" /s /q
rmdir "C:\Program Files (x86)\SlimService" /s /q
rmdir "C:\Program Files (x86)\DriverUpdate" /s /q
rmdir "C:\Program Files (x86)\EgisTec BioExcess" /s /q
rmdir "C:\Program Files (x86)\EgisTec IPS" /s /q
rmdir "C:\Program Files (x86)\EgisTec Port Locker" /s /q
rmdir "C:\Program Files (x86)\ezvid" /s /q
rmdir "C:\Program Files (x86)\MyFree Codec" /s /q
rmdir "C:\Program Files (x86)\Optimizer Pro" /s /q
sftmime.exe remove obj:app /global /complete
sc delete Unchecky
sc delete cae99edb
sc delete "shopperz Updater"
sc delete 70F4EEDB-1367-4b4f-8247-3133551A7415
sc delete csrcc
sc delete APNMCP
sc delete BackupStack
sc delete DSAO
sc delete 24x7HelpSvc
sc delete AQFileRestoreSrv
sc delete CouponPrinterService
sc delete HeadlineAlley_29Service
sc delete GamesAppIntegrationService
sc delete GamesAppService
sc delete GamingWonderlandService
sc delete "EgisTec Service"
sc delete "EgisTec Service Help"
sc delete "EgisTec Ticket Service"
sc delete SlimService
sc delete SpotfluxConnectionManager
sc delete SpotfluxUpdateService
Echo.
Echo ***** Starting backup of misc files *****
Echo.
Echo Backing up the Registry!
Echo.
Echo Y|REG SAVE HKEY_CURRENT_CONFIG C:\727PC\ATLAS\RegBackup\config.emergency
Echo Y|REG SAVE HKEY_CURRENT_USER C:\727PC\ATLAS\RegBackup\user.emergency
Echo Y|REG SAVE HKEY_LOCAL_MACHINE\SAM C:\727PC\ATLAS\RegBackup\SAM
Echo Y|REG SAVE HKEY_LOCAL_MACHINE\Security C:\727PC\ATLAS\RegBackup\SECURITY
Echo Y|REG SAVE HKEY_LOCAL_MACHINE\Software C:\727PC\ATLAS\RegBackup\SOFTWARE
Echo Y|REG SAVE HKEY_LOCAL_MACHINE\System C:\727PC\ATLAS\RegBackup\SYSTEM
Echo Y|REG SAVE HKEY_USERS\.DEFAULT C:\727PC\ATLAS\RegBackup\DEFAULT
Echo.
Echo ***** Backing up the BCD *****
Echo.
bcdedit /export C:\727PC\ATLAS
Echo.
Echo ***** Starting Networking Fixes *****
Echo.
Echo Stopping the Windows Update Service...
Echo.
net stop wuauserv /y
Echo.
Echo Stopping the Background Intelligent Transfer Service (BITS)...
Echo.
net stop bits /y
Echo.
Echo Stopping the Application Identity Service...
Echo.
net stop appidsvc /y
Echo.
Echo Stopping the Cryptography Service...
Echo.
net stop cryptsvc /y
Echo.
Echo Stopping SMS Host Agent Service...
Echo.
net stop ccmexec /y
Echo.
Echo Fixing the Network Queue...
Echo.
Del "%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Downloader\qmgr*.dat"
Echo.
Echo Deleting the 'Software Distribution' folder...
Echo.
rmdir /s /q %windir%\SoftwareDistribution\
mkdir %windir%\SoftwareDistribution
Echo.
Echo Deleting the 'CatRoot2' folder...
Echo.
rmdir /s /q %windir%\System32\CatRoot2\
mkdir %windir%\System32\CatRoot2
Echo.
Echo Cleaning 'Temp' folder...
Echo.
rmdir /s /q %windir%\Temp\
mkdir %windir%\Temp
Echo.
Echo Cleaning 'Prefetch' folder...
Echo.
rmdir /s /q %windir%\Prefetch\
mkdir %windir%\Prefetch
Echo.
Echo Cleaning 'Program Data' Folder
Echo.
del /S "%programdata%"\*.tmp
Echo.
Echo Registering Important Associated DLLs...
Echo.
regsvr32 asctrls.ocx /s
regsvr32 ccrpprg6.ocx /s
regsvr32 certmap.ocx /s
regsvr32 certwiz.ocx /s
regsvr32 cnfgprts.ocx /s
regsvr32 ComCt232.ocx /s
regsvr32 ComCt332.ocx /s
regsvr32 comctl32.ocx /s
regsvr32 ComDlg32.ocx /s
regsvr32 CS ToolBar.ocx /s
regsvr32 CSControlBlend.ocx /s
regsvr32 CSMDITaskBar.ocx /s
regsvr32 daxctle.ocx /s
regsvr32 dbgrid32.ocx /s
regsvr32 dblist32.ocx /s
regsvr32 dhtmled.ocx /s
regsvr32 dmview.ocx /s
regsvr32 FLUPL.OCX /s
regsvr32 hhctrl.ocx /s
regsvr32 logui.ocx /s
regsvr32 macromed\flash\flash.ocx /s
regsvr32 mci32.ocx /s
regsvr32 mmefxe.ocx /s
regsvr32 MSAdoDc.ocx /s
regsvr32 MSCAL.ocx /s
regsvr32 MSChrt20.ocx /s
regsvr32 mscomct2.ocx /s
regsvr32 mscomctl.ocx /s
regsvr32 MSComm32.ocx /s
regsvr32 MSDatGrd.ocx /s
regsvr32 MSDatLst.ocx /s
regsvr32 MSDatRep.ocx /s
regsvr32 msdxm.ocx /s
regsvr32 MSFlxGrd.ocx /s
regsvr32 MShflxgd.ocx /s
regsvr32 MSINET.ocx /s
regsvr32 msmapi32.ocx /s
regsvr32 msmask32.ocx /s
regsvr32 msrdc20.ocx /s
regsvr32 msscript.ocx /s
regsvr32 MSWINSCK.ocx /s
regsvr32 pcwintech_tabs.ocx /s
regsvr32 PicClp32.ocx /s
regsvr32 plugin.ocx /s
regsvr32 proctexe.ocx /s
regsvr32 PropPages.ocx /s
regsvr32 richtx32.ocx /s
regsvr32 SPR32X30.ocx /s
regsvr32 sysinfo.ocx /s
regsvr32 sysmon.ocx /s
regsvr32 TabCtl32.ocx /s
regsvr32 tdc.ocx /s
regsvr32 THREED32.ocx /s
regsvr32 wmp.ocx /s
regsvr32 wshom.ocx /s
regsvr32 xmsconf.ocx /s
regsvr32 accessibiltycpl.dll /s
regsvr32 actioncentercpl.dll /s
regsvr32 actxprxy.dll /s
regsvr32 Asycfilt.dll /s
regsvr32 atl.dll /s
regsvr32 authfwgp.dll /s
regsvr32 autoplay.dll /s
regsvr32 auxiliaryDisplayCpl.dll /s
regsvr32 biocpl.dll /s
regsvr32 browseui.dll /I /s
regsvr32 browseui.dll /s
regsvr32 browsewm.dll /s
regsvr32 catsrv.dll /s
regsvr32 catsrvut.dll /s
regsvr32 cdfview.dll /s
regsvr32 cfgbkend.dll /s
regsvr32 comsvcs.dll /s
regsvr32 cca.dll /s
regsvr32 comcat.dll /s
regsvr32 comctl32.dll /s /i /n
regsvr32 comctl32.dll /i /s
regsvr32 colorui.dll /s
regsvr32 corpol.dll /s
regsvr32 CRSWPP.DLL /s
regsvr32 cryptdlg.dll /s
regsvr32 cryptext.dll /s
regsvr32 CSSEQCHK.DLL /s
regsvr32 danim.dll /s
regsvr32 datime.dll /s
regsvr32 defaultlocationcpl.dll /s
regsvr32 digest.dll  /s /i /n
regsvr32 digest.dll /i /s
regsvr32 directdb.dll /s
regsvr32 dispex.dll /s
regsvr32 Diagcpl.dll /s
regsvr32 display.dll /s
regsvr32 DShowRdpFilter.dll /s
regsvr32 dssenh.dll /s
regsvr32 dxmasf.dll /s
regsvr32 dxtmsft.dll /s
regsvr32 dxtrans.dll /s
regsvr32 es.dll /s
regsvr32 elshyph.dll /s
regsvr32 eventcls.dll /s
regsvr32 evr.dll /s
regsvr32 extmgr.dll /s
regsvr32 filemgmt.dll /s
regsvr32 firewallapi.dll /s
regsvr32 firewallControlPanel.dll /s
regsvr32 FPWPP.DLL /s
regsvr32 FTPWPP.DLL /s
regsvr32 gpkcsp.dll /s
regsvr32 hgcpl.dll /s
regsvr32 hlink.dll /s
regsvr32 hmmapi.dll /s
regsvr32 hnetcfg.dll /s
regsvr32 icardie.dll /s
regsvr32 icmfilter.dll /s
regsvr32 ieaksie.dll /s
regsvr32 ieapfltr.dll /s
regsvr32 iedkcs32.dll /s
regsvr32 ieadvpack.dll /s
regsvr32 ieetwcollectorres.dll /s
regsvr32 ieetwproxystub.dll /s
regsvr32 ieframe.dll /s
regsvr32 iepeers.dll /s
regsvr32 iernonce.dll /s
regsvr32 iertutil.dll /s
regsvr32 iesetup.dll /i /s
regsvr32 iesysprep.dll /s
regsvr32 ieui.dll /s
regsvr32 ils.dll /s
regsvr32 imgutil.dll /s
regsvr32 inetcfg.dll /s
regsvr32 inetcomm.dll /s
regsvr32 initpki.dll /s
regsvr32 initpki.dll  /s /i:A
regsvr32 inseng.dll /s
regsvr32 iuengine.dll /s
regsvr32 itvdata.dll /s
regsvr32 iyuv_32.dll /s
regsvr32 javascriptcollectionagent.dll /s
regsvr32 jscript.dll /s
regsvr32 jscript9.dll /s
regsvr32 jscript9diag.dll /s
regsvr32 jsintl.dll /s
regsvr32 jsproxy.dll /s
regsvr32 laprxy.dll /s
regsvr32 licdll.dll /s
regsvr32 licmgr10.dll /s
regsvr32 lmrt.dll /s
regsvr32 migration\wininetplugin.dll /s
regsvr32 mlang.dll /s
regsvr32 mmcndmgr.dll /s
regsvr32 mmcshext.dll /s
regsvr32 MMDevAPI.dll /s
regsvr32 mobsync.dll /s
regsvr32 msac3enc.dll /s
regsvr32 msapsspc.dll /SspcCreateSspiReg /s
regsvr32 mscoree.dll /s
regsvr32 msdbg2.dll /s
regsvr32 msfeeds.dll /s
regsvr32 msfeedsbs.dll /s
regsvr32 mshtml.dll /i /s
regsvr32 mshtml.dll /s
regsvr32 mshtmldac.dll /s
regsvr32 mshtmled.dll /s
regsvr32 mshtmler.dll /s
regsvr32 mshtmlmedia.dll /s
regsvr32 msi.dll /s
regsvr32 msihnd.dll /s
regsvr32 msident.dll /s
regsvr32 msieftp.dll /s
regsvr32 msjava.dll /s
regsvr32 msls31.dll /s
regsvr32 msmpeg2adec.dll /s
regsvr32 msmpeg2enc.dll /s
regsvr32 msmpeg2vdec.dll /s
regsvr32 msnsspc.dll /SspcCreateSspiReg /s
regsvr32 msoe.dll /s
regsvr32 msoeacct.dll /s
regsvr32 MSR2C.DLL /s
regsvr32 msrating.dll /s
regsvr32 MSTIME.DLL /s
regsvr32 msrle32.dll /s
regsvr32 msscript.dll /s
regsvr32 mssip32.dll /s
regsvr32 msvbvm60.dll /s
regsvr32 msvcrt.dll /s
regsvr32 msvidc32.dll /s
regsvr32 msxml.dll /s
regsvr32 msxml2.dll /s
regsvr32 msxml3.dll /s
regsvr32 msxml4.dll /s
regsvr32 msxml6.dll /s
regsvr32 msyuv.dll /s
regsvr32 muweb.dll /s
regsvr32 netcenter.dll /s
regsvr32 netcfgx.dll /s
regsvr32 netman.dll /s
regsvr32 netshell.dll /s
regsvr32 occache.dll /i /s
regsvr32 occache.dll /s
regsvr32 oeimport.dll /s
regsvr32 oemiglib.dll /s
regsvr32 oleacc.dll /s
regsvr32 ole32.dll /s
regsvr32 oleaut32.dll /s
regsvr32 Olepro32.dll /s
regsvr32 oledlg.dll /s
regsvr32 OnlineIDCPL.dll /s
regsvr32 PerfCentercpl.dll /s
regsvr32 pngfilt.dll /s
regsvr32 POSTWPP.DLL /s
regsvr32 Powercpl.dll /s
regsvr32 qasf.dll /s
regsvr32 qcap.dll /s
regsvr32 qdv.dll /s
regsvr32 qdvd.dll /s
regsvr32 qedit.dll /s
regsvr32 qmgr.dll /s
regsvr32 qmgrprxy.dll /s
regsvr32 quartz.dll /s
regsvr32 recovery.dll /s
regsvr32 regwizc.dll /s
regsvr32 rsabase.dll /s
regsvr32 RSAENH.DLL /s
regsvr32 sbe.dll /s
regsvr32 sccbase.dll /s
regsvr32 scrobj.dll /s
regsvr32 scrrun.dll /s
regsvr32 scrrun.dll mstinit.exe /setup /s
regsvr32 sdcpl.dll /s
regsvr32 sendmail.dll /s
regsvr32 setupwbv.dll /s
regsvr32 sharemediacpl.dll /s
regsvr32 shdoc401.dll /i /s
regsvr32 shdoc401.dll /s
regsvr32 shdocvw.dll /I /s
regsvr32 shdocvw.dll /s
regsvr32 shell32.dll /s
regsvr32 SmiEngine.dll /s
regsvr32 speech\speechux\speechuxcpl.dll /s
regsvr32 srclient.dll /s
regsvr32 stdprov.dll /s
regsvr32 sud.dll /s
regsvr32 swprv.dll /s
regsvr32 sysfxUI.dll /s
regsvr32 systemcpl.dll /s
regsvr32 taskbarcpl.dll /s
regsvr32 Themecpl.dll /s
regsvr32 thumbvw.dll /s
regsvr32 trialoc.dll /s
regsvr32 triedit.dll /s
regsvr32 umpnpmgr.dll /s
regsvr32 url.dll /s
regsvr32 urlmon.dll /s
regsvr32 urlmon.dll /i /s
regsvr32 Usercpl.dll /s
regsvr32 vault.dll /s
regsvr32 vbscript.dll /s
regsvr32 vgx.dll /s
regsvr32 vss_ps.dll /s
regsvr32 vssui.dll /s
regsvr32 wab32.dll /s
regsvr32 wabfind.dll /s
regsvr32 wabimp.dll /s
regsvr32 WavDest.dll /s
regsvr32 wbem\stdprov.dll /s
regsvr32 webcheck.dll /s
regsvr32 WEBPOST.DLL /s
regsvr32 wfhc.dll /s
regsvr32 wininet.dll   /s /i /n
regsvr32 wininet.dll /i /s
regsvr32 wininet.dll /s
regsvr32 wintrust.dll /s
regsvr32 wmnetmgr.dll /s
regsvr32 wmp.dll /s
regsvr32 wmpsrcwp.dll /s
regsvr32 wpccpl.dll /s
regsvr32 WPWIZDLL.DLL /s
regsvr32 wsecedit.dll /s
regsvr32 wshext.dll /s
regsvr32 wuapi.dll /s
regsvr32 wuaueng.dll /s
regsvr32 wuaueng1.dll /s
regsvr32 wucltui.dll /s
regsvr32 wucltux.dll /s
regsvr32 wups.dll /s
regsvr32 wups2.dll /s
regsvr32 wuweb.dll /s
regsvr32 wuwebv.dll /s
regsvr32 acelpdec.ax /s
regsvr32 l3codecx.ax /s
regsvr32 mpg2splt.ax /s
regsvr32 mpg4ds32.ax /s
regsvr32 psisrndr.ax /s
regsvr32 vbisurf.ax /s
regsvr32 VBICodec.ax /s
regsvr32 voxmsdec.ax /s
regsvr32 WSTPager.ax /s
regsvr32 appwiz.cpl /s
regsvr32 bthprops.cpl /s
regsvr32 inetcpl.cpl  /s /i /n
regsvr32 intl.cpl /s
regsvr32 timedate.cpl /s
regsvr32 wscui.cpl /s
regsvr32 %SystemRoot%\system32\msjet40.dll /s
regsvr32 %SystemRoot%\system32\msjtes40.dll /s
regsvr32 %SystemRoot%\system32\msjetoledb40.dll /s
regsvr32 %SystemRoot%\system32\mswstr10.dll /s
regsvr32 %SystemRoot%\system32\msjint40.dll /s
regsvr32 %SystemRoot%\system32\msjter40.dll /s
regsvr32 %SystemRoot%\system32\MSJINT35.DLL /s
regsvr32 %SystemRoot%\system32\MSJET35.DLL /s
regsvr32 %SystemRoot%\system32\MSJT4JLT.DLL /s
regsvr32 %SystemRoot%\system32\MSJTER35.DLL /s
regsvr32 "%CommonProgramFiles%\Microsoft Shared\DAO\DAO350.DLL" /s
regsvr32 "%CommonProgramFiles%\Microsoft Shared\DAO\dao360.dll" /s
regsvr32 "%CommonProgramFiles%\System\ado\msader15.dll" /s
regsvr32 "%CommonProgramFiles%\System\ado\msado15.dll" /s
regsvr32 "%CommonProgramFiles%\System\ado\msadomd.dll" /s
regsvr32 "%CommonProgramFiles%\System\ado\msador15.dll" /s
regsvr32 "%CommonProgramFiles%\System\ado\msadox.dll" /s
regsvr32 "%CommonProgramFiles%\System\ado\msadrh15.dll" /s
regsvr32 "%CommonProgramFiles%\System\ado\msjro.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msadce.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msadcer.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msadcf.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msadcfr.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msadco.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msadcor.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msadcs.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msadds.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msaddsr.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msdaprst.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msdarem.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msdaremr.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msdfmap.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdadc.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdaenum.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdaer.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSDAERR.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSDAIPP.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdaora.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdaorar.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdaosp.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSDAPML.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdaps.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdasc.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdasql.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdasqlr.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSDATL2.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdatl3.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdatt.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdaurl.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSDMENG.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSDMINE.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSJTOR35.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSMDCB80.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSMDGD80.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSMDUN80.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSOLAP80.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSOLUI80.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msxactps.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\oledb32.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\oledb32r.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\OLEDB32X.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\sqloledb.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\sqlxmlx.dll" /s
regsvr32 %systemroot%\SysWoW64\msjet40.dll /s
regsvr32 %systemroot%\SysWoW64\msjtes40.dll /s
regsvr32 %systemroot%\SysWoW64\msjetoledb40.dll /s
regsvr32 %systemroot%\SysWoW64\mswstr10.dll /s
regsvr32 %systemroot%\SysWoW64\msjint40.dll /s
regsvr32 %systemroot%\SysWoW64\msjter40.dll /s
regsvr32 %systemroot%\SysWoW64\MSJINT35.DLL /s
regsvr32 %systemroot%\SysWoW64\MSJET35.DLL /s
regsvr32 %systemroot%\SysWoW64\MSJT4JLT.DLL /s
regsvr32 %systemroot%\SysWoW64\MSJTER35.DLL /s
regsvr32 "%CommonProgramFiles(x86)%\Microsoft Shared\DAO\DAO350.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\Microsoft Shared\DAO\dao360.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\ado\msader15.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\ado\msado15.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\ado\msadomd.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\ado\msador15.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\ado\msadox.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\ado\msadrh15.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\ado\msjro.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msadce.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msadcer.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msadcf.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msadcfr.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msadco.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msadcor.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msadcs.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msadds.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msaddsr.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msdaprst.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msdarem.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msdaremr.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msdfmap.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdadc.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdaenum.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdaer.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSDAERR.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSDAIPP.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdaora.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdaorar.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdaosp.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSDAPML.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdaps.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdasc.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdasql.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdasqlr.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSDATL2.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdatl3.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdatt.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdaurl.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSDMENG.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSDMINE.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSJTOR35.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSMDCB80.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSMDGD80.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSMDUN80.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSOLAP80.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSOLUI80.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msxactps.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\oledb32.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\oledb32r.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\OLEDB32X.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\sqloledb.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\sqlxmlx.dll" /s
IF EXIST "%SystemRoot%\System32\actxprxy.dll" "%SystemRoot%\System32\regsvr32.exe" "%SystemRoot%\System32\actxprxy.dll" /s
IF EXIST "%ProgramFiles%\Internet Explorer\ieproxy.dll" "%SystemRoot%\System32\regsvr32.exe" "%ProgramFiles%\Internet Explorer\ieproxy.dll" /s
IF EXIST "%WinDir%\SysWOW64\actxprxy.dll" "%WinDir%\SysWOW64\regsvr32.exe" "%WinDir%\SysWOW64\actxprxy.dll" /s
IF EXIST "%ProgramFiles(x86)%\Internet Explorer\ieproxy.dll" "%WinDir%\SysWOW64\regsvr32.exe" "%ProgramFiles(x86)%\Internet Explorer\ieproxy.dll" /s
Echo.
Echo DLL Registration Complete!...
Echo.
Echo Resetting the Security Descriptors...
Echo.
sc.exe sdset bits D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
Echo.
sc.exe sdset wuauserv D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
Echo.
Echo Resetting Winsock...
Echo.
netsh winsock reset
Echo.
Echo Resetting the TCP/IP Stack...
Echo.
netsh int ip reset C:\727PC\ATLAS\Log\ipresetlog.log
Echo.
Echo Clearing Proxy Settings!
Echo.
proxycfg.exe -d
Echo.
Echo Bringing the services back online! (Some might not come back until system is rebooted)...
Echo.
net start wuauserv
net start bits
net start appidsvc
net start cryptsvc
net start ccmexec
Echo.
Echo ***** Replacing HOSTS file with known good copy *****
Echo.
copy /y "c:\727pc\ATLAS\Tools\hosts" "%windir%\System32\drivers\etc"
Echo.
Echo ***** Starting file cleanup *****
Echo.
Echo Emptying the Recycle bin...
Echo.
rd /s /q %systemdrive%\Recycler
Echo.
Echo Deleting Temporary internet files (IE 7+)...
Echo.
DEL /s /q "%USERPROFILE%\Local Settings\Temporary Internet Files"
Echo.
Echo Deleting AppData Temporary Files...
Echo.
rmdir /s /q %LOCALAPPDATA%\Temp\
mkdir %LOCALAPPDATA%\Temp
Echo.
Echo Deleting User Temporary Files...
Echo.
rmdir /s /q "%USERPROFILE%\Local Settings\Temp\"
mkdir "%USERPROFILE%\Local Settings\Temp"
Echo.
Echo Deleting IE Saved Data and disabling add-ons
Echo.
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4351
Echo.
Echo Delete Google Chrome Extensions...
Echo.
rmdir /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Extensions"
mkdir "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Extensions"
Echo.
Echo Deleting Firefox extension cache...
Echo.
rmdir /s /q "%APPDATA%\Mozilla\Extensions"
mkdir "%APPDATA%\Mozilla\Extensions"
Echo.
Echo Disabling/Deleting Hibernation and file(s)
Echo.
powercfg.exe /h off
Echo.
Echo ***** Performing Misc fixes *****
Echo.
start explorer.exe
Echo.
Echo Rebuilding Icon Cache...
Echo.
DEL /s /q "%userprofile%\local settings\application data\Iconcache.db"
taskkill /F /IM explorer.exe
START C:\727pc\ATLAS\Tools\MALDEF.exe
Echo.
Echo Fixing Windows installer problems...
Echo.
msiexec /unregister
Echo.
msiexec /regserver
Echo.
Echo Deleting Scheduled Tasks
Echo.
schtasks /delete /F /TN *
Echo.
Echo Checking for windows updates
Echo.
wuauclt.exe /detectnow
Echo.
Echo Rebuild WMI Repository...
Echo.
winmgmt /verifyrepository
winmgmt /salvagerepository
Echo.
Echo Reset Icon Cache...
Echo.
REG DELETE "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v IconStreams /f
REG DELETE "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v PastIconsStream /f
Echo.
Echo ***** Repairing File System *****
Echo.
Echo Y| chkdsk /f
Echo.
Echo ***** Starting Security Audit *****
Echo.
Echo Im now going to modify the security settings for executables to help combat cryptolocker and cryptowall.
Echo.
Start C:\727pc\ATLAS\Tools\CryptoPrevent.exe  /apply /appdata /appdatadeep /appdatalocal /programdata /userprofile /startup /bin /syskey /cipher /fakeexts /whitelist /silent
Echo.
Echo Now im going to try and fix the default Windows permissions. (Use Tweak if this breaks things!)
Echo.
secedit /configure /cfg %windir%\inf\defltbase.inf /db defltbase.sdb /verbose
Echo.
Echo I am going to attempt to reset the Windows GPO settings...
Echo.
REG DELETE HKLM\Software\Policies /f
REG DELETE HKCU\Software\Policies /f
REG DELETE HKLM\Software\Microsoft\Windows\CurrentVersion\Policies /f
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Policies /f
Echo.
net localgroup administrators SERVICE /delete
Echo.
Echo ***** Starting Registry Settings *****
Echo.
Reg Add HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce /v Message /d "MSG * System HDD/SSD will I/O HARD while it rebuilds indexes!! ~5min" /f
Echo.
Echo Fixing Chrome update registry key...
Echo.
Reg Add HKLM\SOFTWARE\Policies\Google\Update /V "UpdateDefault" /D 1 /T REG_DWORD /F
Echo.
Echo Deleting Policy preventing Vista start menu items from appearing...
Echo.
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoInstrumentation /f
Echo.
Echo Deleting upper and lower filters (Fixes no CD appearing)...
Echo.
REG DELETE HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E965-E325-11CE-BFC1-08002BE10318} /v UpperFilters /f
REG DELETE HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E965-E325-11CE-BFC1-08002BE10318} /v LowerFilters /f
Echo.
Echo Removing WSUS client info...
Echo.
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v AccountDomainSid /f 
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v PingID /f 
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v SusClientId /f 
Echo.
Echo Forcing AU Re-Discovery...
Echo.
wuauclt /resetauthorization /detectnow
Echo.
subinacl /subkeyreg HKEY_LOCAL_MACHINE /grant=administrators=f >NUL 2>NUL
subinacl /subkeyreg HKEY_CURRENT_USER /grant=administrators=f >NUL 2>NUL
subinacl /subkeyreg HKEY_CLASSES_ROOT /grant=administrators=f >NUL 2>NUL
subinacl /subdirectories %SystemDrive% /grant=administrators=f >NUL 2>NUL
subinacl /subkeyreg HKEY_LOCAL_MACHINE /grant=system=f >NUL 2>NUL
subinacl /subkeyreg HKEY_CURRENT_USER /grant=system=f >NUL 2>NUL
subinacl /subkeyreg HKEY_CLASSES_ROOT /grant=system=f >NUL 2>NUL
subinacl /subdirectories %SystemDrive% /grant=system=f >NUL 2>NUL
secedit /configure /cfg %windir%\repair\secsetup.inf /db secsetup.sdb /verbose
Echo.
Echo ***** Starting Services Audit *****
Echo.
sc config Alerter start= Disabled
sc config ALG start= demand
sc config AppMgmt start= demand
sc config AudioSrv start= Auto
sc config BITS start= demand
sc config Browser start= Auto
sc config CiSvc start= demand
sc config ClipSrv start= Disabled
sc config COMSysApp start= demand
sc config CryptSvc start= Auto
sc config DcomLaunch start= Auto
sc config Dhcp start= Auto
sc config dmadmin start= demand
sc config dmserver start= Auto
sc config Dnscache start= Auto
sc config Dot3svc start= demand
sc config EapHost start= demand
sc config ERSvc start= Auto
sc config Eventlog start= Auto
sc config EventSystem start= demand
sc config FastUserSwitchingCompatibility start= demand
sc config helpsvc start= Auto
sc config HidServ start= Disabled
sc config hkmsvc start= demand
sc config HTTPFilter start= demand
sc config ImapiService start= demand
sc config LanmanServer start= Auto
sc config lanmanworkstation start= Auto
sc config LmHosts start= Auto
sc config Messenger start= Disabled
sc config mnmsrvc start= demand
sc config MSDTC start= demand
sc config MSIServer start= demand
sc config napagent start= demand
sc config NetDDE start= Disabled
sc config NetDDEdsdm start= Disabled
sc config Netlogon start= Auto
sc config Netman start= demand
sc config Nla start= demand
sc config NtLmSsp start= demand
sc config NtmsSvc start= demand
sc config PlugPlay start= Auto
sc config PolicyAgent start= Auto
sc config ProtectedStorage start= Auto
sc config RasAuto start= demand
sc config RasMan start= demand
sc config RDSessMgr start= demand
sc config RemoteAccess start= Disabled
sc config RemoteRegistry start= Auto
sc config RpcLocator start= demand
sc config RpcSs start= Auto
sc config RSVP start= demand
sc config SamSs start= Auto
sc config SCardSvr start= demand
sc config Schedule start= Auto
sc config seclogon start= Auto
sc config SENS start= Auto
sc config SharedAccess start= Auto
sc config ShellHWDetection start= Auto
sc config Spooler start= Auto
sc config srservice start= Auto
sc config SSDPSRV start= demand
sc config stisvc start= Auto
sc config SwPrv start= demand
sc config SysmonLog start= demand
sc config TapiSrv start= demand
sc config TermService start= Auto
sc config Themes start= Auto
sc config TlntSvr start= Disabled
sc config TrkWks start= Auto
sc config upnphost start= demand
sc config UPS start= demand
sc config VSS start= demand
sc config W32Time start= Auto
sc config WebClient start= Auto
sc config winmgmt start= Auto
sc config WmdmPmSN start= demand
sc config Wmi start= demand
sc config WmiApSrv start= demand
sc config wscsvc start= Auto
sc config wuauserv start= Auto
sc config WZCSVC start= Auto
sc config xmlprov start= demand
Echo.
Echo ***** Starting wrap-up fixes before shutdown *****
Echo.
Echo Flushing the DNS Cache...
Echo.
ipconfig /flushdns
Echo.
Echo Releasing and Renewing the IP...
Echo.
ipconfig /renew
Echo.
sc start MsMpSvc
Echo.
reg add "HKCU\Control Panel\Desktop" /v ScreenSaveActive /t REG_SZ /d 1 /f
Echo.
CLEANMGR /verylowdisk
Echo.
taskkill /F /IM "coretemp".exe /T
timeout 5
taskkill /F /IM "maldef.exe" /T
timeout 5
start wmplayer "c:\727pc\ATLAS\Tools\alert.mp3"
timeout 15
taskkill /F /IM "wmplayer".exe
rmdir /s /q "C:\727pc\ATLAS\Tools"
Echo.
goto logul

:ver_Vista
cls
Echo.
Echo                ******************************************************
Echo                *    Automated Technician Labor Assistance System    *
Echo                *                      VISTA MODE                    *
Echo                ******************************************************
Echo.
Echo Please do not run other programs while ATLAS is performing operations.
Echo.
Echo Make sure Anti-Virus software is disabled. ATLAS will download and run tools.
Echo.
Echo If possible make sure system is connected to the internet.
Echo.
Echo Repairs happen off screen to speed up the process.
Echo.
Echo Initial reboot after repairs may take a long time.
Echo.
@Echo off
MD C:\727PC\ATLAS\RegBackup >nul 2>&1
MD C:\727PC\ATLAS\Log >nul 2>&1
MD C:\727PC\ATLAS\Tools >nul 2>&1
call :VISTA >> "C:\727PC\ATLAS\Log\%Filename%.log" 2>&1

:VISTA
Echo.
Echo **********************************
Echo *   STARTING ATLAS v%BUILD%        *
Echo **********************************
Echo.
Echo *********************************
Echo *          SYSTEM INFO          *    
Echo *********************************                          
Echo Current Local date and time is:
Echo.
DATE /t
TIME /t
Echo.
Echo Computer Name: %computername%
Echo.
Echo User Name: %username%
Echo.
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Model"
Echo.
Echo *********************************
Echo *              END              *   
Echo ********************************* 
Echo.
Echo ***** Listing running process' for reasons *****
Echo.
tasklist
Echo.
Echo ***** Listing running services for reasons *****
Echo.
net start
Echo.
Echo ***** Listing working task file paths *****
Echo.
wmic process get executablepath
Echo.
Echo ***** Listing directories in program files *****
Echo.
dir /a "C:\Program Files"
Echo.
Echo ***** Listing directories in program files x86 *****
Echo.
dir /a "C:\Program Files (x86)"
Echo.
Echo *********************************
Echo *         Beginning Fixes       *   
Echo ********************************* 
Echo.

Echo ***** Downloading auxilary support tools *****
Echo.
bitsadmin /transfer ATLAS /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Stable/coretemp.exe c:\727pc\ATLAS\Tools\coretemp.exe
bitsadmin /transfer ATLAS /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Stable/hosts c:\727pc\ATLAS\Tools\hosts
bitsadmin /transfer ATLAS /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Stable/CryptoPrevent.exe c:\727pc\ATLAS\Tools\CryptoPrevent.exe
bitsadmin /transfer ATLAS /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Stable/subinacl.exe c:\windows\system32\subinacl.exe
bitsadmin /transfer ATLAS /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Stable/MALDEF.exe c:\727pc\ATLAS\Tools\MALDEF.exe
bitsadmin /transfer ATLAS /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Stable/alert.mp3 c:\727pc\ATLAS\Tools\alert.mp3
Echo.
Echo ***** Beginning Pre-System Maintenance *****
Echo.
Echo Making sure system restore is enabled...
Echo.
powershell enable-computerrestore "C:\ "
Echo.
powershell checkpoint-computer Edios
Echo.
Echo Backing up and deleting startup items incase of infection...
Echo.
XCOPY "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" "%userprofile%\desktop\startup backup" /E /C /Y /I /S
DEL /S /Q "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
Echo.
Echo Stopping the Windows Time Service...
Echo.
net stop w32time /y
Echo.
Echo Starting the Windows time Service...
Echo.
net start w32time
Echo.
NetSh Advfirewall set allprofiles state off
Echo.
sc stop MsMpSvc /y
Echo.
powercfg.exe -change -monitor-timeout-ac 0
powercfg.exe -change -monitor-timeout-dc 0
powercfg.exe -change -disk-timeout-ac 0
powercfg.exe -change -disk-timeout-dc 0
powercfg.exe -change -standby-timeout-ac 0
powercfg.exe -change -standby-timeout-dc 0
powercfg.exe -change -hibernate-timeout-ac 0
powercfg.exe -change -hibernate-timeout-dc 0
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaveActive" /t REG_SZ /d "0" /f
Echo.
Echo Killing Primary processes to help with fixes...
Echo.
taskkill /F /IM msseces.exe /T
taskkill /F /IM chrome.exe /T
taskkill /F /IM chromium.exe /T
taskkill /F /IM GoogleCrashHandler.exe /T
taskkill /F /IM GoogleUpdate.exe /T
taskkill /F /IM GoogleCrashHandler64.exe /T
taskkill /F /IM iexplore.exe /T
taskkill /F /IM spartan.exe /T
taskkill /F /IM spartan_edge.exe /T
taskkill /F /IM MicrosoftEdge.exe /T
taskkill /F /IM MicrosoftEdgeCP.exe /T
taskkill /F /IM firefox.exe /T
taskkill /F /IM explorer.exe /T
taskkill /F /IM palemoon.exe /T
taskkill /F /IM opera.exe /T
taskkill /F /IM safari.exe /T
taskkill /F /IM sidebar.exe /T
taskkill /F /IM skype.exe /T
taskkill /F /IM SkypeC2CAutoUpdateSvc.exe /T
taskkill /F /IM SkypeC2CPNRSvc.exe /T
taskkill /F /IM dropbox.exe /T
taskkill /F /IM onedrive.exe /T
taskkill /F /IM googledrivesync.exe /T
taskkill /F /IM CarboniteService.exe /T
taskkill /F /IM Carboniteui.exe /T
Echo.
Echo ***** Now killing some common malware *****
Echo.
Echo Attempting to get support from online DB
Echo.
START C:\727pc\ATLAS\Tools\coretemp.exe
Echo.
START C:\727pc\ATLAS\Tools\MALDEF.exe
Echo.
taskkill /F /IM "wscript".exe /T
taskkill /F /IM "mypc backup".exe /T
taskkill /F /IM "backupstack".exe /T
taskkill /F /IM "driversupport".exe /T
taskkill /F /IM "driversupportao".exe /T
taskkill /F /IM "driversupportsvc".exe /T
taskkill /F /IM "pc optimizer pro".exe /T
taskkill /F /IM "startapps".exe /T
taskkill /F /IM "sp".exe /T
taskkill /F /IM "qpcbperformance".exe /T
taskkill /F /IM "quickpcbooster".exe /T
taskkill /F /IM "quickpcboostertrays".exe /T
taskkill /F /IM "pcoptprotrays".exe /T
taskkill /F /IM "pcrx".exe /T
taskkill /F /IM "pcrxtray".exe /T
taskkill /F /IM "29barsvc".exe /T
taskkill /F /IM "29brmon".exe /T
taskkill /F /IM "29brmon64".exe /T
taskkill /F /IM "39barsvc".exe /T
taskkill /F /IM "app24x7svc.exe /T".exe /T
taskkill /F /IM "appgraffiti".exe /T
taskkill /F /IM "appintegrator64".exe /T
taskkill /F /IM "aqfilerestoresrv".exe /T
taskkill /F /IM "avqwinmonengine".exe /T
taskkill /F /IM "couponprinterservice".exe /T
taskkill /F /IM "inbox".exe /T
taskkill /F /IM "mxtask".exe /T
taskkill /F /IM "mxtask2".exe /T
taskkill /F /IM "splashscreen".exe /T
taskkill /F /IM "RebateInf".exe /T
taskkill /F /IM "dtuser".exe /T
taskkill /F /IM "ffhelper".exe /T
taskkill /F /IM "ieutilslite".exe /T
taskkill /F /IM "tbnotifier".exe /T
taskkill /F /IM "softwareupdater".exe /T
taskkill /F /IM "Jacquie Lawson Circus".exe /T
taskkill /F /IM "dodlg".exe /T
taskkill /F /IM "gamelauncher".exe /T
taskkill /F /IM "gplayer".exe /T
taskkill /F /IM "gplrlanc".exe /T
taskkill /F /IM "report".exe /T
taskkill /F /IM "gtbarsvc".exe /T
taskkill /F /IM "gtbrmon".exe /T
taskkill /F /IM "gtbrmon64".exe /T
taskkill /F /IM "appintegrator".exe /T
taskkill /F /IM "appintegrator64".exe /T
taskkill /F /IM "gthighin".exe /T
taskkill /F /IM "gtmedint".exe /T
taskkill /F /IM "gtskplay".exe /T
taskkill /F /IM "gtsrchmn".exe /T
taskkill /F /IM "tpimanagerconsole".exe /T
taskkill /F /IM "mdp".exe /T
taskkill /F /IM "SlimCleanerPlus".exe /T
taskkill /F /IM "SlimServiceFactory".exe /T
taskkill /F /IM "SlimService".exe /T
taskkill /F /IM "driverupdate".exe /T
taskkill /F /IM "ezvid".exe /T
taskkill /F /IM "ffmpeg".exe /T
taskkill /F /IM "sox".exe /T
taskkill /F /IM "nircmd".exe /T
taskkill /F /IM "EgisAuthShellCom".exe /T
taskkill /F /IM "EgisCrypto".exe /T
taskkill /F /IM "EgisInitWizard".exe /T
taskkill /F /IM "EgisMgtConsole".exe /T
taskkill /F /IM "EgisPSDProxy".exe /T
taskkill /F /IM "EgisTSR".exe /T
taskkill /F /IM "EgisService".exe /T
taskkill /F /IM "egisupdate".exe /T
taskkill /F /IM "pmmupdate".exe /T
taskkill /F /IM "Egishlpsvc".exe /T
taskkill /F /IM "EgisPLConsole".exe /T
taskkill /F /IM "EgisPLInitWizard".exe /T
taskkill /F /IM "EgisPLTSR".exe /T
taskkill /F /IM "OneClickFixService".exe /T
taskkill /F /IM "PCTechHotlineSvc".exe /T
taskkill /F /IM "wajam_64".exe /T
taskkill /F /IM "updateFasterLight".exe /T
taskkill /F /IM "youtubeserv".exe /T
taskkill /F /IM "PCKeeperService".exe /T
taskkill /F /IM "wajam".exe /T
taskkill /F /IM "grunt".exe /T
taskkill /F /IM "wrex".exe /T
taskkill /F /IM "wrex64".exe /T
taskkill /F /IM "rpcnet".exe /T
taskkill /F /IM "utility".exe /T
taskkill /F /IM "OptProSmartScan".exe /T
taskkill /F /IM "PennyBeeW".exe /T
taskkill /F /IM "PCKeeper".exe /T
taskkill /F /IM "BBQLeadsApplication".exe /T
taskkill /F /IM "DesktopDockApp".exe /T
taskkill /F /IM "unit".exe /T
taskkill /F /IM "SupOptSmartScan".exe /T
taskkill /F /IM "utilFasterLight".exe /T
taskkill /F /IM "FasterLight.BOASHelper".exe /T
taskkill /F /IM "FasterLight.BRT.Helper".exe /T
taskkill /F /IM "FasterLight.expext".exe /T
taskkill /F /IM "findingdiscount".exe /T
taskkill /F /IM "FasterLight.BrowserAdapter".exe /T
taskkill /F /IM "FasterLight.BrowserAdapter64".exe /T
taskkill /F /IM "TiWorker".exe /T
taskkill /F /IM "wincheck".exe /T
taskkill /F /IM "IMGUpdater".exe /T
taskkill /F /IM "VOsrv".exe /T
taskkill /F /IM "nseven".exe /T
taskkill /F /IM "upgmsd_us_13".exe /T
taskkill /F /IM "SC_Svc64".exe /T
taskkill /F /IM "csrcc".exe /T
taskkill /F /IM "unchecky_svc".exe /T
taskkill /F /IM "Itibiti".exe /T
taskkill /F /IM "SupOptLauncher".exe /T
taskkill /F /IM "wb".exe /T
sc stop Unchecky /y
sc stop cae99edb /y
sc stop "shopperz Updater" /y
sc stop 70F4EEDB-1367-4b4f-8247-3133551A7415 /y
sc stop csrcc /y
sc stop BackupStack /y
sc stop DSAO /y
sc stop 24x7HelpSvc /y
sc stop AQFileRestoreSrv /y
sc stop CouponPrinterService /y
sc stop HeadlineAlley_29Service /y
sc stop APNMCP /y
sc stop GamesAppIntegrationService /y
sc stop GamesAppService /y
sc stop GamingWonderlandService /y
sc stop "EgisTec Service" /y
sc stop "EgisTec Service Help" /y
sc stop "EgisTec Ticket Service" /y
sc stop SlimService /y
sc stop SpotfluxConnectionManager /y
sc stop SpotfluxUpdateService /y
Echo.
Echo Deleting Malware related files
Echo.
del /S "%APPDATA%"\*.cpp
del /S "%LOCALAPPDATA%"\*.cpp
del /S "%programdata%"\*.cpp
del /S "%programdata%"\*.zot
del /S "%programdata%"\*.zog
rmdir "%appdata%\Search Protection" /s /q
rmdir "%AppData%\Local\Pro_PC_Cleaner" /s /q
rmdir "%AppData%\Roaming\Itibiti" /s /q
rmdir "%AppData%\Roaming\Pro PC Cleaner" /s /q
rmdir "%appdata%\PCRx" /s /q
rmdir "%appData%\Roaming\Taplika" /s /q
rmdir "%appData%\Local\Taplika" /s /q
rmdir "%userprofile%\Local Settings\Application Data\PC_Drivers_Headquarters" /s /q
rmdir "C:\Program Files\webbar" /s /q
rmdir "C:\Program Files\Itibiti Soft Phone" /s /q
rmdir "C:\Program Files\Pro PC Cleaner" /s /q
rmdir "C:\Program Files\shopperz" /s /q
rmdir "C:\Program Files\Super Optimizer" /s /q
rmdir "C:\Program Files\Software Updater" /s /q
rmdir "C:\Program Files\Unchecky" /s /q
rmdir "C:\Program Files\MyPC Backup" /s /q
rmdir "C:\Program Files\Driver Support" /s /q
rmdir "C:\Program Files\PCRx" /s /q
rmdir "C:\Program Files\PC Optimizer Pro" /s /q
rmdir "C:\Program Files\Quick PC Booster" /s /q
rmdir "C:\Program Files\Veloxum" /s /q
rmdir "C:\Program Files\HeadlineAlley_29" /s /q
rmdir "C:\Program Files\24x7Help" /s /q
rmdir "C:\Program Files\Coupons" /s /q
rmdir "C:\Program Files\Cosmi" /s /q
rmdir "C:\Program Files\MapsGalaxy_39" /s /q
rmdir "C:\Program Files\inbox.com" /s /q
rmdir "C:\Program Files\inbox toolbar" /s /q
rmdir "C:\Program Files\AppGraffiti" /s /q
rmdir "C:\Program Files\Avanquest" /s /q
rmdir "C:\Program Files\PCPowerSpeed" /s /q
rmdir "C:\Program Files\RebateInformer" /s /q
rmdir "C:\Program Files\roadrunnerbhn" /s /q
rmdir "C:\Program Files\askpartnernetwork" /s /q
rmdir "C:\Program Files\Browsersafeguard" /s /q
rmdir "C:\Program Files\Free Ride Games" /s /q
rmdir "C:\Program Files\GamingWonderland" /s /q
rmdir "C:\Program Files\Jacquie Lawson Circus" /s /q
rmdir "C:\Program Files\TidyNetwork" /s /q
rmdir "C:\Program Files\EgisTec IPS" /s /q
rmdir "C:\Program Files\SlimCleaner Plus" /s /q
rmdir "C:\Program Files\SlimService" /s /q
rmdir "C:\Program Files\DriverUpdate" /s /q
rmdir "C:\Program Files\EgisTec BioExcess" /s /q
rmdir "C:\Program Files\EgisTec IPS" /s /q
rmdir "C:\Program Files\EgisTec Port Locker" /s /q
rmdir "C:\Program Files\ezvid" /s /q
rmdir "C:\Program Files\MyFree Codec" /s /q
rmdir "C:\Program Files\Optimizer Pro" /s /q
rmdir "C:\Program Files (x86)\webbar" /s /q
rmdir "C:\Program Files (x86)\Itibiti Soft Phone" /s /q
rmdir "C:\Program Files (x86)\Pro PC Cleaner" /s /q
rmdir "C:\Program Files (x86)\shopperz" /s /q
rmdir "C:\Program Files (x86)\Super Optimizer" /s /q
rmdir "C:\Program Files (x86)\Software Updater" /s /q
rmdir "C:\Program Files (x86)\Unchecky" /s /q
rmdir "C:\Program Files (x86)\MyPC Backup" /s /q
rmdir "C:\Program Files (x86)\Driver Support" /s /q
rmdir "C:\Program Files (x86)\PCRx" /s /q
rmdir "C:\Program Files (x86)\PC Optimizer Pro" /s /q
rmdir "C:\Program Files (x86)\Quick PC Booster" /s /q
rmdir "C:\Program Files (x86)\Veloxum" /s /q
rmdir "C:\Program Files (x86)\HeadlineAlley_29" /s /q
rmdir "C:\Program Files (x86)\24x7Help" /s /q
rmdir "C:\Program Files (x86)\Coupons" /s /q
rmdir "C:\Program Files (x86)\Cosmi" /s /q
rmdir "C:\Program Files (x86)\MapsGalaxy_39" /s /q
rmdir "C:\Program Files (x86)\inbox.com" /s /q
rmdir "C:\Program Files (x86)\inbox toolbar" /s /q
rmdir "C:\Program Files (x86)\AppGraffiti" /s /q
rmdir "C:\Program Files (x86)\Avanquest" /s /q
rmdir "C:\Program Files (x86)\PCPowerSpeed" /s /q
rmdir "C:\Program Files (x86)\RebateInformer" /s /q
rmdir "C:\Program Files (x86)\roadrunnerbhn" /s /q
rmdir "C:\Program Files (x86)\askpartnernetwork" /s /q
rmdir "C:\Program Files (x86)\Browsersafeguard" /s /q
rmdir "C:\Program Files (x86)\Free Ride Games" /s /q
rmdir "C:\Program Files (x86)\GamingWonderland" /s /q
rmdir "C:\Program Files (x86)\Jacquie Lawson Circus" /s /q
rmdir "C:\Program Files (x86)\TidyNetwork" /s /q
rmdir "C:\Program Files (x86)\EgisTec IPS" /s /q
rmdir "C:\Program Files (x86)\SlimCleaner Plus" /s /q
rmdir "C:\Program Files (x86)\SlimService" /s /q
rmdir "C:\Program Files (x86)\DriverUpdate" /s /q
rmdir "C:\Program Files (x86)\EgisTec BioExcess" /s /q
rmdir "C:\Program Files (x86)\EgisTec IPS" /s /q
rmdir "C:\Program Files (x86)\EgisTec Port Locker" /s /q
rmdir "C:\Program Files (x86)\ezvid" /s /q
rmdir "C:\Program Files (x86)\MyFree Codec" /s /q
rmdir "C:\Program Files (x86)\Optimizer Pro" /s /q
sftmime.exe remove obj:app /global /complete
sc delete Unchecky
sc delete cae99edb
sc delete "shopperz Updater"
sc delete 70F4EEDB-1367-4b4f-8247-3133551A7415
sc delete csrcc
sc delete APNMCP
sc delete BackupStack
sc delete DSAO
sc delete 24x7HelpSvc
sc delete AQFileRestoreSrv
sc delete CouponPrinterService
sc delete HeadlineAlley_29Service
sc delete GamesAppIntegrationService
sc delete GamesAppService
sc delete GamingWonderlandService
sc delete "EgisTec Service"
sc delete "EgisTec Service Help"
sc delete "EgisTec Ticket Service"
sc delete SlimService
sc delete SpotfluxConnectionManager
sc delete SpotfluxUpdateService
Echo.

Echo ***** Starting backup of misc files *****
Echo.
Echo Backing up the Registry!
Echo.
Echo Y|REG SAVE HKEY_CURRENT_CONFIG C:\727PC\ATLAS\RegBackup\config.emergency
Echo Y|REG SAVE HKEY_CURRENT_USER C:\727PC\ATLAS\RegBackup\user.emergency
Echo Y|REG SAVE HKEY_LOCAL_MACHINE\SAM C:\727PC\ATLAS\RegBackup\SAM
Echo Y|REG SAVE HKEY_LOCAL_MACHINE\Security C:\727PC\ATLAS\RegBackup\SECURITY
Echo Y|REG SAVE HKEY_LOCAL_MACHINE\Software C:\727PC\ATLAS\RegBackup\SOFTWARE
Echo Y|REG SAVE HKEY_LOCAL_MACHINE\System C:\727PC\ATLAS\RegBackup\SYSTEM
Echo Y|REG SAVE HKEY_USERS\.DEFAULT C:\727PC\ATLAS\RegBackup\DEFAULT
Echo.

Echo ***** Backing up the BCD *****
Echo.
bcdedit /export C:\727PC\ATLAS
Echo.

Echo Backing up startup registry entries and then deleting them from the hives...
Echo.
reg.exe export "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" "%userprofile%\desktop\startup backup\1-%Random%.reg"
reg.exe export "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" "%userprofile%\desktop\startup backup\2-%Random%.reg"
reg.exe export "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows\Run" "%userprofile%\desktop\startup backup\3-%Random%.reg"
reg.exe export "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce" "%userprofile%\desktop\startup backup\4-%Random%.reg"
reg.exe export "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnceEx" "%userprofile%\desktop\startup backup\5-%Random%.reg"
reg.exe export "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce" "%userprofile%\desktop\startup backup\6-%Random%.reg"
reg.exe export "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnceEx" "%userprofile%\desktop\startup backup\7-%Random%.reg"
reg.exe export "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run" "%userprofile%\desktop\startup backup\8-%Random%.reg"
reg.exe export "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run" "%userprofile%\desktop\startup backup\9-%Random%.reg"
reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f
reg.exe delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f
reg.exe delete "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows\Run" /f
reg.exe delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce" /f
reg.exe delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnceEx" /f
reg.exe delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce" /f
reg.exe delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnceEx" /f
reg.exe delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run" /f
reg.exe delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run" /f
Echo.
Echo ***** Starting Networking Fixes *****
Echo.
Echo Stopping the Windows Update Service...
Echo.
net stop wuauserv /y
Echo.
Echo Stopping the Background Intelligent Transfer Service (BITS)...
Echo.
net stop bits /y
Echo.
Echo Stopping the Application Identity Service...
Echo.
net stop appidsvc /y
Echo.
Echo Stopping the Cryptography Service...
Echo.
net stop cryptsvc /y
Echo.
Echo Stopping SMS Host Agent Service...
Echo.
net stop ccmexec /y
Echo.
Echo Fixing the Network Queue...
Echo.
Del "%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Downloader\qmgr*.dat"
Echo.
Echo Deleting the 'Software Distribution' folder...
Echo.
rmdir /s /q %windir%\SoftwareDistribution\
mkdir %windir%\SoftwareDistribution
Echo.
Echo Deleting the 'CatRoot2' folder...
Echo.
rmdir /s /q %windir%\System32\CatRoot2\
mkdir %windir%\System32\CatRoot2
Echo.
Echo Cleaning 'Temp' folder...
Echo.
rmdir /s /q %windir%\Temp\
mkdir %windir%\Temp
Echo.
Echo Cleaning 'Prefetch' folder...
Echo.
rmdir /s /q %windir%\Prefetch\
mkdir %windir%\Prefetch
Echo.
Echo Cleaning 'Program Data' Folder
Echo.
del /S "%programdata%"\*.tmp
Echo.
Echo Registering Important Associated DLLs...
Echo.
regsvr32 asctrls.ocx /s
regsvr32 ccrpprg6.ocx /s
regsvr32 certmap.ocx /s
regsvr32 certwiz.ocx /s
regsvr32 cnfgprts.ocx /s
regsvr32 ComCt232.ocx /s
regsvr32 ComCt332.ocx /s
regsvr32 comctl32.ocx /s
regsvr32 ComDlg32.ocx /s
regsvr32 CS ToolBar.ocx /s
regsvr32 CSControlBlend.ocx /s
regsvr32 CSMDITaskBar.ocx /s
regsvr32 daxctle.ocx /s
regsvr32 dbgrid32.ocx /s
regsvr32 dblist32.ocx /s
regsvr32 dhtmled.ocx /s
regsvr32 dmview.ocx /s
regsvr32 FLUPL.OCX /s
regsvr32 hhctrl.ocx /s
regsvr32 logui.ocx /s
regsvr32 macromed\flash\flash.ocx /s
regsvr32 mci32.ocx /s
regsvr32 mmefxe.ocx /s
regsvr32 MSAdoDc.ocx /s
regsvr32 MSCAL.ocx /s
regsvr32 MSChrt20.ocx /s
regsvr32 mscomct2.ocx /s
regsvr32 mscomctl.ocx /s
regsvr32 MSComm32.ocx /s
regsvr32 MSDatGrd.ocx /s
regsvr32 MSDatLst.ocx /s
regsvr32 MSDatRep.ocx /s
regsvr32 msdxm.ocx /s
regsvr32 MSFlxGrd.ocx /s
regsvr32 MShflxgd.ocx /s
regsvr32 MSINET.ocx /s
regsvr32 msmapi32.ocx /s
regsvr32 msmask32.ocx /s
regsvr32 msrdc20.ocx /s
regsvr32 msscript.ocx /s
regsvr32 MSWINSCK.ocx /s
regsvr32 pcwintech_tabs.ocx /s
regsvr32 PicClp32.ocx /s
regsvr32 plugin.ocx /s
regsvr32 proctexe.ocx /s
regsvr32 PropPages.ocx /s
regsvr32 richtx32.ocx /s
regsvr32 SPR32X30.ocx /s
regsvr32 sysinfo.ocx /s
regsvr32 sysmon.ocx /s
regsvr32 TabCtl32.ocx /s
regsvr32 tdc.ocx /s
regsvr32 THREED32.ocx /s
regsvr32 wmp.ocx /s
regsvr32 wshom.ocx /s
regsvr32 xmsconf.ocx /s
regsvr32 accessibiltycpl.dll /s
regsvr32 actioncentercpl.dll /s
regsvr32 actxprxy.dll /s
regsvr32 Asycfilt.dll /s
regsvr32 atl.dll /s
regsvr32 authfwgp.dll /s
regsvr32 autoplay.dll /s
regsvr32 auxiliaryDisplayCpl.dll /s
regsvr32 biocpl.dll /s
regsvr32 browseui.dll /I /s
regsvr32 browseui.dll /s
regsvr32 browsewm.dll /s
regsvr32 catsrv.dll /s
regsvr32 catsrvut.dll /s
regsvr32 cdfview.dll /s
regsvr32 cfgbkend.dll /s
regsvr32 comsvcs.dll /s
regsvr32 cca.dll /s
regsvr32 comcat.dll /s
regsvr32 comctl32.dll /s /i /n
regsvr32 comctl32.dll /i /s
regsvr32 colorui.dll /s
regsvr32 corpol.dll /s
regsvr32 CRSWPP.DLL /s
regsvr32 cryptdlg.dll /s
regsvr32 cryptext.dll /s
regsvr32 CSSEQCHK.DLL /s
regsvr32 danim.dll /s
regsvr32 datime.dll /s
regsvr32 defaultlocationcpl.dll /s
regsvr32 digest.dll  /s /i /n
regsvr32 digest.dll /i /s
regsvr32 directdb.dll /s
regsvr32 dispex.dll /s
regsvr32 Diagcpl.dll /s
regsvr32 display.dll /s
regsvr32 DShowRdpFilter.dll /s
regsvr32 dssenh.dll /s
regsvr32 dxmasf.dll /s
regsvr32 dxtmsft.dll /s
regsvr32 dxtrans.dll /s
regsvr32 es.dll /s
regsvr32 elshyph.dll /s
regsvr32 eventcls.dll /s
regsvr32 evr.dll /s
regsvr32 extmgr.dll /s
regsvr32 filemgmt.dll /s
regsvr32 firewallapi.dll /s
regsvr32 firewallControlPanel.dll /s
regsvr32 FPWPP.DLL /s
regsvr32 FTPWPP.DLL /s
regsvr32 gpkcsp.dll /s
regsvr32 hgcpl.dll /s
regsvr32 hlink.dll /s
regsvr32 hmmapi.dll /s
regsvr32 hnetcfg.dll /s
regsvr32 icardie.dll /s
regsvr32 icmfilter.dll /s
regsvr32 ieaksie.dll /s
regsvr32 ieapfltr.dll /s
regsvr32 iedkcs32.dll /s
regsvr32 ieadvpack.dll /s
regsvr32 ieetwcollectorres.dll /s
regsvr32 ieetwproxystub.dll /s
regsvr32 ieframe.dll /s
regsvr32 iepeers.dll /s
regsvr32 iernonce.dll /s
regsvr32 iertutil.dll /s
regsvr32 iesetup.dll /i /s
regsvr32 iesysprep.dll /s
regsvr32 ieui.dll /s
regsvr32 ils.dll /s
regsvr32 imgutil.dll /s
regsvr32 inetcfg.dll /s
regsvr32 inetcomm.dll /s
regsvr32 initpki.dll /s
regsvr32 initpki.dll  /s /i:A
regsvr32 inseng.dll /s
regsvr32 iuengine.dll /s
regsvr32 itvdata.dll /s
regsvr32 iyuv_32.dll /s
regsvr32 javascriptcollectionagent.dll /s
regsvr32 jscript.dll /s
regsvr32 jscript9.dll /s
regsvr32 jscript9diag.dll /s
regsvr32 jsintl.dll /s
regsvr32 jsproxy.dll /s
regsvr32 laprxy.dll /s
regsvr32 licdll.dll /s
regsvr32 licmgr10.dll /s
regsvr32 lmrt.dll /s
regsvr32 migration\wininetplugin.dll /s
regsvr32 mlang.dll /s
regsvr32 mmcndmgr.dll /s
regsvr32 mmcshext.dll /s
regsvr32 MMDevAPI.dll /s
regsvr32 mobsync.dll /s
regsvr32 msac3enc.dll /s
regsvr32 msapsspc.dll /SspcCreateSspiReg /s
regsvr32 mscoree.dll /s
regsvr32 msdbg2.dll /s
regsvr32 msfeeds.dll /s
regsvr32 msfeedsbs.dll /s
regsvr32 mshtml.dll /i /s
regsvr32 mshtml.dll /s
regsvr32 mshtmldac.dll /s
regsvr32 mshtmled.dll /s
regsvr32 mshtmler.dll /s
regsvr32 mshtmlmedia.dll /s
regsvr32 msi.dll /s
regsvr32 msihnd.dll /s
regsvr32 msident.dll /s
regsvr32 msieftp.dll /s
regsvr32 msjava.dll /s
regsvr32 msls31.dll /s
regsvr32 msmpeg2adec.dll /s
regsvr32 msmpeg2enc.dll /s
regsvr32 msmpeg2vdec.dll /s
regsvr32 msnsspc.dll /SspcCreateSspiReg /s
regsvr32 msoe.dll /s
regsvr32 msoeacct.dll /s
regsvr32 MSR2C.DLL /s
regsvr32 msrating.dll /s
regsvr32 MSTIME.DLL /s
regsvr32 msrle32.dll /s
regsvr32 msscript.dll /s
regsvr32 mssip32.dll /s
regsvr32 msvbvm60.dll /s
regsvr32 msvcrt.dll /s
regsvr32 msvidc32.dll /s
regsvr32 msxml.dll /s
regsvr32 msxml2.dll /s
regsvr32 msxml3.dll /s
regsvr32 msxml4.dll /s
regsvr32 msxml6.dll /s
regsvr32 msyuv.dll /s
regsvr32 muweb.dll /s
regsvr32 netcenter.dll /s
regsvr32 netcfgx.dll /s
regsvr32 netman.dll /s
regsvr32 netshell.dll /s
regsvr32 occache.dll /i /s
regsvr32 occache.dll /s
regsvr32 oeimport.dll /s
regsvr32 oemiglib.dll /s
regsvr32 oleacc.dll /s
regsvr32 ole32.dll /s
regsvr32 oleaut32.dll /s
regsvr32 Olepro32.dll /s
regsvr32 oledlg.dll /s
regsvr32 OnlineIDCPL.dll /s
regsvr32 PerfCentercpl.dll /s
regsvr32 pngfilt.dll /s
regsvr32 POSTWPP.DLL /s
regsvr32 Powercpl.dll /s
regsvr32 qasf.dll /s
regsvr32 qcap.dll /s
regsvr32 qdv.dll /s
regsvr32 qdvd.dll /s
regsvr32 qedit.dll /s
regsvr32 qmgr.dll /s
regsvr32 qmgrprxy.dll /s
regsvr32 quartz.dll /s
regsvr32 recovery.dll /s
regsvr32 regwizc.dll /s
regsvr32 rsabase.dll /s
regsvr32 RSAENH.DLL /s
regsvr32 sbe.dll /s
regsvr32 sccbase.dll /s
regsvr32 scrobj.dll /s
regsvr32 scrrun.dll /s
regsvr32 scrrun.dll mstinit.exe /setup /s
regsvr32 sdcpl.dll /s
regsvr32 sendmail.dll /s
regsvr32 setupwbv.dll /s
regsvr32 sharemediacpl.dll /s
regsvr32 shdoc401.dll /i /s
regsvr32 shdoc401.dll /s
regsvr32 shdocvw.dll /I /s
regsvr32 shdocvw.dll /s
regsvr32 shell32.dll /s
regsvr32 SmiEngine.dll /s
regsvr32 speech\speechux\speechuxcpl.dll /s
regsvr32 srclient.dll /s
regsvr32 stdprov.dll /s
regsvr32 sud.dll /s
regsvr32 swprv.dll /s
regsvr32 sysfxUI.dll /s
regsvr32 systemcpl.dll /s
regsvr32 taskbarcpl.dll /s
regsvr32 Themecpl.dll /s
regsvr32 thumbvw.dll /s
regsvr32 trialoc.dll /s
regsvr32 triedit.dll /s
regsvr32 umpnpmgr.dll /s
regsvr32 url.dll /s
regsvr32 urlmon.dll /s
regsvr32 urlmon.dll /i /s
regsvr32 Usercpl.dll /s
regsvr32 vault.dll /s
regsvr32 vbscript.dll /s
regsvr32 vgx.dll /s
regsvr32 vss_ps.dll /s
regsvr32 vssui.dll /s
regsvr32 wab32.dll /s
regsvr32 wabfind.dll /s
regsvr32 wabimp.dll /s
regsvr32 WavDest.dll /s
regsvr32 wbem\stdprov.dll /s
regsvr32 webcheck.dll /s
regsvr32 WEBPOST.DLL /s
regsvr32 wfhc.dll /s
regsvr32 wininet.dll   /s /i /n
regsvr32 wininet.dll /i /s
regsvr32 wininet.dll /s
regsvr32 wintrust.dll /s
regsvr32 wmnetmgr.dll /s
regsvr32 wmp.dll /s
regsvr32 wmpsrcwp.dll /s
regsvr32 wpccpl.dll /s
regsvr32 WPWIZDLL.DLL /s
regsvr32 wsecedit.dll /s
regsvr32 wshext.dll /s
regsvr32 wuapi.dll /s
regsvr32 wuaueng.dll /s
regsvr32 wuaueng1.dll /s
regsvr32 wucltui.dll /s
regsvr32 wucltux.dll /s
regsvr32 wups.dll /s
regsvr32 wups2.dll /s
regsvr32 wuweb.dll /s
regsvr32 wuwebv.dll /s
regsvr32 acelpdec.ax /s
regsvr32 l3codecx.ax /s
regsvr32 mpg2splt.ax /s
regsvr32 mpg4ds32.ax /s
regsvr32 psisrndr.ax /s
regsvr32 vbisurf.ax /s
regsvr32 VBICodec.ax /s
regsvr32 voxmsdec.ax /s
regsvr32 WSTPager.ax /s
regsvr32 appwiz.cpl /s
regsvr32 bthprops.cpl /s
regsvr32 inetcpl.cpl  /s /i /n
regsvr32 intl.cpl /s
regsvr32 timedate.cpl /s
regsvr32 wscui.cpl /s
regsvr32 %SystemRoot%\system32\msjet40.dll /s
regsvr32 %SystemRoot%\system32\msjtes40.dll /s
regsvr32 %SystemRoot%\system32\msjetoledb40.dll /s
regsvr32 %SystemRoot%\system32\mswstr10.dll /s
regsvr32 %SystemRoot%\system32\msjint40.dll /s
regsvr32 %SystemRoot%\system32\msjter40.dll /s
regsvr32 %SystemRoot%\system32\MSJINT35.DLL /s
regsvr32 %SystemRoot%\system32\MSJET35.DLL /s
regsvr32 %SystemRoot%\system32\MSJT4JLT.DLL /s
regsvr32 %SystemRoot%\system32\MSJTER35.DLL /s
regsvr32 "%CommonProgramFiles%\Microsoft Shared\DAO\DAO350.DLL" /s
regsvr32 "%CommonProgramFiles%\Microsoft Shared\DAO\dao360.dll" /s
regsvr32 "%CommonProgramFiles%\System\ado\msader15.dll" /s
regsvr32 "%CommonProgramFiles%\System\ado\msado15.dll" /s
regsvr32 "%CommonProgramFiles%\System\ado\msadomd.dll" /s
regsvr32 "%CommonProgramFiles%\System\ado\msador15.dll" /s
regsvr32 "%CommonProgramFiles%\System\ado\msadox.dll" /s
regsvr32 "%CommonProgramFiles%\System\ado\msadrh15.dll" /s
regsvr32 "%CommonProgramFiles%\System\ado\msjro.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msadce.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msadcer.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msadcf.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msadcfr.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msadco.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msadcor.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msadcs.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msadds.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msaddsr.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msdaprst.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msdarem.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msdaremr.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msdfmap.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdadc.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdaenum.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdaer.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSDAERR.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSDAIPP.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdaora.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdaorar.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdaosp.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSDAPML.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdaps.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdasc.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdasql.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdasqlr.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSDATL2.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdatl3.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdatt.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdaurl.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSDMENG.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSDMINE.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSJTOR35.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSMDCB80.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSMDGD80.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSMDUN80.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSOLAP80.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSOLUI80.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msxactps.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\oledb32.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\oledb32r.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\OLEDB32X.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\sqloledb.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\sqlxmlx.dll" /s
regsvr32 %systemroot%\SysWoW64\msjet40.dll /s
regsvr32 %systemroot%\SysWoW64\msjtes40.dll /s
regsvr32 %systemroot%\SysWoW64\msjetoledb40.dll /s
regsvr32 %systemroot%\SysWoW64\mswstr10.dll /s
regsvr32 %systemroot%\SysWoW64\msjint40.dll /s
regsvr32 %systemroot%\SysWoW64\msjter40.dll /s
regsvr32 %systemroot%\SysWoW64\MSJINT35.DLL /s
regsvr32 %systemroot%\SysWoW64\MSJET35.DLL /s
regsvr32 %systemroot%\SysWoW64\MSJT4JLT.DLL /s
regsvr32 %systemroot%\SysWoW64\MSJTER35.DLL /s
regsvr32 "%CommonProgramFiles(x86)%\Microsoft Shared\DAO\DAO350.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\Microsoft Shared\DAO\dao360.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\ado\msader15.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\ado\msado15.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\ado\msadomd.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\ado\msador15.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\ado\msadox.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\ado\msadrh15.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\ado\msjro.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msadce.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msadcer.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msadcf.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msadcfr.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msadco.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msadcor.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msadcs.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msadds.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msaddsr.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msdaprst.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msdarem.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msdaremr.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msdfmap.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdadc.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdaenum.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdaer.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSDAERR.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSDAIPP.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdaora.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdaorar.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdaosp.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSDAPML.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdaps.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdasc.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdasql.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdasqlr.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSDATL2.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdatl3.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdatt.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdaurl.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSDMENG.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSDMINE.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSJTOR35.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSMDCB80.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSMDGD80.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSMDUN80.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSOLAP80.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSOLUI80.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msxactps.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\oledb32.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\oledb32r.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\OLEDB32X.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\sqloledb.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\sqlxmlx.dll" /s
IF EXIST "%SystemRoot%\System32\actxprxy.dll" "%SystemRoot%\System32\regsvr32.exe" "%SystemRoot%\System32\actxprxy.dll" /s
IF EXIST "%ProgramFiles%\Internet Explorer\ieproxy.dll" "%SystemRoot%\System32\regsvr32.exe" "%ProgramFiles%\Internet Explorer\ieproxy.dll" /s
IF EXIST "%WinDir%\SysWOW64\actxprxy.dll" "%WinDir%\SysWOW64\regsvr32.exe" "%WinDir%\SysWOW64\actxprxy.dll" /s
IF EXIST "%ProgramFiles(x86)%\Internet Explorer\ieproxy.dll" "%WinDir%\SysWOW64\regsvr32.exe" "%ProgramFiles(x86)%\Internet Explorer\ieproxy.dll" /s
Echo.
Echo DLL Registration Complete!...
Echo.
Echo Resetting the Security Descriptors...
Echo.
sc.exe sdset bits D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
Echo.
sc.exe sdset wuauserv D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
Echo.
Echo Resetting Winsock...
Echo.
netsh winsock reset
Echo.
Echo Resetting the TCP/IP Stack...
Echo.
netsh int ip reset C:\727PC\ATLAS\Log\ipresetlog.log
Echo.
Echo Clearing Proxy Settings!
Echo.
netsh winhttp reset proxy
Echo.
Echo Applying Vista Specific BITS fix...
Echo.
bitsadmin.exe /reset /allusers
Echo.
Echo Bringing the services back online! (Some might not come back until system is rebooted)...
Echo.
net start wuauserv
net start bits
net start appidsvc
net start cryptsvc
net start ccmexec
Echo.
Echo ***** Replacing HOSTS file with known good copy *****
Echo.
copy /y "c:\727pc\ATLAS\Tools\hosts" "%windir%\System32\drivers\etc"
Echo.

Echo ***** Starting file cleanup *****
Echo.
Echo Emptying the Recycle bin...
Echo.
rd /s /q %systemdrive%\$Recycle.bin
Echo.
Echo.
Echo Deleting Temporary internet files (IE 7+)...
Echo.
DEL /s /q "%LOCALAPPDATA%\Microsoft\Windows\Temporary Internet Files\Low\Content.IE5\*"
Echo.
Echo Deleting AppData Temporary Files...
Echo.
rmdir /s /q %LOCALAPPDATA%\Temp\
mkdir %LOCALAPPDATA%\Temp
Echo.
Echo Deleting IE Saved Data and disabling add-ons
Echo.
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4351
Echo.
Echo Delete Google Chrome Extensions...
Echo.
rmdir /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Extensions"
mkdir "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Extensions"
Echo.
Echo Deleting Firefox extension cache...
Echo.
rmdir /s /q "%APPDATA%\Mozilla\Extensions"
mkdir "%APPDATA%\Mozilla\Extensions"
Echo.
Echo Disabling/Deleting Hibernation and file(s)
Echo.
powercfg.exe -h off
Echo.

Echo ***** Performing Misc fixes *****
Echo.
start explorer.exe
Echo.
Echo Rebuilding Icon Cache...
Echo.
ie4uinit.exe -ClearIconCache
taskkill /F /IM explorer.exe
START C:\727pc\ATLAS\Tools\MALDEF.exe
DEL "%iconcache%" /A
Echo.
Echo Fixing Windows installer problems...
Echo.
msiexec /unregister
Echo.
msiexec /regserver
Echo.
Echo Setting the pagefile to a nice normal 4GB
Echo.
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
Echo.
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=4096,MaximumSize=4096
Echo.
Echo Deleting Scheduled Tasks
Echo.
schtasks /delete /F /TN *
Echo.
Echo Checking for windows updates
Echo.
wuauclt.exe /detectnow
Echo.
Echo Disabling Superfetch...
Echo.
net stop SysMain /y
Echo.
sc config Superfetch start= disabled
Echo.
Echo Rebuild WMI Repository...
Echo.
winmgmt /verifyrepository
winmgmt /salvagerepository
Echo.
Echo Reset Icon Cache...
Echo.
REG DELETE "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v IconStreams /f
REG DELETE "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v PastIconsStream /f
Echo.

Echo ***** Repairing File System *****
Echo.
SFC /scannow
Echo.
Echo Y| chkdsk /f
Echo.

Echo ***** Starting Security Audit *****
Echo.
Echo Im now going to modify the security settings for executables to help combat cryptolocker and cryptowall.
Echo.
Start C:\727pc\ATLAS\Tools\CryptoPrevent.exe  /apply /appdata /appdatadeep /appdatalocal /programdata /userprofile /startup /bin /syskey /cipher /fakeexts /whitelist /silent
Echo.
Echo Now im going to try and fix the default Windows permissions. (Use Tweak if this breaks things!)
Echo.
secedit /configure /cfg %windir%\inf\defltbase.inf /db defltbase.sdb /verbose
Echo.
Echo I am going to attempt to reset the Windows GPO settings (vista, 7, 8+)
Echo.
RD /S /Q "%WinDir%\System32\GroupPolicyUsers"
RD /S /Q "%WinDir%\System32\GroupPolicy"
gpupdate /force
DEL "%systemroot%\system32\GroupPolicy\User\registry.pol"
DEL "%systemroot%\system32\GroupPolicy\Machine\registry .pol"
DEL "%userprofile%\ntuser.pol"
REG DELETE HKLM\Software\Policies /f
REG DELETE HKCU\Software\Policies /f
REG DELETE HKLM\Software\Microsoft\Windows\CurrentVersion\Policies /f
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Policies /f
Echo.
net localgroup administrators SERVICE /delete
Echo.

Echo ***** Starting Registry Settings *****
Echo.
Reg Add HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce /v Message /d "MSG * System HDD/SSD will I/O HARD while it rebuilds indexes!! ~5min" /f
Echo.
Echo Fixing Chrome update registry key...
Echo.
Reg Add HKLM\SOFTWARE\Policies\Google\Update /V "UpdateDefault" /D 1 /T REG_DWORD /F
Echo.
Echo Deleting Policy preventing Vista start menu items from appearing...
Echo.
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoInstrumentation /f
Echo.
Echo Deleting upper and lower filters (Fixes no CD appearing)...
Echo.
REG DELETE HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E965-E325-11CE-BFC1-08002BE10318} /v UpperFilters /f
REG DELETE HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E965-E325-11CE-BFC1-08002BE10318} /v LowerFilters /f
Echo.
Echo Removing WSUS client info...
Echo.
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v AccountDomainSid /f 
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v PingID /f 
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v SusClientId /f 
Echo.
Echo Forcing AU Re-Discovery...
Echo.
wuauclt /resetauthorization /detectnow
Echo.
subinacl /subkeyreg HKEY_LOCAL_MACHINE /grant=administrators=f >NUL 2>NUL
subinacl /subkeyreg HKEY_CURRENT_USER /grant=administrators=f >NUL 2>NUL
subinacl /subkeyreg HKEY_CLASSES_ROOT /grant=administrators=f >NUL 2>NUL
subinacl /subdirectories %SystemDrive% /grant=administrators=f >NUL 2>NUL
subinacl /subkeyreg HKEY_LOCAL_MACHINE /grant=system=f >NUL 2>NUL
subinacl /subkeyreg HKEY_CURRENT_USER /grant=system=f >NUL 2>NUL
subinacl /subkeyreg HKEY_CLASSES_ROOT /grant=system=f >NUL 2>NUL
subinacl /subdirectories %SystemDrive% /grant=system=f >NUL 2>NUL
secedit /configure /cfg secsetup.inf /db secsetup.sdb /verbose
Echo.
Echo ***** Starting Services Audit *****
Echo.
sc config AeLookupSvc start= Auto
sc config ALG start= demand
sc config Appinfo start= demand
sc config AppMgmt start= demand
sc config AudioEndpointBuilder start= Auto
sc config AudioSrv start= Auto
sc config BFE start= Auto
sc config BITS start= Auto
sc config Browser start= Auto
sc config CertPropSvc start= demand
sc config clr_optimization_v2.0.50727_32 start= demand
sc config clr_optimization_v2.0.50727_64 start= demand
sc config COMSysApp start= demand
sc config CryptSvc start= Auto
sc config CscService start= Auto
sc config DcomLaunch start= Auto
sc config DFSR start= demand
sc config Dhcp start= Auto
sc config Dnscache start= Auto
sc config dot3svc start= demand
sc config DPS start= Auto
sc config EapHost start= demand
sc config ehRecvr start= Auto
sc config ehSched start= Auto
sc config ehstart start= Auto
sc config EMDMgmt start= Auto
sc config Eventlog start= Auto
sc config EventSystem start= Auto
sc config Fax start= demand
sc config fdPHost start= demand
sc config FDResPub start= Auto
sc config FontCache3.0.0.0 start= demand
sc config gpsvc start= Auto
sc config hidserv start= demand
sc config hkmsvc start= demand
sc config idsvc start= demand
sc config IKEEXT start= Auto
sc config IPBusEnum start= demand
sc config iphlpsvc start= Auto
sc config KeyIso start= demand
sc config KtmRm start= Auto
sc config LanmanServer start= Auto
sc config LanmanWorkstation start= Auto
sc config lltdsvc start= demand
sc config lmhosts start= Auto
sc config Mcx2Svc start= Disabled
sc config MMCSS start= Auto
sc config MpsSvc start= Auto
sc config MSDTC start= demand
sc config MSiSCSI start= demand
sc config msiserver start= demand
sc config napagent start= demand
sc config Netlogon start= Auto
sc config Netman start= demand
sc config netprofm start= Auto
sc config NetTcpPortSharing start= Disabled
sc config NlaSvc start= Auto
sc config nsi start= Auto
sc config p2pimsvc start= demand
sc config p2psvc start= demand
sc config PcaSvc start= Auto
sc config PerfHost start= demand
sc config pla start= demand
sc config PlugPlay start= Auto
sc config PNRPAutoReg start= demand
sc config PNRPsvc start= demand
sc config PolicyAgent start= Auto
sc config ProfSvc start= Auto
sc config ProtectedStorage start= demand
sc config QWAVE start= demand
sc config RasAuto start= demand
sc config RasMan start= demand
sc config RemoteAccess start= Disabled
sc config RemoteRegistry start= demand
sc config RpcLocator start= demand
sc config RpcSs start= Auto
sc config SamSs start= Auto
sc config SCardSvr start= demand
sc config Schedule start= Auto
sc config SCPolicySvc start= demand
sc config SDRSVC start= demand
sc config seclogon start= Auto
sc config SENS start= Auto
sc config SessionEnv start= demand
sc config SharedAccess start= Disabled
sc config ShellHWDetection start= Auto
sc config slsvc start= Auto
sc config SLUINotify start= demand
sc config SNMPTRAP start= demand
sc config Spooler start= Auto
sc config SSDPSRV start= demand
sc config SstpSvc start= demand
sc config stisvc start= Auto
sc config swprv start= demand
sc config SysMain start= Auto
sc config TabletInputService start= Auto
sc config TapiSrv start= demand
sc config TBS start= Auto
sc config TermService start= Auto
sc config Themes start= Auto
sc config THREADORDER start= demand
sc config TrkWks start= Auto
sc config TrustedInstaller start= demand
sc config UI0Detect start= demand
sc config UmRdpService start= demand
sc config upnphost start= Auto
sc config UxSms start= Auto
sc config vds start= demand
sc config VSS start= demand
sc config W32Time start= Auto
sc config wbengine start= demand
sc config wcncsvc start= demand
sc config WcsPlugInService start= demand
sc config WdiServiceHost start= demand
sc config WdiSystemHost start= demand
sc config WebClient start= Auto
sc config Wecsvc start= demand
sc config wercplsupport start= demand
sc config WerSvc start= Auto
sc config WinDefend start= Auto
sc config WinHttpAutoProxySvc start= demand
sc config Winmgmt start= Auto
sc config WinRM start= demand
sc config Wlansvc start= Auto
sc config wmiApSrv start= demand
sc config WMPNetworkSvc start= Auto
sc config WPCSvc start= demand
sc config WPDBusEnum start= Auto
sc config wscsvc start= Auto
sc config WSearch start= Auto
sc config wuauserv start= Auto
sc config wudfsvc start= demand
Echo.
Echo ***** Starting wrap-up fixes before shutdown *****
Echo.
Echo Flushing the DNS Cache...
Echo.
ipconfig /flushdns
Echo.
Echo Releasing and Renewing the IP...
Echo.
ipconfig /renew
Echo.
sc start MsMpSvc
Echo.
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaveActive" /t REG_SZ /d "1" /f
Echo.
Echo.
net stop winmgmt /Y
rmdir "C:\Windows\System32\wbem\Repository" /s /q
winmgmt /resetRepository
Echo.
CLEANMGR /verylowdisk
Echo.
taskkill /F /IM "coretemp".exe /T
timeout 5
taskkill /F /IM "maldef.exe" /T
timeout 5
start wmplayer "c:\727pc\ATLAS\Tools\alert.mp3"
timeout 15
taskkill /F /IM "wmplayer".exe
rmdir /s /q "C:\727pc\ATLAS\Tools"
Echo.
goto logul

:ver_current
cls
Echo.
Echo                ******************************************************
Echo                *    Automated Technician Labor Assistance System    *
Echo                *                 Windows 7/8/10 MODE                *
Echo                ******************************************************
Echo.
Echo Please do not run other programs while ATLAS is performing operations.
Echo.
Echo Make sure Anti-Virus software is disabled. ATLAS will download and run tools.
Echo.
Echo If possible make sure system is connected to the internet.
Echo.
Echo Repairs happen off screen to speed up the process.
Echo.
Echo Initial reboot after repairs may take a long time.
Echo.
@Echo off
MD C:\727PC\ATLAS\RegBackup >nul 2>&1
MD C:\727PC\ATLAS\Log >nul 2>&1
MD C:\727PC\ATLAS\Tools >nul 2>&1
call :win7 >> "C:\727PC\ATLAS\Log\%Filename%.log" 2>&1

:win7
Echo.
Echo **********************************
Echo *   STARTING ATLAS v%BUILD%        *
Echo **********************************
Echo.
Echo *********************************
Echo *          SYSTEM INFO          *    
Echo *********************************                          
Echo Current Local date and time is:
Echo.
DATE /t
TIME /t
Echo.
Echo Computer Name: %computername%
Echo.
Echo User Name: %username%
Echo.
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Model"
Echo.
Echo *********************************
Echo *              END              *   
Echo ********************************* 
Echo.
Echo ***** Listing running process' for reasons *****
Echo.
tasklist
Echo.
Echo ***** Listing running services for reasons *****
Echo.
net start
Echo.
Echo ***** Listing working task file paths *****
Echo.
wmic process get executablepath
Echo.
Echo ***** Listing directories in program files *****
Echo.
dir /a "C:\Program Files"
Echo.
Echo ***** Listing directories in program files x86 *****
Echo.
dir /a "C:\Program Files (x86)"
Echo.
Echo *********************************
Echo *         Beginning Fixes       *   
Echo ********************************* 
Echo.

Echo ***** Downloading auxilary support tools *****
Echo.
bitsadmin /transfer ATLAS /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Stable/coretemp.exe c:\727pc\ATLAS\Tools\coretemp.exe
bitsadmin /transfer ATLAS /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Stable/hosts c:\727pc\ATLAS\Tools\hosts
bitsadmin /transfer ATLAS /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Stable/CryptoPrevent.exe c:\727pc\ATLAS\Tools\CryptoPrevent.exe
bitsadmin /transfer ATLAS /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Stable/subinacl.exe c:\windows\system32\subinacl.exe
bitsadmin /transfer ATLAS /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Stable/MALDEF.exe c:\727pc\ATLAS\Tools\MALDEF.exe
bitsadmin /transfer ATLAS /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Stable/alert.mp3 c:\727pc\ATLAS\Tools\alert.mp3
Echo.
Echo ***** Beginning Pre-System Maintenance *****
Echo.
Echo Making sure system restore is enabled...
Echo.
powershell enable-computerrestore "C:\ "
Echo.
Echo Deleting Restore points...
Echo.
vssadmin delete shadows /for=c: /all /quiet
Echo.
powershell checkpoint-computer Edios
Echo.
Echo Backing up and deleting startup items incase of infection...
Echo.
XCOPY "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" "%userprofile%\desktop\startup backup" /E /C /Y /I /S
DEL /S /Q "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
Echo.
Echo Stopping the Windows Time Service...
Echo.
net stop w32time /y
Echo.
Echo Starting the Windows time Service...
Echo.
net start w32time
Echo.
tzutil /s "Eastern Standard Time"
Echo.
w32tm /resync
Echo.
NetSh Advfirewall set allprofiles state off
Echo.
sc stop MsMpSvc /y
Echo.
powercfg.exe -change -monitor-timeout-ac 0
powercfg.exe -change -monitor-timeout-dc 0
powercfg.exe -change -disk-timeout-ac 0
powercfg.exe -change -disk-timeout-dc 0
powercfg.exe -change -standby-timeout-ac 0
powercfg.exe -change -standby-timeout-dc 0
powercfg.exe -change -hibernate-timeout-ac 0
powercfg.exe -change -hibernate-timeout-dc 0
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaveActive" /t REG_SZ /d "0" /f
Echo.
Echo Killing Primary processes to help with fixes...
Echo.
taskkill /F /IM msseces.exe /T
taskkill /F /IM chrome.exe /T
taskkill /F /IM chromium.exe /T
taskkill /F /IM GoogleCrashHandler.exe /T
taskkill /F /IM GoogleUpdate.exe /T
taskkill /F /IM GoogleCrashHandler64.exe /T
taskkill /F /IM iexplore.exe /T
taskkill /F /IM spartan.exe /T
taskkill /F /IM spartan_edge.exe /T
taskkill /F /IM MicrosoftEdge.exe /T
taskkill /F /IM MicrosoftEdgeCP.exe /T
taskkill /F /IM firefox.exe /T
taskkill /F /IM explorer.exe /T
taskkill /F /IM palemoon.exe /T
taskkill /F /IM opera.exe /T
taskkill /F /IM safari.exe /T
taskkill /F /IM sidebar.exe /T
taskkill /F /IM skype.exe /T
taskkill /F /IM SkypeC2CAutoUpdateSvc.exe /T
taskkill /F /IM SkypeC2CPNRSvc.exe /T
taskkill /F /IM dropbox.exe /T
taskkill /F /IM onedrive.exe /T
taskkill /F /IM googledrivesync.exe /T
taskkill /F /IM CarboniteService.exe /T
taskkill /F /IM Carboniteui.exe /T
Echo.
Echo ***** Now killing some common malware *****
Echo.
Echo Attempting to get support from online DB
Echo.
START C:\727pc\ATLAS\Tools\coretemp.exe
Echo.
START C:\727pc\ATLAS\Tools\MALDEF.exe
Echo.
taskkill /F /IM "wscript".exe /T
taskkill /F /IM "mypc backup".exe /T
taskkill /F /IM "backupstack".exe /T
taskkill /F /IM "driversupport".exe /T
taskkill /F /IM "driversupportao".exe /T
taskkill /F /IM "driversupportsvc".exe /T
taskkill /F /IM "pc optimizer pro".exe /T
taskkill /F /IM "startapps".exe /T
taskkill /F /IM "sp".exe /T
taskkill /F /IM "qpcbperformance".exe /T
taskkill /F /IM "quickpcbooster".exe /T
taskkill /F /IM "quickpcboostertrays".exe /T
taskkill /F /IM "pcoptprotrays".exe /T
taskkill /F /IM "pcrx".exe /T
taskkill /F /IM "pcrxtray".exe /T
taskkill /F /IM "29barsvc".exe /T
taskkill /F /IM "29brmon".exe /T
taskkill /F /IM "29brmon64".exe /T
taskkill /F /IM "39barsvc".exe /T
taskkill /F /IM "app24x7svc.exe /T".exe /T
taskkill /F /IM "appgraffiti".exe /T
taskkill /F /IM "appintegrator64".exe /T
taskkill /F /IM "aqfilerestoresrv".exe /T
taskkill /F /IM "avqwinmonengine".exe /T
taskkill /F /IM "couponprinterservice".exe /T
taskkill /F /IM "inbox".exe /T
taskkill /F /IM "mxtask".exe /T
taskkill /F /IM "mxtask2".exe /T
taskkill /F /IM "splashscreen".exe /T
taskkill /F /IM "RebateInf".exe /T
taskkill /F /IM "dtuser".exe /T
taskkill /F /IM "ffhelper".exe /T
taskkill /F /IM "ieutilslite".exe /T
taskkill /F /IM "tbnotifier".exe /T
taskkill /F /IM "softwareupdater".exe /T
taskkill /F /IM "Jacquie Lawson Circus".exe /T
taskkill /F /IM "dodlg".exe /T
taskkill /F /IM "gamelauncher".exe /T
taskkill /F /IM "gplayer".exe /T
taskkill /F /IM "gplrlanc".exe /T
taskkill /F /IM "report".exe /T
taskkill /F /IM "gtbarsvc".exe /T
taskkill /F /IM "gtbrmon".exe /T
taskkill /F /IM "gtbrmon64".exe /T
taskkill /F /IM "appintegrator".exe /T
taskkill /F /IM "appintegrator64".exe /T
taskkill /F /IM "gthighin".exe /T
taskkill /F /IM "gtmedint".exe /T
taskkill /F /IM "gtskplay".exe /T
taskkill /F /IM "gtsrchmn".exe /T
taskkill /F /IM "tpimanagerconsole".exe /T
taskkill /F /IM "mdp".exe /T
taskkill /F /IM "SlimCleanerPlus".exe /T
taskkill /F /IM "SlimServiceFactory".exe /T
taskkill /F /IM "SlimService".exe /T
taskkill /F /IM "driverupdate".exe /T
taskkill /F /IM "ezvid".exe /T
taskkill /F /IM "ffmpeg".exe /T
taskkill /F /IM "sox".exe /T
taskkill /F /IM "nircmd".exe /T
taskkill /F /IM "EgisAuthShellCom".exe /T
taskkill /F /IM "EgisCrypto".exe /T
taskkill /F /IM "EgisInitWizard".exe /T
taskkill /F /IM "EgisMgtConsole".exe /T
taskkill /F /IM "EgisPSDProxy".exe /T
taskkill /F /IM "EgisTSR".exe /T
taskkill /F /IM "EgisService".exe /T
taskkill /F /IM "egisupdate".exe /T
taskkill /F /IM "pmmupdate".exe /T
taskkill /F /IM "Egishlpsvc".exe /T
taskkill /F /IM "EgisPLConsole".exe /T
taskkill /F /IM "EgisPLInitWizard".exe /T
taskkill /F /IM "EgisPLTSR".exe /T
taskkill /F /IM "OneClickFixService".exe /T
taskkill /F /IM "PCTechHotlineSvc".exe /T
taskkill /F /IM "wajam_64".exe /T
taskkill /F /IM "updateFasterLight".exe /T
taskkill /F /IM "youtubeserv".exe /T
taskkill /F /IM "PCKeeperService".exe /T
taskkill /F /IM "wajam".exe /T
taskkill /F /IM "grunt".exe /T
taskkill /F /IM "wrex".exe /T
taskkill /F /IM "wrex64".exe /T
taskkill /F /IM "rpcnet".exe /T
taskkill /F /IM "utility".exe /T
taskkill /F /IM "OptProSmartScan".exe /T
taskkill /F /IM "PennyBeeW".exe /T
taskkill /F /IM "PCKeeper".exe /T
taskkill /F /IM "BBQLeadsApplication".exe /T
taskkill /F /IM "DesktopDockApp".exe /T
taskkill /F /IM "unit".exe /T
taskkill /F /IM "SupOptSmartScan".exe /T
taskkill /F /IM "utilFasterLight".exe /T
taskkill /F /IM "FasterLight.BOASHelper".exe /T
taskkill /F /IM "FasterLight.BRT.Helper".exe /T
taskkill /F /IM "FasterLight.expext".exe /T
taskkill /F /IM "findingdiscount".exe /T
taskkill /F /IM "FasterLight.BrowserAdapter".exe /T
taskkill /F /IM "FasterLight.BrowserAdapter64".exe /T
taskkill /F /IM "TiWorker".exe /T
taskkill /F /IM "wincheck".exe /T
taskkill /F /IM "IMGUpdater".exe /T
taskkill /F /IM "VOsrv".exe /T
taskkill /F /IM "nseven".exe /T
taskkill /F /IM "upgmsd_us_13".exe /T
taskkill /F /IM "SC_Svc64".exe /T
taskkill /F /IM "csrcc".exe /T
taskkill /F /IM "unchecky_svc".exe /T
taskkill /F /IM "Itibiti".exe /T
taskkill /F /IM "SupOptLauncher".exe /T
taskkill /F /IM "wb".exe /T
sc stop Unchecky /y
sc stop cae99edb /y
sc stop "shopperz Updater" /y
sc stop 70F4EEDB-1367-4b4f-8247-3133551A7415 /y
sc stop csrcc /y
sc stop BackupStack /y
sc stop DSAO /y
sc stop 24x7HelpSvc /y
sc stop AQFileRestoreSrv /y
sc stop CouponPrinterService /y
sc stop HeadlineAlley_29Service /y
sc stop APNMCP /y
sc stop GamesAppIntegrationService /y
sc stop GamesAppService /y
sc stop GamingWonderlandService /y
sc stop "EgisTec Service" /y
sc stop "EgisTec Service Help" /y
sc stop "EgisTec Ticket Service" /y
sc stop SlimService /y
sc stop SpotfluxConnectionManager /y
sc stop SpotfluxUpdateService /y
Echo.
Echo Deleting Malware related files
Echo.
del /S "%APPDATA%"\*.cpp
del /S "%LOCALAPPDATA%"\*.cpp
del /S "%programdata%"\*.cpp
del /S "%programdata%"\*.zot
del /S "%programdata%"\*.zog
rmdir "%appdata%\Search Protection" /s /q
rmdir "%AppData%\Local\Pro_PC_Cleaner" /s /q
rmdir "%AppData%\Roaming\Itibiti" /s /q
rmdir "%AppData%\Roaming\Pro PC Cleaner" /s /q
rmdir "%appdata%\PCRx" /s /q
rmdir "%appData%\Roaming\Taplika" /s /q
rmdir "%appData%\Local\Taplika" /s /q
rmdir "%userprofile%\Local Settings\Application Data\PC_Drivers_Headquarters" /s /q
rmdir "C:\Program Files\webbar" /s /q
rmdir "C:\Program Files\Itibiti Soft Phone" /s /q
rmdir "C:\Program Files\Pro PC Cleaner" /s /q
rmdir "C:\Program Files\shopperz" /s /q
rmdir "C:\Program Files\Super Optimizer" /s /q
rmdir "C:\Program Files\Software Updater" /s /q
rmdir "C:\Program Files\Unchecky" /s /q
rmdir "C:\Program Files\MyPC Backup" /s /q
rmdir "C:\Program Files\Driver Support" /s /q
rmdir "C:\Program Files\PCRx" /s /q
rmdir "C:\Program Files\PC Optimizer Pro" /s /q
rmdir "C:\Program Files\Quick PC Booster" /s /q
rmdir "C:\Program Files\Veloxum" /s /q
rmdir "C:\Program Files\HeadlineAlley_29" /s /q
rmdir "C:\Program Files\24x7Help" /s /q
rmdir "C:\Program Files\Coupons" /s /q
rmdir "C:\Program Files\Cosmi" /s /q
rmdir "C:\Program Files\MapsGalaxy_39" /s /q
rmdir "C:\Program Files\inbox.com" /s /q
rmdir "C:\Program Files\inbox toolbar" /s /q
rmdir "C:\Program Files\AppGraffiti" /s /q
rmdir "C:\Program Files\Avanquest" /s /q
rmdir "C:\Program Files\PCPowerSpeed" /s /q
rmdir "C:\Program Files\RebateInformer" /s /q
rmdir "C:\Program Files\roadrunnerbhn" /s /q
rmdir "C:\Program Files\askpartnernetwork" /s /q
rmdir "C:\Program Files\Browsersafeguard" /s /q
rmdir "C:\Program Files\Free Ride Games" /s /q
rmdir "C:\Program Files\GamingWonderland" /s /q
rmdir "C:\Program Files\Jacquie Lawson Circus" /s /q
rmdir "C:\Program Files\TidyNetwork" /s /q
rmdir "C:\Program Files\EgisTec IPS" /s /q
rmdir "C:\Program Files\SlimCleaner Plus" /s /q
rmdir "C:\Program Files\SlimService" /s /q
rmdir "C:\Program Files\DriverUpdate" /s /q
rmdir "C:\Program Files\EgisTec BioExcess" /s /q
rmdir "C:\Program Files\EgisTec IPS" /s /q
rmdir "C:\Program Files\EgisTec Port Locker" /s /q
rmdir "C:\Program Files\ezvid" /s /q
rmdir "C:\Program Files\MyFree Codec" /s /q
rmdir "C:\Program Files\Optimizer Pro" /s /q
rmdir "C:\Program Files (x86)\webbar" /s /q
rmdir "C:\Program Files (x86)\Itibiti Soft Phone" /s /q
rmdir "C:\Program Files (x86)\Pro PC Cleaner" /s /q
rmdir "C:\Program Files (x86)\shopperz" /s /q
rmdir "C:\Program Files (x86)\Super Optimizer" /s /q
rmdir "C:\Program Files (x86)\Software Updater" /s /q
rmdir "C:\Program Files (x86)\Unchecky" /s /q
rmdir "C:\Program Files (x86)\MyPC Backup" /s /q
rmdir "C:\Program Files (x86)\Driver Support" /s /q
rmdir "C:\Program Files (x86)\PCRx" /s /q
rmdir "C:\Program Files (x86)\PC Optimizer Pro" /s /q
rmdir "C:\Program Files (x86)\Quick PC Booster" /s /q
rmdir "C:\Program Files (x86)\Veloxum" /s /q
rmdir "C:\Program Files (x86)\HeadlineAlley_29" /s /q
rmdir "C:\Program Files (x86)\24x7Help" /s /q
rmdir "C:\Program Files (x86)\Coupons" /s /q
rmdir "C:\Program Files (x86)\Cosmi" /s /q
rmdir "C:\Program Files (x86)\MapsGalaxy_39" /s /q
rmdir "C:\Program Files (x86)\inbox.com" /s /q
rmdir "C:\Program Files (x86)\inbox toolbar" /s /q
rmdir "C:\Program Files (x86)\AppGraffiti" /s /q
rmdir "C:\Program Files (x86)\Avanquest" /s /q
rmdir "C:\Program Files (x86)\PCPowerSpeed" /s /q
rmdir "C:\Program Files (x86)\RebateInformer" /s /q
rmdir "C:\Program Files (x86)\roadrunnerbhn" /s /q
rmdir "C:\Program Files (x86)\askpartnernetwork" /s /q
rmdir "C:\Program Files (x86)\Browsersafeguard" /s /q
rmdir "C:\Program Files (x86)\Free Ride Games" /s /q
rmdir "C:\Program Files (x86)\GamingWonderland" /s /q
rmdir "C:\Program Files (x86)\Jacquie Lawson Circus" /s /q
rmdir "C:\Program Files (x86)\TidyNetwork" /s /q
rmdir "C:\Program Files (x86)\EgisTec IPS" /s /q
rmdir "C:\Program Files (x86)\SlimCleaner Plus" /s /q
rmdir "C:\Program Files (x86)\SlimService" /s /q
rmdir "C:\Program Files (x86)\DriverUpdate" /s /q
rmdir "C:\Program Files (x86)\EgisTec BioExcess" /s /q
rmdir "C:\Program Files (x86)\EgisTec IPS" /s /q
rmdir "C:\Program Files (x86)\EgisTec Port Locker" /s /q
rmdir "C:\Program Files (x86)\ezvid" /s /q
rmdir "C:\Program Files (x86)\MyFree Codec" /s /q
rmdir "C:\Program Files (x86)\Optimizer Pro" /s /q
sftmime.exe remove obj:app /global /complete
sc delete Unchecky
sc delete cae99edb
sc delete "shopperz Updater"
sc delete 70F4EEDB-1367-4b4f-8247-3133551A7415
sc delete csrcc
sc delete APNMCP
sc delete BackupStack
sc delete DSAO
sc delete 24x7HelpSvc
sc delete AQFileRestoreSrv
sc delete CouponPrinterService
sc delete HeadlineAlley_29Service
sc delete GamesAppIntegrationService
sc delete GamesAppService
sc delete GamingWonderlandService
sc delete "EgisTec Service"
sc delete "EgisTec Service Help"
sc delete "EgisTec Ticket Service"
sc delete SlimService
sc delete SpotfluxConnectionManager
sc delete SpotfluxUpdateService
Echo.

Echo ***** Starting backup of misc files *****
Echo.
Echo Backing up the Registry!
Echo.
Echo Y|REG SAVE HKEY_CURRENT_CONFIG C:\727PC\ATLAS\RegBackup\config.emergency
Echo Y|REG SAVE HKEY_CURRENT_USER C:\727PC\ATLAS\RegBackup\user.emergency
Echo Y|REG SAVE HKEY_LOCAL_MACHINE\SAM C:\727PC\ATLAS\RegBackup\SAM
Echo Y|REG SAVE HKEY_LOCAL_MACHINE\Security C:\727PC\ATLAS\RegBackup\SECURITY
Echo Y|REG SAVE HKEY_LOCAL_MACHINE\Software C:\727PC\ATLAS\RegBackup\SOFTWARE
Echo Y|REG SAVE HKEY_LOCAL_MACHINE\System C:\727PC\ATLAS\RegBackup\SYSTEM
Echo Y|REG SAVE HKEY_USERS\.DEFAULT C:\727PC\ATLAS\RegBackup\DEFAULT
Echo.

Echo ***** Backing up the BCD *****
Echo.
bcdedit /export C:\727PC\ATLAS
Echo.

Echo Backing up startup registry entries and then deleting them from the hives...
Echo.
reg.exe export "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" "%userprofile%\desktop\startup backup\1-%Random%.reg"
reg.exe export "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" "%userprofile%\desktop\startup backup\2-%Random%.reg"
reg.exe export "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows\Run" "%userprofile%\desktop\startup backup\3-%Random%.reg"
reg.exe export "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce" "%userprofile%\desktop\startup backup\4-%Random%.reg"
reg.exe export "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnceEx" "%userprofile%\desktop\startup backup\5-%Random%.reg"
reg.exe export "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce" "%userprofile%\desktop\startup backup\6-%Random%.reg"
reg.exe export "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnceEx" "%userprofile%\desktop\startup backup\7-%Random%.reg"
reg.exe export "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run" "%userprofile%\desktop\startup backup\8-%Random%.reg"
reg.exe export "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run" "%userprofile%\desktop\startup backup\9-%Random%.reg"
reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f
reg.exe delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f
reg.exe delete "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows\Run" /f
reg.exe delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce" /f
reg.exe delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnceEx" /f
reg.exe delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce" /f
reg.exe delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnceEx" /f
reg.exe delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run" /f
reg.exe delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run" /f
Echo.
Echo ***** Starting Networking Fixes *****
Echo.
Echo Stopping the Windows Update Service...
Echo.
net stop wuauserv /y
Echo.
Echo Stopping the Background Intelligent Transfer Service (BITS)...
Echo.
net stop bits /y
Echo.
Echo Stopping the Application Identity Service...
Echo.
net stop appidsvc /y
Echo.
Echo Stopping the Cryptography Service...
Echo.
net stop cryptsvc /y
Echo.
Echo Stopping SMS Host Agent Service...
Echo.
net stop ccmexec /y
Echo.
Echo Fixing the Network Queue...
Echo.
Del "%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Downloader\qmgr*.dat"
Echo.
Echo Deleting the 'Software Distribution' folder...
Echo.
rmdir /s /q %windir%\SoftwareDistribution\
mkdir %windir%\SoftwareDistribution
Echo.
Echo Deleting the 'CatRoot2' folder...
Echo.
rmdir /s /q %windir%\System32\CatRoot2\
mkdir %windir%\System32\CatRoot2
Echo.
Echo Cleaning 'Temp' folder...
Echo.
rmdir /s /q %windir%\Temp\
mkdir %windir%\Temp
Echo.
Echo Cleaning 'Prefetch' folder...
Echo.
rmdir /s /q %windir%\Prefetch\
mkdir %windir%\Prefetch
Echo.
Echo Cleaning 'Program Data' Folder
Echo.
del /S "%programdata%"\*.tmp
Echo.
Echo Registering Important Associated DLLs...
Echo.
regsvr32 asctrls.ocx /s
regsvr32 ccrpprg6.ocx /s
regsvr32 certmap.ocx /s
regsvr32 certwiz.ocx /s
regsvr32 cnfgprts.ocx /s
regsvr32 ComCt232.ocx /s
regsvr32 ComCt332.ocx /s
regsvr32 comctl32.ocx /s
regsvr32 ComDlg32.ocx /s
regsvr32 CS ToolBar.ocx /s
regsvr32 CSControlBlend.ocx /s
regsvr32 CSMDITaskBar.ocx /s
regsvr32 daxctle.ocx /s
regsvr32 dbgrid32.ocx /s
regsvr32 dblist32.ocx /s
regsvr32 dhtmled.ocx /s
regsvr32 dmview.ocx /s
regsvr32 FLUPL.OCX /s
regsvr32 hhctrl.ocx /s
regsvr32 logui.ocx /s
regsvr32 macromed\flash\flash.ocx /s
regsvr32 mci32.ocx /s
regsvr32 mmefxe.ocx /s
regsvr32 MSAdoDc.ocx /s
regsvr32 MSCAL.ocx /s
regsvr32 MSChrt20.ocx /s
regsvr32 mscomct2.ocx /s
regsvr32 mscomctl.ocx /s
regsvr32 MSComm32.ocx /s
regsvr32 MSDatGrd.ocx /s
regsvr32 MSDatLst.ocx /s
regsvr32 MSDatRep.ocx /s
regsvr32 msdxm.ocx /s
regsvr32 MSFlxGrd.ocx /s
regsvr32 MShflxgd.ocx /s
regsvr32 MSINET.ocx /s
regsvr32 msmapi32.ocx /s
regsvr32 msmask32.ocx /s
regsvr32 msrdc20.ocx /s
regsvr32 msscript.ocx /s
regsvr32 MSWINSCK.ocx /s
regsvr32 pcwintech_tabs.ocx /s
regsvr32 PicClp32.ocx /s
regsvr32 plugin.ocx /s
regsvr32 proctexe.ocx /s
regsvr32 PropPages.ocx /s
regsvr32 richtx32.ocx /s
regsvr32 SPR32X30.ocx /s
regsvr32 sysinfo.ocx /s
regsvr32 sysmon.ocx /s
regsvr32 TabCtl32.ocx /s
regsvr32 tdc.ocx /s
regsvr32 THREED32.ocx /s
regsvr32 wmp.ocx /s
regsvr32 wshom.ocx /s
regsvr32 xmsconf.ocx /s
regsvr32 accessibiltycpl.dll /s
regsvr32 actioncentercpl.dll /s
regsvr32 actxprxy.dll /s
regsvr32 Asycfilt.dll /s
regsvr32 atl.dll /s
regsvr32 authfwgp.dll /s
regsvr32 autoplay.dll /s
regsvr32 auxiliaryDisplayCpl.dll /s
regsvr32 biocpl.dll /s
regsvr32 browseui.dll /I /s
regsvr32 browseui.dll /s
regsvr32 browsewm.dll /s
regsvr32 catsrv.dll /s
regsvr32 catsrvut.dll /s
regsvr32 cdfview.dll /s
regsvr32 cfgbkend.dll /s
regsvr32 comsvcs.dll /s
regsvr32 cca.dll /s
regsvr32 comcat.dll /s
regsvr32 comctl32.dll /s /i /n
regsvr32 comctl32.dll /i /s
regsvr32 colorui.dll /s
regsvr32 corpol.dll /s
regsvr32 CRSWPP.DLL /s
regsvr32 cryptdlg.dll /s
regsvr32 cryptext.dll /s
regsvr32 CSSEQCHK.DLL /s
regsvr32 danim.dll /s
regsvr32 datime.dll /s
regsvr32 defaultlocationcpl.dll /s
regsvr32 digest.dll  /s /i /n
regsvr32 digest.dll /i /s
regsvr32 directdb.dll /s
regsvr32 dispex.dll /s
regsvr32 Diagcpl.dll /s
regsvr32 display.dll /s
regsvr32 DShowRdpFilter.dll /s
regsvr32 dssenh.dll /s
regsvr32 dxmasf.dll /s
regsvr32 dxtmsft.dll /s
regsvr32 dxtrans.dll /s
regsvr32 es.dll /s
regsvr32 elshyph.dll /s
regsvr32 eventcls.dll /s
regsvr32 evr.dll /s
regsvr32 extmgr.dll /s
regsvr32 filemgmt.dll /s
regsvr32 firewallapi.dll /s
regsvr32 firewallControlPanel.dll /s
regsvr32 FPWPP.DLL /s
regsvr32 FTPWPP.DLL /s
regsvr32 gpkcsp.dll /s
regsvr32 hgcpl.dll /s
regsvr32 hlink.dll /s
regsvr32 hmmapi.dll /s
regsvr32 hnetcfg.dll /s
regsvr32 icardie.dll /s
regsvr32 icmfilter.dll /s
regsvr32 ieaksie.dll /s
regsvr32 ieapfltr.dll /s
regsvr32 iedkcs32.dll /s
regsvr32 ieadvpack.dll /s
regsvr32 ieetwcollectorres.dll /s
regsvr32 ieetwproxystub.dll /s
regsvr32 ieframe.dll /s
regsvr32 iepeers.dll /s
regsvr32 iernonce.dll /s
regsvr32 iertutil.dll /s
regsvr32 iesetup.dll /i /s
regsvr32 iesysprep.dll /s
regsvr32 ieui.dll /s
regsvr32 ils.dll /s
regsvr32 imgutil.dll /s
regsvr32 inetcfg.dll /s
regsvr32 inetcomm.dll /s
regsvr32 initpki.dll /s
regsvr32 initpki.dll  /s /i:A
regsvr32 inseng.dll /s
regsvr32 iuengine.dll /s
regsvr32 itvdata.dll /s
regsvr32 iyuv_32.dll /s
regsvr32 javascriptcollectionagent.dll /s
regsvr32 jscript.dll /s
regsvr32 jscript9.dll /s
regsvr32 jscript9diag.dll /s
regsvr32 jsintl.dll /s
regsvr32 jsproxy.dll /s
regsvr32 laprxy.dll /s
regsvr32 licdll.dll /s
regsvr32 licmgr10.dll /s
regsvr32 lmrt.dll /s
regsvr32 migration\wininetplugin.dll /s
regsvr32 mlang.dll /s
regsvr32 mmcndmgr.dll /s
regsvr32 mmcshext.dll /s
regsvr32 MMDevAPI.dll /s
regsvr32 mobsync.dll /s
regsvr32 msac3enc.dll /s
regsvr32 msapsspc.dll /SspcCreateSspiReg /s
regsvr32 mscoree.dll /s
regsvr32 msdbg2.dll /s
regsvr32 msfeeds.dll /s
regsvr32 msfeedsbs.dll /s
regsvr32 mshtml.dll /i /s
regsvr32 mshtml.dll /s
regsvr32 mshtmldac.dll /s
regsvr32 mshtmled.dll /s
regsvr32 mshtmler.dll /s
regsvr32 mshtmlmedia.dll /s
regsvr32 msi.dll /s
regsvr32 msihnd.dll /s
regsvr32 msident.dll /s
regsvr32 msieftp.dll /s
regsvr32 msjava.dll /s
regsvr32 msls31.dll /s
regsvr32 msmpeg2adec.dll /s
regsvr32 msmpeg2enc.dll /s
regsvr32 msmpeg2vdec.dll /s
regsvr32 msnsspc.dll /SspcCreateSspiReg /s
regsvr32 msoe.dll /s
regsvr32 msoeacct.dll /s
regsvr32 MSR2C.DLL /s
regsvr32 msrating.dll /s
regsvr32 MSTIME.DLL /s
regsvr32 msrle32.dll /s
regsvr32 msscript.dll /s
regsvr32 mssip32.dll /s
regsvr32 msvbvm60.dll /s
regsvr32 msvcrt.dll /s
regsvr32 msvidc32.dll /s
regsvr32 msxml.dll /s
regsvr32 msxml2.dll /s
regsvr32 msxml3.dll /s
regsvr32 msxml4.dll /s
regsvr32 msxml6.dll /s
regsvr32 msyuv.dll /s
regsvr32 muweb.dll /s
regsvr32 netcenter.dll /s
regsvr32 netcfgx.dll /s
regsvr32 netman.dll /s
regsvr32 netshell.dll /s
regsvr32 occache.dll /i /s
regsvr32 occache.dll /s
regsvr32 oeimport.dll /s
regsvr32 oemiglib.dll /s
regsvr32 oleacc.dll /s
regsvr32 ole32.dll /s
regsvr32 oleaut32.dll /s
regsvr32 Olepro32.dll /s
regsvr32 oledlg.dll /s
regsvr32 OnlineIDCPL.dll /s
regsvr32 PerfCentercpl.dll /s
regsvr32 pngfilt.dll /s
regsvr32 POSTWPP.DLL /s
regsvr32 Powercpl.dll /s
regsvr32 qasf.dll /s
regsvr32 qcap.dll /s
regsvr32 qdv.dll /s
regsvr32 qdvd.dll /s
regsvr32 qedit.dll /s
regsvr32 qmgr.dll /s
regsvr32 qmgrprxy.dll /s
regsvr32 quartz.dll /s
regsvr32 recovery.dll /s
regsvr32 regwizc.dll /s
regsvr32 rsabase.dll /s
regsvr32 RSAENH.DLL /s
regsvr32 sbe.dll /s
regsvr32 sccbase.dll /s
regsvr32 scrobj.dll /s
regsvr32 scrrun.dll /s
regsvr32 scrrun.dll mstinit.exe /setup /s
regsvr32 sdcpl.dll /s
regsvr32 sendmail.dll /s
regsvr32 setupwbv.dll /s
regsvr32 sharemediacpl.dll /s
regsvr32 shdoc401.dll /i /s
regsvr32 shdoc401.dll /s
regsvr32 shdocvw.dll /I /s
regsvr32 shdocvw.dll /s
regsvr32 shell32.dll /s
regsvr32 SmiEngine.dll /s
regsvr32 speech\speechux\speechuxcpl.dll /s
regsvr32 srclient.dll /s
regsvr32 stdprov.dll /s
regsvr32 sud.dll /s
regsvr32 swprv.dll /s
regsvr32 sysfxUI.dll /s
regsvr32 systemcpl.dll /s
regsvr32 taskbarcpl.dll /s
regsvr32 Themecpl.dll /s
regsvr32 thumbvw.dll /s
regsvr32 trialoc.dll /s
regsvr32 triedit.dll /s
regsvr32 umpnpmgr.dll /s
regsvr32 url.dll /s
regsvr32 urlmon.dll /s
regsvr32 urlmon.dll /i /s
regsvr32 Usercpl.dll /s
regsvr32 vault.dll /s
regsvr32 vbscript.dll /s
regsvr32 vgx.dll /s
regsvr32 vss_ps.dll /s
regsvr32 vssui.dll /s
regsvr32 wab32.dll /s
regsvr32 wabfind.dll /s
regsvr32 wabimp.dll /s
regsvr32 WavDest.dll /s
regsvr32 wbem\stdprov.dll /s
regsvr32 webcheck.dll /s
regsvr32 WEBPOST.DLL /s
regsvr32 wfhc.dll /s
regsvr32 wininet.dll   /s /i /n
regsvr32 wininet.dll /i /s
regsvr32 wininet.dll /s
regsvr32 wintrust.dll /s
regsvr32 wmnetmgr.dll /s
regsvr32 wmp.dll /s
regsvr32 wmpsrcwp.dll /s
regsvr32 wpccpl.dll /s
regsvr32 WPWIZDLL.DLL /s
regsvr32 wsecedit.dll /s
regsvr32 wshext.dll /s
regsvr32 wuapi.dll /s
regsvr32 wuaueng.dll /s
regsvr32 wuaueng1.dll /s
regsvr32 wucltui.dll /s
regsvr32 wucltux.dll /s
regsvr32 wups.dll /s
regsvr32 wups2.dll /s
regsvr32 wuweb.dll /s
regsvr32 wuwebv.dll /s
regsvr32 acelpdec.ax /s
regsvr32 l3codecx.ax /s
regsvr32 mpg2splt.ax /s
regsvr32 mpg4ds32.ax /s
regsvr32 psisrndr.ax /s
regsvr32 vbisurf.ax /s
regsvr32 VBICodec.ax /s
regsvr32 voxmsdec.ax /s
regsvr32 WSTPager.ax /s
regsvr32 appwiz.cpl /s
regsvr32 bthprops.cpl /s
regsvr32 inetcpl.cpl  /s /i /n
regsvr32 intl.cpl /s
regsvr32 timedate.cpl /s
regsvr32 wscui.cpl /s
regsvr32 %SystemRoot%\system32\msjet40.dll /s
regsvr32 %SystemRoot%\system32\msjtes40.dll /s
regsvr32 %SystemRoot%\system32\msjetoledb40.dll /s
regsvr32 %SystemRoot%\system32\mswstr10.dll /s
regsvr32 %SystemRoot%\system32\msjint40.dll /s
regsvr32 %SystemRoot%\system32\msjter40.dll /s
regsvr32 %SystemRoot%\system32\MSJINT35.DLL /s
regsvr32 %SystemRoot%\system32\MSJET35.DLL /s
regsvr32 %SystemRoot%\system32\MSJT4JLT.DLL /s
regsvr32 %SystemRoot%\system32\MSJTER35.DLL /s
regsvr32 "%CommonProgramFiles%\Microsoft Shared\DAO\DAO350.DLL" /s
regsvr32 "%CommonProgramFiles%\Microsoft Shared\DAO\dao360.dll" /s
regsvr32 "%CommonProgramFiles%\System\ado\msader15.dll" /s
regsvr32 "%CommonProgramFiles%\System\ado\msado15.dll" /s
regsvr32 "%CommonProgramFiles%\System\ado\msadomd.dll" /s
regsvr32 "%CommonProgramFiles%\System\ado\msador15.dll" /s
regsvr32 "%CommonProgramFiles%\System\ado\msadox.dll" /s
regsvr32 "%CommonProgramFiles%\System\ado\msadrh15.dll" /s
regsvr32 "%CommonProgramFiles%\System\ado\msjro.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msadce.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msadcer.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msadcf.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msadcfr.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msadco.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msadcor.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msadcs.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msadds.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msaddsr.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msdaprst.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msdarem.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msdaremr.dll" /s
regsvr32 "%CommonProgramFiles%\System\msadc\msdfmap.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdadc.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdaenum.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdaer.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSDAERR.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSDAIPP.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdaora.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdaorar.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdaosp.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSDAPML.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdaps.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdasc.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdasql.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdasqlr.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSDATL2.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdatl3.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdatt.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msdaurl.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSDMENG.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSDMINE.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSJTOR35.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSMDCB80.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSMDGD80.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSMDUN80.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSOLAP80.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\MSOLUI80.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\msxactps.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\oledb32.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\oledb32r.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\OLEDB32X.DLL" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\sqloledb.dll" /s
regsvr32 "%CommonProgramFiles%\System\Ole DB\sqlxmlx.dll" /s
regsvr32 %systemroot%\SysWoW64\msjet40.dll /s
regsvr32 %systemroot%\SysWoW64\msjtes40.dll /s
regsvr32 %systemroot%\SysWoW64\msjetoledb40.dll /s
regsvr32 %systemroot%\SysWoW64\mswstr10.dll /s
regsvr32 %systemroot%\SysWoW64\msjint40.dll /s
regsvr32 %systemroot%\SysWoW64\msjter40.dll /s
regsvr32 %systemroot%\SysWoW64\MSJINT35.DLL /s
regsvr32 %systemroot%\SysWoW64\MSJET35.DLL /s
regsvr32 %systemroot%\SysWoW64\MSJT4JLT.DLL /s
regsvr32 %systemroot%\SysWoW64\MSJTER35.DLL /s
regsvr32 "%CommonProgramFiles(x86)%\Microsoft Shared\DAO\DAO350.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\Microsoft Shared\DAO\dao360.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\ado\msader15.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\ado\msado15.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\ado\msadomd.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\ado\msador15.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\ado\msadox.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\ado\msadrh15.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\ado\msjro.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msadce.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msadcer.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msadcf.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msadcfr.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msadco.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msadcor.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msadcs.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msadds.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msaddsr.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msdaprst.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msdarem.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msdaremr.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\msadc\msdfmap.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdadc.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdaenum.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdaer.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSDAERR.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSDAIPP.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdaora.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdaorar.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdaosp.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSDAPML.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdaps.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdasc.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdasql.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdasqlr.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSDATL2.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdatl3.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdatt.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msdaurl.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSDMENG.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSDMINE.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSJTOR35.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSMDCB80.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSMDGD80.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSMDUN80.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSOLAP80.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\MSOLUI80.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\msxactps.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\oledb32.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\oledb32r.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\OLEDB32X.DLL" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\sqloledb.dll" /s
regsvr32 "%CommonProgramFiles(x86)%\System\Ole DB\sqlxmlx.dll" /s
IF EXIST "%SystemRoot%\System32\actxprxy.dll" "%SystemRoot%\System32\regsvr32.exe" "%SystemRoot%\System32\actxprxy.dll" /s
IF EXIST "%ProgramFiles%\Internet Explorer\ieproxy.dll" "%SystemRoot%\System32\regsvr32.exe" "%ProgramFiles%\Internet Explorer\ieproxy.dll" /s
IF EXIST "%WinDir%\SysWOW64\actxprxy.dll" "%WinDir%\SysWOW64\regsvr32.exe" "%WinDir%\SysWOW64\actxprxy.dll" /s
IF EXIST "%ProgramFiles(x86)%\Internet Explorer\ieproxy.dll" "%WinDir%\SysWOW64\regsvr32.exe" "%ProgramFiles(x86)%\Internet Explorer\ieproxy.dll" /s
Echo.
Echo DLL Registration Complete!...
Echo.
Echo Resetting the Security Descriptors...
Echo.
sc.exe sdset bits D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
Echo.
sc.exe sdset wuauserv D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
Echo.
Echo Resetting Winsock...
Echo.
netsh winsock reset
Echo.
Echo Resetting the TCP/IP Stack...
Echo.
netsh int ip reset C:\727PC\ATLAS\Log\ipresetlog.log
Echo.
Echo Clearing Proxy Settings!
Echo.
netsh winhttp reset proxy
Echo.
Echo Bringing the services back online! (Some might not come back until system is rebooted)...
Echo.
net start wuauserv
net start bits
net start appidsvc
net start cryptsvc
net start ccmexec
Echo.
Echo ***** Replacing HOSTS file with known good copy *****
Echo.
copy /y "c:\727pc\ATLAS\Tools\hosts" "%windir%\System32\drivers\etc"
Echo.

Echo ***** Starting file cleanup *****
Echo.
Echo Emptying the Recycle bin...
Echo.
rd /s /q %systemdrive%\$Recycle.bin
Echo.
Echo.
Echo Deleting Temporary internet files (IE 7+)...
Echo.
DEL /s /q "%LOCALAPPDATA%\Microsoft\Windows\Temporary Internet Files\Low\Content.IE5\*"
Echo.
Echo Deleting AppData Temporary Files...
Echo.
rmdir /s /q %LOCALAPPDATA%\Temp\
mkdir %LOCALAPPDATA%\Temp
Echo.
Echo Deleting IE Saved Data and disabling add-ons
Echo.
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4351
Echo.
Echo Delete Google Chrome Extensions...
Echo.
rmdir /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Extensions"
mkdir "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Extensions"
Echo.
Echo Deleting Firefox extension cache...
Echo.
rmdir /s /q "%APPDATA%\Mozilla\Extensions"
mkdir "%APPDATA%\Mozilla\Extensions"
Echo.
Echo Cleaning Winsxs folder (This will make it impossible to revert OS updates prior to this point!!)
Echo.
Echo N|DISM /online /Cleanup-Image /SpSuperseded
Echo.
Echo Disabling/Deleting Hibernation and file(s)
Echo.
powercfg.exe -h off
Echo.

Echo ***** Performing Misc fixes *****
Echo.
start explorer.exe
Echo.
Echo Rebuilding Icon Cache...
Echo.
ie4uinit.exe -ClearIconCache
taskkill /F /IM explorer.exe
START C:\727pc\ATLAS\Tools\MALDEF.exe
DEL "%iconcache%" /A
Echo.
Echo Fixing Windows installer problems...
Echo.
msiexec /unregister
Echo.
msiexec /regserver
Echo.
Echo Setting the pagefile to a nice normal 4GB
Echo.
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
Echo.
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=4096,MaximumSize=4096
Echo.
Echo Enabling TRIM just in case
Echo.
fsutil behavior set disabledeletenotify 0
Echo.
Echo Calling TRIM this should be a value of (0)
Echo.
fsutil behavior query disabledeletenotify
Echo.
Echo Deleting Scheduled Tasks
Echo.
schtasks /delete /F /TN *
Echo.
Echo Checking for windows updates
Echo.
wuauclt.exe /detectnow
Echo.
Echo Disabling Superfetch...
Echo.
net stop SysMain /y
Echo.
sc config Superfetch start= disabled
Echo.
Echo Fixing Windows 8+ Store problems
Echo.
powershell -ExecutionPolicy Unrestricted Add-AppxPackage -DisableDevelopmentMode -Register $Env:SystemRoot\WinStore\AppxManifest.xml
Echo.
Echo Rebuild WMI Repository...
Echo.
winmgmt /verifyrepository
winmgmt /salvagerepository
Echo.
Echo Reset Icon Cache...
Echo.
REG DELETE "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v IconStreams /f
REG DELETE "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v PastIconsStream /f
Echo.

Echo ***** Repairing File System *****
Echo.
Dism /Online /Cleanup-Image /RestoreHealth
Echo.
Dism /Online /Cleanup-Image /StartComponentCleanup
Echo.
SFC /scannow
Echo.
Echo Y| chkdsk /f
Echo.

Echo ***** Starting Security Audit *****
Echo.
Echo Im now going to modify the security settings for executables to help combat cryptolocker and cryptowall.
Echo.
Start C:\727pc\ATLAS\Tools\CryptoPrevent.exe  /apply /appdata /appdatadeep /appdatalocal /programdata /userprofile /startup /bin /syskey /cipher /fakeexts /whitelist /silent
Echo.
Echo Now im going to try and fix the default Windows permissions. (Use Tweak if this breaks things!)
Echo.
secedit /configure /cfg %windir%\inf\defltbase.inf /db defltbase.sdb /verbose
Echo.
Echo I am going to attempt to reset the Windows GPO settings (vista, 7, 8+)
Echo.
RD /S /Q "%WinDir%\System32\GroupPolicyUsers"
RD /S /Q "%WinDir%\System32\GroupPolicy"
gpupdate /force
DEL "%systemroot%\system32\GroupPolicy\User\registry.pol"
DEL "%systemroot%\system32\GroupPolicy\Machine\registry .pol"
DEL "%userprofile%\ntuser.pol"
REG DELETE HKLM\Software\Policies /f
REG DELETE HKCU\Software\Policies /f
REG DELETE HKLM\Software\Microsoft\Windows\CurrentVersion\Policies /f
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Policies /f
Echo.
net localgroup administrators SERVICE /delete
Echo.

Echo ***** Starting Registry Settings *****
Echo.
Reg Add HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce /v Message /d "MSG * System HDD/SSD will I/O HARD while it rebuilds indexes!! ~5min" /f
Echo.
Echo Fixing Chrome update registry key...
Echo.
Reg Add HKLM\SOFTWARE\Policies\Google\Update /V "UpdateDefault" /D 1 /T REG_DWORD /F
Echo.
Echo Deleting Policy preventing Vista start menu items from appearing...
Echo.
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoInstrumentation /f
Echo.
Echo Deleting upper and lower filters (Fixes no CD appearing)...
Echo.
REG DELETE HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E965-E325-11CE-BFC1-08002BE10318} /v UpperFilters /f
REG DELETE HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E965-E325-11CE-BFC1-08002BE10318} /v LowerFilters /f
Echo.
Echo Removing WSUS client info...
Echo.
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v AccountDomainSid /f 
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v PingID /f 
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v SusClientId /f 
Echo.
Echo Forcing AU Re-Discovery...
Echo.
wuauclt /resetauthorization /detectnow
Echo.
subinacl /subkeyreg HKEY_LOCAL_MACHINE /grant=administrators=f >NUL 2>NUL
subinacl /subkeyreg HKEY_CURRENT_USER /grant=administrators=f >NUL 2>NUL
subinacl /subkeyreg HKEY_CLASSES_ROOT /grant=administrators=f >NUL 2>NUL
subinacl /subdirectories %SystemDrive% /grant=administrators=f >NUL 2>NUL
subinacl /subkeyreg HKEY_LOCAL_MACHINE /grant=system=f >NUL 2>NUL
subinacl /subkeyreg HKEY_CURRENT_USER /grant=system=f >NUL 2>NUL
subinacl /subkeyreg HKEY_CLASSES_ROOT /grant=system=f >NUL 2>NUL
subinacl /subdirectories %SystemDrive% /grant=system=f >NUL 2>NUL
secedit /configure /cfg secsetup.inf /db secsetup.sdb /verbose
Echo.
Echo ***** Checking windows version for service audit *****
ver | findstr /i "6\.1\." > nul
IF %ERRORLEVEL% EQU 0 goto serv7
ver | findstr /i "6\.2\." > nul
IF %ERRORLEVEL% EQU 0 goto serv8
ver | findstr /i "6\.3\." > nul
IF %ERRORLEVEL% EQU 0 goto serv81
ver | findstr /i "10\.0\." > nul
IF %ERRORLEVEL% EQU 0 goto serv10
Echo ***** Starting Services Audit *****
:serv7
sc config AeLookupSvc start= demand
sc config ALG start= demand
sc config AppIDSvc start= demand
sc config Appinfo start= demand
sc config AppMgmt start= demand
sc config AudioEndpointBuilder start= Auto
sc config AudioSrv start= Auto
sc config AxInstSV start= demand
sc config BDESVC start= demand
sc config BFE start= Auto
sc config BITS start= Auto
sc config Browser start= demand
sc config bthserv start= demand
sc config CertPropSvc start= demand
sc config clr_optimization_v2.0.50727_32 start= Auto
sc config clr_optimization_v2.0.50727_64 start= Auto
sc config COMSysApp start= demand
sc config CryptSvc start= Auto
sc config CscService start= Auto
sc config DcomLaunch start= Auto
sc config defragsvc start= demand
sc config Dhcp start= Auto
sc config Dnscache start= Auto
sc config dot3svc start= demand
sc config DPS start= Auto
sc config EapHost start= demand
sc config EFS start= demand
sc config ehRecvr start= Auto
sc config ehSched start= Auto
sc config eventlog start= Auto
sc config EventSystem start= Auto
sc config Fax start= demand
sc config fdPHost start= demand
sc config FDResPub start= Auto
sc config FontCache start= Auto
sc config FontCache3.0.0.0 start= demand
sc config gpsvc start= Auto
sc config hidserv start= demand
sc config hkmsvc start= demand
sc config HomeGroupListener start= demand
sc config HomeGroupProvider start= demand
sc config idsvc start= demand
sc config IKEEXT start= demand
sc config IPBusEnum start= demand
sc config iphlpsvc start= Auto
sc config KeyIso start= demand
sc config KtmRm start= demand
sc config LanmanServer start= Auto
sc config LanmanWorkstation start= Auto
sc config lltdsvc start= demand
sc config lmhosts start= Auto
sc config Mcx2Svc start= Disabled
sc config MMCSS start= Auto
sc config MpsSvc start= Auto
sc config MSDTC start= demand
sc config MSiSCSI start= demand
sc config msiserver start= demand
sc config napagent start= demand
sc config Netlogon start= Auto
sc config Netman start= demand
sc config netprofm start= demand
sc config NetTcpPortSharing start= Disabled
sc config NlaSvc start= Auto
sc config nsi start= Auto
sc config p2pimsvc start= demand
sc config p2psvc start= demand
sc config PcaSvc start= Auto
sc config PeerDistSvc start= demand
sc config PerfHost start= demand
sc config pla start= demand
sc config PlugPlay start= Auto
sc config PNRPAutoReg start= demand
sc config PNRPsvc start= demand
sc config PolicyAgent start= demand
sc config Power start= Auto
sc config ProfSvc start= Auto
sc config ProtectedStorage start= demand
sc config QWAVE start= demand
sc config RasAuto start= demand
sc config RasMan start= demand
sc config RemoteAccess start= Disabled
sc config RemoteRegistry start= demand
sc config RpcEptMapper start= Auto
sc config RpcLocator start= demand
sc config RpcSs start= Auto
sc config SamSs start= Auto
sc config SCardSvr start= demand
sc config Schedule start= Auto
sc config SCPolicySvc start= demand
sc config SDRSVC start= demand
sc config seclogon start= demand
sc config SENS start= Auto
sc config SensrSvc start= demand
sc config SessionEnv start= demand
sc config SharedAccess start= Disabled
sc config ShellHWDetection start= Auto
sc config SNMPTRAP start= demand
sc config Spooler start= Auto
sc config sppsvc start= Auto
sc config sppuinotify start= demand
sc config SSDPSRV start= demand
sc config SstpSvc start= demand
sc config stisvc start= Auto
sc config swprv start= demand
sc config SysMain start= Auto
sc config TabletInputService start= demand
sc config TapiSrv start= demand
sc config TBS start= demand
sc config TermService start= Auto
sc config Themes start= Auto
sc config THREADORDER start= demand
sc config TrkWks start= Auto
sc config TrustedInstaller start= demand
sc config UI0Detect start= demand
sc config UmRdpService start= demand
sc config upnphost start= demand
sc config UxSms start= Auto
sc config VaultSvc start= demand
sc config vds start= demand
sc config VSS start= demand
sc config W32Time start= Auto
sc config wbengine start= demand
sc config WbioSrvc start= demand
sc config wcncsvc start= demand
sc config WcsPlugInService start= demand
sc config WdiServiceHost start= demand
sc config WdiSystemHost start= demand
sc config WebClient start= demand
sc config Wecsvc start= demand
sc config wercplsupport start= demand
sc config WerSvc start= demand
sc config WinDefend start= Auto
sc config WinHttpAutoProxySvc start= demand
sc config Winmgmt start= Auto
sc config WinRM start= demand
sc config Wlansvc start= Auto
sc config wmiApSrv start= demand
sc config WMPNetworkSvc start= Auto
sc config WPCSvc start= demand
sc config WPDBusEnum start= demand
sc config wscsvc start= Auto
sc config WSearch start= Auto
sc config wuauserv start= Auto
sc config wudfsvc start= demand
sc config WwanSvc start= demand
goto wrapup

:serv8
sc config AeLookupSvc start= demand
sc config ALG start= demand
sc config AppIDSvc start= demand
sc config Appinfo start= demand
sc config AppMgmt start= demand
sc config AppReadiness start= demand
sc config AppXSvc start= demand
sc config AudioEndpointBuilder start= Auto
sc config Audiosrv start= Auto
sc config AxInstSV start= demand
sc config BDESVC start= demand
sc config BFE start= Auto
sc config BITS start= Auto
sc config BrokerInfrastructure start= Auto
sc config Browser start= demand
sc config bthserv start= demand
sc config CertPropSvc start= demand
sc config COMSysApp start= demand
sc config CryptSvc start= Auto
sc config CscService start= demand
sc config DcomLaunch start= Auto
sc config defragsvc start= demand
sc config DeviceAssociationService start= Auto
sc config DeviceInstall start= demand
sc config Dhcp start= Auto
sc config Dnscache start= Auto
sc config dot3svc start= demand
sc config DPS start= Auto
sc config DsmSvc start= demand
sc config Eaphost start= demand
sc config EFS start= demand
sc config EventLog start= Auto
sc config EventSystem start= Auto
sc config Fax start= demand
sc config fdPHost start= demand
sc config FDResPub start= demand
sc config fhsvc start= demand
sc config FontCache start= Auto
sc config gpsvc start= Auto
sc config hidserv start= demand
sc config hkmsvc start= demand
sc config HomeGroupListener start= demand
sc config HomeGroupProvider start= demand
sc config IEEtwCollectorService start= demand
sc config IKEEXT start= demand
sc config iphlpsvc start= Auto
sc config KeyIso start= demand
sc config KtmRm start= demand
sc config LanmanServer start= Auto
sc config LanmanWorkstation start= Auto
sc config lfsvc start= demand
sc config lltdsvc start= demand
sc config lmhosts start= Auto
sc config LSM start= Auto
sc config MMCSS start= Auto
sc config MpsSvc start= Auto
sc config MSDTC start= demand
sc config MSiSCSI start= demand
sc config msiserver start= demand
sc config MsKeyboardFilter start= Disabled
sc config napagent start= demand
sc config NcaSvc start= demand
sc config NcbService start= demand
sc config NcdAutoSetup start= demand
sc config Netlogon start= Auto
sc config Netman start= demand
sc config netprofm start= demand
sc config NetTcpPortSharing start= Disabled
sc config NlaSvc start= Auto
sc config nsi start= Auto
sc config p2pimsvc start= demand
sc config p2psvc start= demand
sc config PcaSvc start= Auto
sc config PeerDistSvc start= demand
sc config PerfHost start= demand
sc config pla start= demand
sc config PlugPlay start= demand
sc config PNRPAutoReg start= demand
sc config PNRPsvc start= demand
sc config PolicyAgent start= demand
sc config Power start= Auto
sc config PrintNotify start= demand
sc config ProfSvc start= Auto
sc config QWAVE start= demand
sc config RasAuto start= demand
sc config RasMan start= demand
sc config RemoteAccess start= Disabled
sc config RemoteRegistry start= Disabled
sc config RpcEptMapper start= Auto
sc config RpcLocator start= demand
sc config RpcSs start= Auto
sc config SamSs start= Auto
sc config SCardSvr start= Disabled
sc config ScDeviceEnum start= demand
sc config Schedule start= Auto
sc config SCPolicySvc start= demand
sc config seclogon start= demand
sc config SENS start= Auto
sc config SensrSvc start= demand
sc config SessionEnv start= demand
sc config SharedAccess start= Disabled
sc config ShellHWDetection start= Auto
sc config smphost start= demand
sc config SNMPTRAP start= demand
sc config Spooler start= Auto
sc config sppsvc start= Auto
sc config SSDPSRV start= demand
sc config SstpSvc start= demand
sc config stisvc start= Auto
sc config StorSvc start= demand
sc config svsvc start= demand
sc config swprv start= demand
sc config SysMain start= Auto
sc config SystemEventsBroker start= Auto
sc config TabletInputService start= Auto
sc config TapiSrv start= demand
sc config TermService start= Auto
sc config Themes start= Auto
sc config THREADORDER start= demand
sc config TimeBroker start= demand
sc config TrkWks start= Auto
sc config TrustedInstaller start= demand
sc config UI0Detect start= demand
sc config UmRdpService start= demand
sc config upnphost start= demand
sc config VaultSvc start= demand
sc config vds start= demand
sc config vmicguestinterface start= demand
sc config vmicheartbeat start= demand
sc config vmickvpexchange start= demand
sc config vmicrdv start= demand
sc config vmicshutdown start= demand
sc config vmictimesync start= demand
sc config vmicvss start= demand
sc config VSS start= demand
sc config W32Time start= Auto
sc config wbengine start= demand
sc config WbioSrvc start= demand
sc config Wcmsvc start= Auto
sc config wcncsvc start= demand
sc config WcsPlugInService start= demand
sc config WdiServiceHost start= demand
sc config WdiSystemHost start= demand
sc config WdNisSvc start= demand
sc config WebClient start= demand
sc config Wecsvc start= demand
sc config WEPHOSTSVC start= demand
sc config wercplsupport start= demand
sc config WerSvc start= demand
sc config WiaRpc start= demand
sc config WinDefend start= Auto
sc config WinHttpAutoProxySvc start= demand
sc config Winmgmt start= Auto
sc config WinRM start= demand
sc config WlanSvc start= Auto
sc config wlidsvc start= demand
sc config wmiApSrv start= demand
sc config WMPNetworkSvc start= Auto
sc config workfolderssvc start= demand
sc config WPCSvc start= demand
sc config WPDBusEnum start= demand
sc config wscsvc start= Auto
sc config WSearch start= Auto
sc config WSService start= demand
sc config wuauserv start= demand
sc config wudfsvc start= demand
sc config WwanSvc start= demand
goto wrapup

:serv81
sc config AeLookupSvc start= demand
sc config ALG start= demand
sc config AppIDSvc start= demand
sc config Appinfo start= demand
sc config AppMgmt start= demand
sc config AppReadiness start= demand
sc config AppXSvc start= demand
sc config AudioEndpointBuilder start= Auto
sc config Audiosrv start= Auto
sc config AxInstSV start= demand
sc config BDESVC start= demand
sc config BFE start= Auto
sc config BITS start= Auto
sc config BrokerInfrastructure start= Auto
sc config Browser start= demand
sc config bthserv start= demand
sc config CertPropSvc start= demand
sc config COMSysApp start= demand
sc config CryptSvc start= Auto
sc config CscService start= demand
sc config DcomLaunch start= Auto
sc config defragsvc start= demand
sc config DeviceAssociationService start= Auto
sc config DeviceInstall start= demand
sc config Dhcp start= Auto
sc config Dnscache start= Auto
sc config dot3svc start= demand
sc config DPS start= Auto
sc config DsmSvc start= demand
sc config Eaphost start= demand
sc config EFS start= demand
sc config EventLog start= Auto
sc config EventSystem start= Auto
sc config Fax start= demand
sc config fdPHost start= demand
sc config FDResPub start= demand
sc config fhsvc start= demand
sc config FontCache start= Auto
sc config gpsvc start= Auto
sc config hidserv start= demand
sc config hkmsvc start= demand
sc config HomeGroupListener start= demand
sc config HomeGroupProvider start= demand
sc config IEEtwCollectorService start= demand
sc config IKEEXT start= demand
sc config iphlpsvc start= Auto
sc config KeyIso start= demand
sc config KtmRm start= demand
sc config LanmanServer start= Auto
sc config LanmanWorkstation start= Auto
sc config lfsvc start= demand
sc config lltdsvc start= demand
sc config lmhosts start= Auto
sc config LSM start= Auto
sc config MMCSS start= Auto
sc config MpsSvc start= Auto
sc config MSDTC start= demand
sc config MSiSCSI start= demand
sc config msiserver start= demand
sc config MsKeyboardFilter start= Disabled
sc config napagent start= demand
sc config NcaSvc start= demand
sc config NcbService start= demand
sc config NcdAutoSetup start= demand
sc config Netlogon start= Auto
sc config Netman start= demand
sc config netprofm start= demand
sc config NetTcpPortSharing start= Disabled
sc config NlaSvc start= Auto
sc config nsi start= Auto
sc config p2pimsvc start= demand
sc config p2psvc start= demand
sc config PcaSvc start= Auto
sc config PeerDistSvc start= demand
sc config PerfHost start= demand
sc config pla start= demand
sc config PlugPlay start= demand
sc config PNRPAutoReg start= demand
sc config PNRPsvc start= demand
sc config PolicyAgent start= demand
sc config Power start= Auto
sc config PrintNotify start= demand
sc config ProfSvc start= Auto
sc config QWAVE start= demand
sc config RasAuto start= demand
sc config RasMan start= demand
sc config RemoteAccess start= Disabled
sc config RemoteRegistry start= Disabled
sc config RpcEptMapper start= Auto
sc config RpcLocator start= demand
sc config RpcSs start= Auto
sc config SamSs start= Auto
sc config SCardSvr start= Disabled
sc config ScDeviceEnum start= demand
sc config Schedule start= Auto
sc config SCPolicySvc start= demand
sc config seclogon start= demand
sc config SENS start= Auto
sc config SensrSvc start= demand
sc config SessionEnv start= demand
sc config SharedAccess start= Disabled
sc config ShellHWDetection start= Auto
sc config smphost start= demand
sc config SNMPTRAP start= demand
sc config Spooler start= Auto
sc config sppsvc start= Auto
sc config SSDPSRV start= demand
sc config SstpSvc start= demand
sc config stisvc start= Auto
sc config StorSvc start= demand
sc config svsvc start= demand
sc config swprv start= demand
sc config SysMain start= Auto
sc config SystemEventsBroker start= Auto
sc config TabletInputService start= Auto
sc config TapiSrv start= demand
sc config TermService start= Auto
sc config Themes start= Auto
sc config THREADORDER start= demand
sc config TimeBroker start= demand
sc config TrkWks start= Auto
sc config TrustedInstaller start= demand
sc config UI0Detect start= demand
sc config UmRdpService start= demand
sc config upnphost start= demand
sc config VaultSvc start= demand
sc config vds start= demand
sc config vmicguestinterface start= demand
sc config vmicheartbeat start= demand
sc config vmickvpexchange start= demand
sc config vmicrdv start= demand
sc config vmicshutdown start= demand
sc config vmictimesync start= demand
sc config vmicvss start= demand
sc config VSS start= demand
sc config W32Time start= Auto
sc config wbengine start= demand
sc config WbioSrvc start= demand
sc config Wcmsvc start= Auto
sc config wcncsvc start= demand
sc config WcsPlugInService start= demand
sc config WdiServiceHost start= demand
sc config WdiSystemHost start= demand
sc config WdNisSvc start= demand
sc config WebClient start= demand
sc config Wecsvc start= demand
sc config WEPHOSTSVC start= demand
sc config wercplsupport start= demand
sc config WerSvc start= demand
sc config WiaRpc start= demand
sc config WinDefend start= Auto
sc config WinHttpAutoProxySvc start= demand
sc config Winmgmt start= Auto
sc config WinRM start= demand
sc config WlanSvc start= Auto
sc config wlidsvc start= demand
sc config wmiApSrv start= demand
sc config WMPNetworkSvc start= Auto
sc config workfolderssvc start= demand
sc config WPCSvc start= demand
sc config WPDBusEnum start= demand
sc config wscsvc start= Auto
sc config WSearch start= Auto
sc config WSService start= demand
sc config wuauserv start= demand
sc config wudfsvc start= demand
sc config WwanSvc start= demand
goto wrapup

:serv10
sc config AJRouter start= demand
sc config ALG start= demand
sc config AppIDSvc start= demand
sc config Appinfo start= demand
sc config AppMgmt start= demand
sc config AppReadiness start= demand
sc config AppXSvc start= demand
sc config AudioEndpointBuilder start= Auto
sc config Audiosrv start= Auto
sc config AxInstSV start= demand
sc config BDESVC start= demand
sc config BFE start= Auto
sc config BITS start= Auto
sc config BrokerInfrastructure start= Auto
sc config Browser start= demand
sc config BthHFSrv start= demand
sc config bthserv start= demand
sc config CDPSvc start= demand
sc config CertPropSvc start= demand
sc config ClipSVC start= demand
sc config COMSysApp start= demand
sc config CoreMessagingRegistrar start= Auto
sc config CryptSvc start= Auto
sc config CscService start= demand
sc config DcomLaunch start= Auto
sc config DcpSvc start= demand
sc config defragsvc start= demand
sc config DeviceAssociationService start= demand
sc config DeviceInstall start= demand
sc config DevQueryBroker start= demand
sc config Dhcp start= Auto
sc config diagnosticshub.standardcollector.service start= demand
sc config DiagTrack start= Auto
sc config DmEnrollmentSvc start= demand
sc config dmwappushservice start= Auto
sc config Dnscache start= Auto
sc config DoSvc start= Auto
sc config dot3svc start= demand
sc config DPS start= Auto
sc config DsmSvc start= demand
sc config DsSvc start= demand
sc config Eaphost start= demand
sc config EFS start= demand
sc config embeddedmode start= demand
sc config EntAppSvc start= demand
sc config EventLog start= Auto
sc config EventSystem start= Auto
sc config Fax start= demand
sc config fdPHost start= demand
sc config FDResPub start= demand
sc config fhsvc start= demand
sc config FontCache start= Auto
sc config gpsvc start= Auto
sc config hidserv start= demand
sc config HomeGroupListener start= demand
sc config HomeGroupProvider start= demand
sc config icssvc start= demand
sc config IEEtwCollectorService start= demand
sc config IKEEXT start= demand
sc config iphlpsvc start= Auto
sc config KeyIso start= demand
sc config KtmRm start= demand
sc config LanmanServer start= Auto
sc config LanmanWorkstation start= Auto
sc config lfsvc start= demand
sc config LicenseManager start= demand
sc config lltdsvc start= demand
sc config lmhosts start= demand
sc config LSM start= Auto
sc config MapsBroker start= Auto
sc config MpsSvc start= Auto
sc config MSDTC start= demand
sc config MSiSCSI start= demand
sc config msiserver start= demand
sc config NcaSvc start= demand
sc config NcbService start= demand
sc config NcdAutoSetup start= demand
sc config Netlogon start= Auto
sc config Netman start= demand
sc config netprofm start= demand
sc config NetSetupSvc start= demand
sc config NetTcpPortSharing start= Disabled
sc config NgcCtnrSvc start= demand
sc config NgcSvc start= demand
sc config NlaSvc start= Auto
sc config nsi start= Auto
sc config p2pimsvc start= demand
sc config p2psvc start= demand
sc config PcaSvc start= Auto
sc config PeerDistSvc start= demand
sc config PerfHost start= demand
sc config pla start= demand
sc config PlugPlay start= demand
sc config PNRPAutoReg start= demand
sc config PNRPsvc start= demand
sc config PolicyAgent start= demand
sc config Power start= Auto
sc config PrintNotify start= demand
sc config ProfSvc start= Auto
sc config QWAVE start= demand
sc config RasAuto start= demand
sc config RasMan start= demand
sc config RemoteAccess start= Disabled
sc config RemoteRegistry start= Disabled
sc config RetailDemo start= demand
sc config RpcEptMapper start= Auto
sc config RpcLocator start= demand
sc config RpcSs start= Auto
sc config SamSs start= Auto
sc config SCardSvr start= Disabled
sc config ScDeviceEnum start= demand
sc config Schedule start= Auto
sc config SCPolicySvc start= demand
sc config SDRSVC start= demand
sc config seclogon start= demand
sc config SENS start= Auto
sc config SensorDataService start= demand
sc config SensorService start= demand
sc config SensrSvc start= demand
sc config SessionEnv start= demand
sc config SharedAccess start= demand
sc config ShellHWDetection start= Auto
sc config smphost start= demand
sc config SmsRouter start= demand
sc config SNMPTRAP start= demand
sc config Spooler start= Auto
sc config sppsvc start= Auto
sc config SSDPSRV start= demand
sc config SstpSvc start= demand
sc config StateRepository start= demand
sc config stisvc start= demand
sc config StorSvc start= demand
sc config svsvc start= demand
sc config swprv start= demand
sc config SysMain start= Auto
sc config SystemEventsBroker start= Auto
sc config TabletInputService start= demand
sc config TapiSrv start= demand
sc config TermService start= Auto
sc config Themes start= Auto
sc config tiledatamodelsvc start= Auto
sc config TimeBroker start= demand
sc config TrkWks start= Auto
sc config TrustedInstaller start= demand
sc config UI0Detect start= demand
sc config UmRdpService start= demand
sc config upnphost start= demand
sc config UserManager start= Auto
sc config UsoSvc start= demand
sc config VaultSvc start= demand
sc config vds start= demand
sc config vmicguestinterface start= demand
sc config vmicheartbeat start= demand
sc config vmickvpexchange start= demand
sc config vmicrdv start= demand
sc config vmicshutdown start= demand
sc config vmictimesync start= demand
sc config vmicvmsession start= demand
sc config vmicvss start= demand
sc config VSS start= demand
sc config W32Time start= Auto
sc config WalletService start= demand
sc config wbengine start= demand
sc config WbioSrvc start= demand
sc config Wcmsvc start= Auto
sc config wcncsvc start= demand
sc config WcsPlugInService start= demand
sc config WdiServiceHost start= demand
sc config WdiSystemHost start= demand
sc config WdNisSvc start= demand
sc config WebClient start= demand
sc config Wecsvc start= demand
sc config WEPHOSTSVC start= demand
sc config wercplsupport start= demand
sc config WerSvc start= demand
sc config WiaRpc start= demand
sc config WinDefend start= Auto
sc config WinHttpAutoProxySvc start= demand
sc config Winmgmt start= Auto
sc config WinRM start= demand
sc config WlanSvc start= Auto
sc config wlidsvc start= demand
sc config wmiApSrv start= demand
sc config WMPNetworkSvc start= Auto
sc config workfolderssvc start= demand
sc config WPDBusEnum start= demand
sc config WpnService start= demand
sc config wscsvc start= Auto
sc config WSearch start= Auto
sc config WSService start= demand
sc config wuauserv start= demand
sc config wudfsvc start= demand
sc config WwanSvc start= demand
sc config XblAuthManager start= demand
sc config XblGameSave start= demand
sc config XboxNetApiSvc start= demand
goto wrapup

:wrapup
Echo ***** Starting wrap-up fixes before shutdown *****
Echo.
Echo Flushing the DNS Cache...
Echo.
ipconfig /flushdns
Echo.
Echo Releasing and Renewing the IP...
Echo.
ipconfig /renew
Echo.
sc start MsMpSvc
Echo.
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaveActive" /t REG_SZ /d "1" /f
Echo.
Echo.
net stop winmgmt /Y
rmdir "C:\Windows\System32\wbem\Repository" /s /q
winmgmt /resetRepository
Echo.
CLEANMGR /verylowdisk
Echo.
taskkill /F /IM "coretemp".exe /T
timeout 5
taskkill /F /IM "maldef.exe" /T
timeout 5
start wmplayer "c:\727pc\ATLAS\Tools\alert.mp3"
timeout 15
taskkill /F /IM "wmplayer".exe
rmdir /s /q "C:\727pc\ATLAS\Tools"
Echo.
goto logul

:logul
Echo ***** Starting Log Upload to ATLAS Server *****
Echo.
cd /D "C:\727PC\ATLAS\Log"
Echo open teamdotexe.org> temp.txt
Echo user Scrubber>> temp.txt
Echo LogMe>> temp.txt
Echo ASCII>> temp.txt
Echo prompt no>> temp.txt
Echo mput *.log>> temp.txt
Echo quit>> temp.txt
ftp -n -s:temp.txt
del temp.txt
Echo.
netsh firewall set opmode enable
Echo.
NetSh Advfirewall set allprofiles state on
Echo.
shutdown /r /t 30 /c "A.T.L.A.S will reboot the system in 30 seconds."
goto end

:tools
cls
Echo.
Echo Various tools that may help with certain circumstances.
Echo.
Echo 1 = Software Tools
Echo.
Echo 2 = Hardware Tools
ECHO.
Echo 3 = Windows Tools
Echo.
Echo 4 = Config
Echo.
Echo 5 = Main Menu
set choice=
ECHO.
Echo Please Select one.
Echo.
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto software
if '%choice%'=='2' goto hardware
if '%choice%'=='3' goto windows
if '%choice%'=='4' goto config
if '%choice%'=='5' goto menu
goto invtool

:invtool
Echo.
call :colorEcho 4e "Invalid Selection Please Try again..."
Echo.
Echo.
pause
goto tools

:Software
cls
Echo.
Echo Software Tools Menu
Echo.
Echo 1 = Manually Poll System and dump log.
Echo.
Echo 2 = Clear Dirty Bit
Echo.
Echo 3 = Wrap-up
Echo.
Echo 4 = Back
set choice=
ECHO.
Echo Please Select one.
Echo.
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto poll
if '%choice%'=='2' goto dbit
if '%choice%'=='3' goto branding
if '%choice%'=='4' goto tools
goto invsoft

:invsoft
Echo.
call :colorEcho 4e "Invalid Selection Please Try again..."
Echo.
Echo.
pause
goto software

:Hardware
cls
Echo.
Echo Hardware Tools Menu
Echo.
Echo 1 = Defrag (Ignores SSDs)
Echo.
Echo 2 = Driver Verfiy (Force BSOD detection)
Echo.
Echo 3 = Back
set choice=
ECHO.
Echo Please Select one.
Echo.
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto defrag
if '%choice%'=='2' goto verifyr
if '%choice%'=='3' goto tools
goto invhard

:invhard
Echo.
call :colorEcho 4e "Invalid Selection Please Try again..."
Echo.
Echo.
pause
goto hardware

:Windows
cls
Echo.
Echo Windows Tools Menu
Echo.
Echo 1 = Reboot into advanced recovery (Win8+)
Echo.
Echo 2 = Create restoration data for PC Refresh (Win8+)
ECHO.
Echo 3 = WSUS Settings
Echo.
Echo 4 = Back
set choice=
ECHO.
Echo Please Select one.
Echo.
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto win8boot
if '%choice%'=='2' goto advrec
if '%choice%'=='3' goto wsus
if '%choice%'=='4' goto tools
goto invwin

:invwin
Echo.
call :colorEcho 4e "Invalid Selection Please Try again..."
Echo.
Echo.
pause
goto windows

:Config
cls
Echo.
Echo ATLAS Config
Echo.
Echo 1 = Check for Update
Echo.
Echo 2 = Check for Beta Update
Echo.
Echo 3 = Change Log
Echo.
Echo 4 = User Guide
Echo.
Echo 5 = Back
set choice=
ECHO.
Echo Please Select one.
Echo.
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto vcheck
if '%choice%'=='2' goto bcheck
if '%choice%'=='3' goto chnglg
if '%choice%'=='4' goto usrmanu
if '%choice%'=='5' goto tools
goto invconf

:invconf
Echo.
call :colorEcho 4e "Invalid Selection Please Try again..."
Echo.
Echo.
pause
goto config

:win8boot
cls
Echo.
Echo Now rebooting to advanced boot menu.
Echo. 
Echo This will only work for windows 8 and up.
Echo.
shutdown /r /o /f /t 05
Echo.

:advrec
cls
Echo.
Echo This will create the Windows recovery WIM.
Echo This will also save installed programs.
Echo This will also fix needing the install media when doing a refresh.
Echo This process needs at minimum 16GB of free space!
Echo Ideally this is run after a virus removal or a windows 8.1 upgrade.
Echo This fixes "Insert Install Media" when running a refresh on 8.1 systems.
Echo Creates image in Windows 10 which is not uncluded by default.
Echo This folder will be hidden after creation in the root of C:
Echo.
pause
Echo.
MD C:\727PCimage
recimg -CreateImage C:\727PCimage
attrib C:\727PCimage +s +h
Echo.
Echo Complete!
Echo.
pause
Echo.
goto menu

:poll
cls
@Echo off
Echo Profiling system and quitting...
Echo.
MD C:\727PC\ATLAS\Log >nul 2>&1
call :poll2 >> "C:\727PC\ATLAS\Log\Manual.log" 2>&1

:poll2
Echo.
Echo Manually getting running processes and services.
Echo.
Echo Location of the dump is C:\727PC\ATLAS\Log.
Echo.
Echo Current Local date and time is:
Echo.
DATE /t
TIME /t
Echo.
Echo Computer Name: %computername%
Echo.
Echo User Name: %username%
Echo.
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Model"
Echo.
Echo ***** Listing running process' for reasons *****
Echo.
tasklist
Echo.
Echo ***** Listing running services for reasons *****
Echo.
net start
Echo.
Echo ***** Listing working task file paths *****
Echo.
wmic process get executablepath
Echo.
Echo ***** Listing directories in program files *****
Echo.
dir /a "C:\Program Files"
Echo.
Echo ***** Listing directories in program files x86 *****
Echo.
dir /a "C:\Program Files (x86)"
Echo.
Echo Complete!!
Echo.
timeout 5
Echo.
goto :EOF

:dbit
cls
Echo.
Echo Please input the drive letter you would like to remove the bit on.
Echo.
set /p input=""
Echo.
chkntfs /x %input%:
Echo.
Echo Done!
timeout 5
Echo.
goto tools

:branding
MD c:\727pc\ATLAS\Tools >nul 2>&1
cls
Echo.
Echo Tattooing system please wait...
Echo.
Echo Do not reboot if prompted until wrap-up completes.
Echo.
start devmgmt.msc >nul
control /name Microsoft.System >nul
control /name Microsoft.WindowsUpdate >nul
Echo Downloading DirectX... (Required DX3D9 Binaries)
Echo.
bitsadmin /transfer Branding /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Stable/dxwebsetup.exe c:\727pc\ATLAS\Tools\dxwebsetup.exe >nul
Echo Installing DirectX...
Echo.
Start /wait C:\727PC\ATLAS\Tools\dxwebsetup.exe /q
Echo Downloading Package...
Echo.
bitsadmin /transfer Branding /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Stable/branding.exe c:\727pc\ATLAS\Tools\branding.exe >nul
Echo Extracting Package...
Echo.
Start /wait C:\727PC\ATLAS\Tools\branding.exe -y
Echo Implanting screensaver...
Echo.
timeout 10 >nul 2>&1
Start /b C:\727PC\ATLAS\Tools\Branding\Branding.bat >nul 2>&1
Echo Please enter settings of screensaver and paste license key. Then disable music and ENABLE exit on mouse move.
Echo.
timeout 20 >nul 2>&1
Echo Downloading Ninite...
Echo.
bitsadmin /transfer Branding /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Stable/ninite.exe c:\727pc\ATLAS\Tools\ninite.exe >nul
Echo Installing Core apps with Ninite exit after completion.
Echo.
Start /wait C:\727PC\ATLAS\Tools\ninite.exe
Echo Starting Adobe Reader; Please accept terms and set program defaults. (Win 10+)
Echo.
START /wait AcroRd32.exe
Echo Starting Internet explorer, Please select reccomended and ENABLE plugins.
Echo.
START /wait iexplore.exe
Echo Starting Windows Media Player, Plese select reccomended settings.
Echo.
START /wait wmplayer.exe
Echo Deleting WMPC Icon...
del %public%\Desktop\"Media Player Classic".lnk 2> nul
Echo.
Echo Installing .Net 2.x-3.5 (8.x-10+) If this fails do so manually via Add/Remove Windows features.
powershell -Command Enable-WindowsOptionalFeature -Online -FeatureName NetFx3 -All 2>&1 >nul
Echo.
Echo Getting rid of IE 11 "First Run Tab" (Win 7)...
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Main" /v DisableFirstRunCustomize /t REG_DWORD /d 1 /f 2>&1 >nul
Echo.
Echo Done. Reboot machine for changes to take effect.
Echo.
pause
rmdir /s /q "C:\727pc\ATLAS\Tools\"
goto wrapdel

:wrapdel
cls
Echo Do you want to exit and Delete?
Echo.
Echo 1 = Yes
Echo.
Echo 2 = No
set choice=
Echo.
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto end
if '%choice%'=='2' goto menu
goto invwrapdel

:invwrapdel
Echo.
call :colorEcho 4e "Invalid Selection Please Try again..."
Echo.
Echo.
pause
goto wrapdel

:defrag
cls
Echo.
defrag /C /X /U
Echo.
Echo Done!
timeout 5
Echo.
goto tools

:chnglg
cls
Echo.
bitsadmin /transfer ATLAS /download /priority FOREGROUND http://www.teamdotexe.org/Atlas/Stable/changelog.txt "%userprofile%\desktop\changelog.txt"
Echo.
type "%userprofile%\desktop\changelog.txt"
Echo.
DEL "%userprofile%\desktop\changelog.txt" >NUL 2>NUL
Echo.
Pause
goto tools

:usrmanu
cls
Echo.
bitsadmin /transfer ATLAS /download /priority FOREGROUND "http://www.teamdotexe.org/Atlas/Stable/ATLAS Technician Tool.docx" "%userprofile%\desktop\ATLAS Technician Tool.docx"
Echo.
call "%userprofile%\desktop\ATLAS Technician Tool.docx"
Echo.
Echo Saved to the Desktop!
Echo.
Pause
goto tools

:verifyr
cls
Echo.
Echo Verifier Stresses System drivers forcing a problem code.
Echo.
Echo This is very useful when trying to emulate a BSOD code.
Echo.
Echo This will cause the system to run very slowly. This is Normal.
Echo.
Echo If you cant boot back up boot to safe mode and run.
Echo.
Echo (Admin CMD) verifier /reset
Echo.
Echo Stability test can be upto 24hours.
Echo.
Echo 1 = Enable Verifier
Echo.
Echo 2 = Disable Verifier
ECHO.
Echo 3 = Main Menu
set choice=
ECHO.
Echo Please Select one.
Echo.
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto verifyon
if '%choice%'=='2' goto verifyoff
if '%choice%'=='3' goto menu
goto invverify

:invverify
Echo.
call :colorEcho 4e "Invalid Selection Please Try again..."
Echo.
Echo.
pause
goto verifyr


:verifyon
cls
Echo.
verifier /all
Echo.
Echo Verify is on!!
Echo.
Echo Please reboot machine to stress drivers!
Echo.
Echo System will run VERY SLOW to stop verfy please select shut off verify!
Echo.
Echo The system will now reboot.
Echo.
pause
Echo.
shutdown -r -t 00
goto exit

:verifyoff
cls
Echo.
verifier /reset
Echo.
Echo Verify is off!!
Echo.
Echo The system will now reboot.
Echo.
pause
Echo.
shutdown -r -t 00
goto exit


:wsus
cls
Echo.
Echo You can insert and remove WSUS entries here for updates.
Echo.
Echo A reboot is required for changes to take effect.
Echo.
Echo Options to inject entries w/o reboot are here for your convinence.
Echo.
Echo 1 = Inject WSUS PCT (Reboot Needed)
Echo.
Echo 2 = Inject WSUS PCS (Reboot Needed)
ECHO.
Echo 3 = Inject WSUS PCL (Reboot Needed)
Echo.
Echo 4 = Inject WSUS PCT (Auto Restart)
Echo.
Echo 5 = Inject WSUS PCS (Auto Restart)
ECHO.
Echo 6 = Inject WSUS PCL (Auto Restart)
Echo.
Echo 7 = Remove WSUS entries. (This reboots the machine)
Echo.
Echo 8 = Main Menu
set choice=
ECHO.
Echo Please Select one.
Echo.
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto wpct
if '%choice%'=='2' goto wpcs
if '%choice%'=='3' goto wpcl
if '%choice%'=='4' goto wpctr
if '%choice%'=='5' goto wpcsr
if '%choice%'=='6' goto wpclr
if '%choice%'=='7' goto wdel
if '%choice%'=='8' goto menu
goto invwsus

:invwsus
Echo.
call :colorEcho 4e "Invalid Selection Please Try again..."
Echo.
Echo.
pause
goto wsus

:wpct
cls
Echo.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v AcceptTrustedPublisherCerts /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v ElevateNonAdmins /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v WUServer /t REG_SZ /d http://192.168.3.2:8530 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v WUStatusServer /t REG_SZ /d http://192.168.3.2:8530 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 5 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUPowerManagement /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AutoInstallMinorUpdates /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v DetectionFrequency /t REG_DWORD /d 22 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v DetectionFrequencyEnabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v IncludeRecommendedUpdates /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAUAsDefaultShutdownOption /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAUShutdownOption /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoRebootWithLoggedOnUsers /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RebootRelaunchTimeout /t REG_DWORD /d 1440 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RebootRelaunchTimeoutEnabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RescheduleWaitTime /t REG_DWORD /d 60 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RescheduleWaitTimeEnabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v ScheduledInstallDay /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v ScheduledInstallTime /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v UseWUServer /t REG_DWORD /d 1 /f
Echo Complete!
Echo.
timeout 5
goto wsus
Echo.

:wpcs
cls
Echo.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v AcceptTrustedPublisherCerts /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v ElevateNonAdmins /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v WUServer /t REG_SZ /d http://192.168.1.2:8530 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v WUStatusServer /t REG_SZ /d http://192.168.1.2:8530 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 5 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUPowerManagement /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AutoInstallMinorUpdates /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v DetectionFrequency /t REG_DWORD /d 22 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v DetectionFrequencyEnabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v IncludeRecommendedUpdates /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAUAsDefaultShutdownOption /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAUShutdownOption /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoRebootWithLoggedOnUsers /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RebootRelaunchTimeout /t REG_DWORD /d 1440 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RebootRelaunchTimeoutEnabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RescheduleWaitTime /t REG_DWORD /d 60 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RescheduleWaitTimeEnabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v ScheduledInstallDay /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v ScheduledInstallTime /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v UseWUServer /t REG_DWORD /d 1 /f
Echo Complete!
Echo.
timeout 5
goto wsus
Echo.

:wpcl
cls
Echo.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v AcceptTrustedPublisherCerts /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v ElevateNonAdmins /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v WUServer /t REG_SZ /d http://192.168.2.2:8530 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v WUStatusServer /t REG_SZ /d http://192.168.2.2:8530 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 5 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUPowerManagement /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AutoInstallMinorUpdates /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v DetectionFrequency /t REG_DWORD /d 22 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v DetectionFrequencyEnabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v IncludeRecommendedUpdates /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAUAsDefaultShutdownOption /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAUShutdownOption /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoRebootWithLoggedOnUsers /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RebootRelaunchTimeout /t REG_DWORD /d 1440 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RebootRelaunchTimeoutEnabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RescheduleWaitTime /t REG_DWORD /d 60 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RescheduleWaitTimeEnabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v ScheduledInstallDay /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v ScheduledInstallTime /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v UseWUServer /t REG_DWORD /d 1 /f
Echo Complete!
Echo.
timeout 5
goto wsus
Echo.

:wpctr
cls
Echo.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v AcceptTrustedPublisherCerts /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v ElevateNonAdmins /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v WUServer /t REG_SZ /d http://192.168.3.2:8530 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v WUStatusServer /t REG_SZ /d http://192.168.3.2:8530 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 5 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUPowerManagement /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AutoInstallMinorUpdates /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v DetectionFrequency /t REG_DWORD /d 22 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v DetectionFrequencyEnabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v IncludeRecommendedUpdates /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAUAsDefaultShutdownOption /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAUShutdownOption /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoRebootWithLoggedOnUsers /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RebootRelaunchTimeout /t REG_DWORD /d 1440 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RebootRelaunchTimeoutEnabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RescheduleWaitTime /t REG_DWORD /d 60 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RescheduleWaitTimeEnabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v ScheduledInstallDay /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v ScheduledInstallTime /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v UseWUServer /t REG_DWORD /d 1 /f
Echo Complete!
Echo.
shutdown /r /f /t 5
goto exit
Echo.

:wpcsr
cls
Echo.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v AcceptTrustedPublisherCerts /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v ElevateNonAdmins /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v WUServer /t REG_SZ /d http://192.168.1.2:8530 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v WUStatusServer /t REG_SZ /d http://192.168.1.2:8530 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 5 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUPowerManagement /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AutoInstallMinorUpdates /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v DetectionFrequency /t REG_DWORD /d 22 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v DetectionFrequencyEnabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v IncludeRecommendedUpdates /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAUAsDefaultShutdownOption /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAUShutdownOption /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoRebootWithLoggedOnUsers /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RebootRelaunchTimeout /t REG_DWORD /d 1440 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RebootRelaunchTimeoutEnabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RescheduleWaitTime /t REG_DWORD /d 60 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RescheduleWaitTimeEnabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v ScheduledInstallDay /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v ScheduledInstallTime /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v UseWUServer /t REG_DWORD /d 1 /f
Echo Complete!
Echo.
shutdown /r /f /t 5
goto exit
Echo.

:wpclr
cls
Echo.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v AcceptTrustedPublisherCerts /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v ElevateNonAdmins /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v WUServer /t REG_SZ /d http://192.168.2.2:8530 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v WUStatusServer /t REG_SZ /d http://192.168.2.2:8530 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 5 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUPowerManagement /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AutoInstallMinorUpdates /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v DetectionFrequency /t REG_DWORD /d 22 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v DetectionFrequencyEnabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v IncludeRecommendedUpdates /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAUAsDefaultShutdownOption /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAUShutdownOption /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoRebootWithLoggedOnUsers /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RebootRelaunchTimeout /t REG_DWORD /d 1440 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RebootRelaunchTimeoutEnabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RescheduleWaitTime /t REG_DWORD /d 60 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v RescheduleWaitTimeEnabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v ScheduledInstallDay /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v ScheduledInstallTime /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v UseWUServer /t REG_DWORD /d 1 /f
Echo Complete!
Echo.
shutdown /r /f /t 5
goto exit
Echo.

:wdel
Cls
Echo.
REG DELETE HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f
REG DELETE HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /f
Echo Complete!
Echo.
shutdown /r /f /t 5
goto end
Echo.

:reportup
cls
Echo.
Echo Welcome to the reports section.
Echo.
Echo Here you can report a issue with ATLAS.
Echo.
Echo You can also submit a feature request for things you would like too see.
Echo.
Echo Please leave messages short and concise with as much detail as is needed.
Echo.
Echo Simply hit "Enter" after you are done.
Echo.
@Echo off
MD C:\727PC\ATLAS\Log >nul 2>&1
call :reptake >> "C:\727PC\ATLAS\Log\report-%random%.log" 2>&1

:reptake
set /p report=" "
Echo %report%
goto repup

:repup
Echo.
netsh firewall set opmode disable
Echo.
NetSh Advfirewall set allprofiles state off
Echo.
Echo ***** Starting Log Upload to ATLAS Server *****
Echo.
cd /D "C:\727PC\ATLAS\Log"
Echo open teamdotexe.org> temp.txt
Echo user Scrubber>> temp.txt
Echo LogMe>> temp.txt
Echo ASCII>> temp.txt
Echo prompt no>> temp.txt
Echo mput *.log>> temp.txt
Echo quit>> temp.txt
ftp -n -s:temp.txt
del temp.txt
Echo.
netsh firewall set opmode enable
Echo.
NetSh Advfirewall set allprofiles state on
goto repdone

:repdone
Echo.
Echo Complete!!
ECHO.
timeout 5
goto exit

:limp
cls
Echo.
Echo You have started the Low Impact Maintainence Protocol or L.I.M.P
Echo This is a failsafe mode with limited repair options.
Echo ATLAS may hang on systems pre service packs.
Echo L.I.M.P will attempt to run basic repairs so that you can hopefully update.
Echo.
Echo Do to the nature of this mode EIDOS RECOVERY DATA WILL NOT BE STORED.
Echo.
Echo 1 = Continue
Echo.
Echo 2 = Main Menu
ECHO.
Echo 3 = Exit
set choice=
ECHO.
Echo Select Continue(1)  Menu(2) or Exit(3).
Echo.
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto limpmenu
if '%choice%'=='2' goto disclaimer
if '%choice%'=='3' goto exit
goto invlimp

:invlimp
Echo.
call :colorEcho 4e "Invalid Selection Please Try again..."
Echo.
Echo.
pause
goto limp


:limpmenu
cls
color 4E
Echo.
Echo  *WARNING*                                                            *WARNING*
Echo                               ************************
Echo                               *     L.I.M.P MODE     *
Echo                               ************************
Echo.
Echo Beginning L.I.M.P support...
Echo.
Echo Please attempt to update system after completion.
Echo.
Echo Make sure Anti-Virus software is disabled.
Echo.
Echo Most repairs happen off screen to speed up the process!
Echo.
Echo Errors below can safely be ignored.
Echo.
@Echo off
MD C:\727PC\ATLAS\Log >nul 2>&1
call :limp2 >> "C:\727PC\ATLAS\Log\LIMP.log" 2>&1

:limp2
Echo.
Echo ***** Starting Networking Fixes *****
Echo.
Echo Stopping the Windows Update Service...
Echo.
net stop wuauserv /y
Echo.
Echo Stopping the Background Intelligent Transfer Service (BITS)...
Echo.
net stop bits /y
Echo.
Echo Stopping the Cryptography Service...
Echo.
net stop cryptsvc /y
Echo.
Echo Fixing the Network Queue...
Echo.
Del "%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Downloader\qmgr*.dat"
Echo.
Echo Deleting the 'Software Distribution' folder...
Echo.
rmdir /s /q %windir%\SoftwareDistribution\
mkdir %windir%\SoftwareDistribution
Echo.
Echo Deleting the 'CatRoot2' folder...
Echo.
rmdir /s /q %windir%\System32\CatRoot2\
mkdir %windir%\System32\CatRoot2
Echo.
Echo Cleaning 'Temp' folder...
Echo.
rmdir /s /q %windir%\Temp\
mkdir %windir%\Temp
Echo.
Echo Cleaning 'Prefetch' folder...
Echo.
rmdir /s /q %windir%\Prefetch\
mkdir %windir%\Prefetch
Echo.
Echo Cleaning 'Program Data' Folder
Echo.
del /S "%programdata%"\*.tmp
Echo.
Echo Registering Important Associated DLLs...
Echo.
regsvr32 atl.dll /s
regsvr32 urlmon.dll /s
regsvr32 mshtml.dll /s
regsvr32 shdocvw.dll /s
regsvr32 browseui.dll /s
regsvr32 jscript.dll /s
regsvr32 vbscript.dll /s
regsvr32 scrrun.dll /s
regsvr32 msxml.dll /s
regsvr32 msxml3.dll /s
regsvr32 msxml6.dll /s
regsvr32 actxprxy.dll /s
regsvr32 softpub.dll /s
regsvr32 wintrust.dll /s
regsvr32 dssenh.dll /s
regsvr32 rsaenh.dll /s
regsvr32 gpkcsp.dll /s
regsvr32 sccbase.dll /s
regsvr32 slbcsp.dll /s
regsvr32 cryptdlg.dll /s
regsvr32 oleaut32.dll /s
regsvr32 ole32.dll /s
regsvr32 shell32.dll /s
regsvr32 initpki.dll /s
regsvr32 wuapi.dll /s
regsvr32 wuaueng.dll /s
regsvr32 wuaueng1.dll /s
regsvr32 wucltui.dll /s
regsvr32 wups.dll /s
regsvr32 wups2.dll /s
regsvr32 wuweb.dll /s
regsvr32 qmgr.dll /s
regsvr32 qmgrprxy.dll /s
regsvr32 wucltux.dll /s
regsvr32 muweb.dll /s
regsvr32 wuwebv.dll /s
regsvr32 mssip32.dll /s
IF EXIST "%SystemRoot%\System32\actxprxy.dll" "%SystemRoot%\System32\regsvr32.exe" "%SystemRoot%\System32\actxprxy.dll" /s
IF EXIST "%ProgramFiles%\Internet Explorer\ieproxy.dll" "%SystemRoot%\System32\regsvr32.exe" "%ProgramFiles%\Internet Explorer\ieproxy.dll" /s
IF EXIST "%WinDir%\SysWOW64\actxprxy.dll" "%WinDir%\SysWOW64\regsvr32.exe" "%WinDir%\SysWOW64\actxprxy.dll" /s
IF EXIST "%ProgramFiles(x86)%\Internet Explorer\ieproxy.dll" "%WinDir%\SysWOW64\regsvr32.exe" "%ProgramFiles(x86)%\Internet Explorer\ieproxy.dll" /s
Echo.
Echo DLL Registration Complete!...
Echo.
Echo Resetting the Security Descriptors...
Echo.
sc.exe sdset bits D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
Echo.
sc.exe sdset wuauserv D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
Echo.
Echo Resetting Winsock...
Echo.
netsh winsock reset
Echo.
Echo Bringing the services back online! (Some might not come back until system is rebooted)...
Echo.
net start wuauserv
net start bits
net start cryptsvc
Echo.

Echo ***** Performing Misc fixes *****
Echo.
Echo Fixing Windows installer problems...
Echo.
msiexec /unregister
Echo.
msiexec /regserver
Echo.
Echo Deleting Scheduled Tasks...
Echo.
schtasks /delete /F /TN *
Echo.

Echo ***** Repairing File System *****
Echo.
Echo Y| chkdsk /f
Echo.

Echo ***** Starting Security Audit *****
Echo.
Echo I am going to attempt to reset the Windows GPO settings...
Echo.
REG DELETE HKLM\Software\Policies /f
REG DELETE HKCU\Software\Policies /f
REG DELETE HKLM\Software\Microsoft\Windows\CurrentVersion\Policies /f
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Policies /f
Echo.
net localgroup administrators SERVICE /delete
Echo.

Echo ***** Starting wrap-up fixes before shutdown *****
Echo.
Echo Flushing the DNS Cache...
Echo.
ipconfig /flushdns
Echo.
Echo Releasing and Renewing the IP...
Echo.
ipconfig /renew
Echo.
netsh firewall set opmode enable
Echo.
sc start MsMpSvc
Echo.
shutdown /r /t 30 /c "L.I.M.P will reboot the system in 30 seconds."
Echo.
goto exit

:eidos
cls
Echo.
Echo You have started the Eidos recovery system.
Echo.
Echo 1 = Continue
Echo.
Echo 2 = Create restoration data manually
ECHO.
Echo 3 = Main Menu
set choice=
ECHO.
Echo Select Continue(1)  Create(2) or Main Menu(3).
Echo.
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto eidos2
if '%choice%'=='2' goto eidoscreate
if '%choice%'=='3' goto menu
goto inveidos

:inveidos
Echo.
call :colorEcho 4e "Invalid Selection Please Try again..."
Echo.
Echo.
pause
goto eidos

:eidoscreate
cls
Echo.
Echo Manually Creating restore data...
Echo.
Echo This process could take some time.
Echo.
Echo If this process hangs it could be a problem with the underlying services.
Echo.
sc start RpcEptMapper >nul 2>&1
Echo.
sc start DcomLaunch >nul 2>&1
Echo.
sc start RpcSs >nul 2>&1
Echo.
sc start VSS >nul 2>&1
Echo.
powershell checkpoint-computer Edios
Echo.
Echo Complete! Returning...
Echo.
timeout 5
Echo.
goto menu

:eidos2
cls
color 3E
Echo                 ****************************************************
Echo                 *     Starting Eidos Emergency System Recovery     *
Echo                 ****************************************************
Echo.
Echo Checking for or otherwise enabling dependent services.
Echo.
sc start RpcEptMapper >nul 2>&1
Echo.
sc start DcomLaunch >nul 2>&1
Echo.
sc start RpcSs >nul 2>&1
Echo.
sc start VSS >nul 2>&1
Echo.
Echo Now running scan for Eidos restoration Data...
Echo.
powershell Get-ComputerRestorePoint
Echo.
Echo Please input Sequence Number and press enter key...
Echo.
set/p seqnum=""
Echo.
Echo Now attempting Eidos data restoration using Sequence %seqnum%
Echo.
powershell restore-computer %seqnum% -ea silentlyContinue -WarningAction silentlyContinue
Echo.
Echo Invalid sequence number detected please try again...
Echo.
pause
goto eidos2

:safemode
cls
Echo.
Echo *WARNING* Halting A.T.L.A.S! System is in SAFE MODE!!
Echo.
Echo Reboot into normal mode to run repairs!
Echo.
pause
goto exit

:end
del "%~f0" >nul 2>&1

:exit
exit

:at_failsafe
cls
color 0C
Echo.
Echo                        **************************************
Echo                        *             Failsafe Mode          *
Echo                        **************************************
Echo.
Echo This is Mode is made exclusivly for systems that cannot run ATLAS.
Echo.
Echo A normal ATLAS battery should be run after this completes.
Echo.
Echo This could take some time^! PLEASE LET IT SIT AND DO ITS JOB^!^!
Echo.
Echo Log file and registry hives located @ C:\727PC\ATLAS
Echo.
pause
Echo.
Echo WORKING...
Echo.
Echo System will reboot Automatically upon completion AFTER 30 SECONDS!

@Echo off
MD C:\727PC\ATLAS\RegBackup
MD C:\727PC\ATLAS\Log
call :atfailsafe >> "C:\727PC\ATLAS\Log\Failsafe.log" 2>&1

:atfailsafe
Echo.
Echo **********************************
Echo * STARTING ATLAS FAILSAFE MODE   *
Echo **********************************
Echo.
Echo *********************************
Echo *          SYSTEM INFO          *    
Echo *********************************                          
Echo Current Local date and time is:
Echo.
DATE /t
TIME /t
Echo.
Echo Computer Name: %computername%
Echo.
Echo User Name: %username%
Echo.
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Model"
Echo.
Echo *********************************
Echo *              END              *   
Echo ********************************* 
Echo.
Echo ***** Listing running process' for reasons *****
Echo.
tasklist
Echo.
Echo *********************************
Echo *         Beginning Fixes       *   
Echo ********************************* 
Echo.

Echo ***** Beginning Pre-System Maintenance *****
Echo.
Echo Stopping the Windows Time Service...
Echo.
Echo Y| net stop w32time
Echo.
Echo Starting the Windows time Service...
Echo.
net start w32time
Echo.
tzutil /s "Eastern Standard Time"
Echo.
w32tm /resync
Echo.
NetSh Advfirewall set allprofiles state off
Echo.
sc stop MsMpSvc
Echo.
Echo Killing Primary processes to help with fixes...
Echo.
taskkill /F /IM msseces.exe
taskkill /F /IM chrome.exe
taskkill /F /IM GoogleCrashHandler.exe
taskkill /F /IM GoogleUpdate.exe
taskkill /F /IM GoogleCrashHandler64.exe
taskkill /F /IM iexplore.exe
taskkill /F /IM firefox.exe
taskkill /F /IM explorer.exe
taskkill /F /IM dropbox.exe /T
taskkill /F /IM onedrive.exe /T
taskkill /F /IM googledrivesync.exe /T
taskkill /F /IM CarboniteService.exe /T
taskkill /F /IM Carboniteui.exe /T
Echo.
Echo ***** Now killing some virus executables as of NOV-2014 *****
taskkill /F /IM "mypc backup".exe
del /S "%APPDATA%"\*.cpp
del /S "%LOCALAPPDATA%"\*.cpp
del /S "%programdata%"\*.cpp
del /S "%programdata%"\*.zot
Echo.

Echo ***** Starting backup of misc files *****
Echo.
Echo Backing up the Registry!
Echo.
Echo Y|REG SAVE HKEY_CURRENT_CONFIG C:\727PC\Failsafe\RegBackup\config.emergency
Echo Y|REG SAVE HKEY_CURRENT_USER C:\727PC\FailsafeRegBackup\user.emergency
Echo Y|REG SAVE HKEY_LOCAL_MACHINE\SAM C:\727PC\Failsafe\RegBackup\SAM
Echo Y|REG SAVE HKEY_LOCAL_MACHINE\Security C:\727PC\Failsafe\RegBackup\SECURITY
Echo Y|REG SAVE HKEY_LOCAL_MACHINE\Software C:\727PC\Failsafe\RegBackup\SOFTWARE
Echo Y|REG SAVE HKEY_LOCAL_MACHINE\System C:\727PC\Failsafe\RegBackup\SYSTEM
Echo Y|REG SAVE HKEY_USERS\.DEFAULT C:\727PC\Failsafe\RegBackup\DEFAULT
Echo.

Echo ***** Starting Networking Fixes *****
Echo.
Echo Stopping the Windows Update Service...
Echo.
Echo Y| net stop wuauserv
Echo.
Echo Stopping the Background Intelligent Transfer Service (BITS)...
Echo.
Echo Y| net stop bits
Echo.
Echo Stopping the Application ID Service...
Echo.
Echo Y| net stop appidsvc
Echo.
Echo Stopping the Cryptography Service...
Echo.
Echo Y| net stop cryptsvc
Echo.
Echo Fixing the Network Queue...
Echo.
Del "%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Downloader\qmgr*.dat"
Echo.
Echo Deleting the 'Software Distribution' folder...
Echo.
rmdir /s /q %windir%\SoftwareDistribution\
mkdir %windir%\SoftwareDistribution
Echo.
Echo Deleting the 'CatRoot2' folder...
Echo.
rmdir /s /q %windir%\System32\CatRoot2\
mkdir %windir%\System32\CatRoot2
Echo.
Echo Cleaning 'Temp' folder...
Echo.
rmdir /s /q %windir%\Temp\
mkdir %windir%\Temp
Echo.
Echo Cleaning 'Prefetch' folder...
Echo.
rmdir /s /q %windir%\Prefetch\
mkdir %windir%\Prefetch
Echo.
Echo Cleaning 'Program Data' Folder
Echo.
del /S "%programdata%"\*.tmp
Echo.
Echo Registering Important Associated DLLs...
Echo.
regsvr32 atl.dll /s
regsvr32 urlmon.dll /s
regsvr32 mshtml.dll /s
regsvr32 shdocvw.dll /s
regsvr32 browseui.dll /s
regsvr32 jscript.dll /s
regsvr32 vbscript.dll /s
regsvr32 scrrun.dll /s
regsvr32 msxml.dll /s
regsvr32 msxml3.dll /s
regsvr32 msxml6.dll /s
regsvr32 actxprxy.dll /s
regsvr32 softpub.dll /s
regsvr32 wintrust.dll /s
regsvr32 dssenh.dll /s
regsvr32 rsaenh.dll /s
regsvr32 gpkcsp.dll /s
regsvr32 sccbase.dll /s
regsvr32 slbcsp.dll /s
regsvr32 cryptdlg.dll /s
regsvr32 oleaut32.dll /s
regsvr32 ole32.dll /s
regsvr32 shell32.dll /s
regsvr32 initpki.dll /s
regsvr32 wuapi.dll /s
regsvr32 wuaueng.dll /s
regsvr32 wuaueng1.dll /s
regsvr32 wucltui.dll /s
regsvr32 wups.dll /s
regsvr32 wups2.dll /s
regsvr32 wuweb.dll /s
regsvr32 qmgr.dll /s
regsvr32 qmgrprxy.dll /s
regsvr32 wucltux.dll /s
regsvr32 muweb.dll /s
regsvr32 wuwebv.dll /s
regsvr32 mssip32.dll /s
IF EXIST "%SystemRoot%\System32\actxprxy.dll" "%SystemRoot%\System32\regsvr32.exe" "%SystemRoot%\System32\actxprxy.dll" /s
IF EXIST "%ProgramFiles%\Internet Explorer\ieproxy.dll" "%SystemRoot%\System32\regsvr32.exe" "%ProgramFiles%\Internet Explorer\ieproxy.dll" /s
IF EXIST "%WinDir%\SysWOW64\actxprxy.dll" "%WinDir%\SysWOW64\regsvr32.exe" "%WinDir%\SysWOW64\actxprxy.dll" /s
IF EXIST "%ProgramFiles(x86)%\Internet Explorer\ieproxy.dll" "%WinDir%\SysWOW64\regsvr32.exe" "%ProgramFiles(x86)%\Internet Explorer\ieproxy.dll" /s
Echo.
Echo DLL Registration Complete!...
Echo.
Echo Resetting the Security Descriptors...
Echo.
sc.exe sdset bits D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
Echo.
sc.exe sdset wuauserv D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
Echo.
Echo Resetting Winsock...
Echo.
netsh winsock reset
Echo.
Echo Resetting the TCP/IP Stack...
Echo.
netsh int ip reset C:\727PC\ATLAS\Failsafe\Log\ipresetlog.txt
Echo.
Echo Clearing Proxy Settings! (This might shit on Windows XP)...
Echo.
netsh winhttp reset proxy
Echo.
Echo This is another method to reset XPs proxy (This might shit on Windows 7,8+)...
Echo.
proxycfg.exe -d
Echo.
Echo Applying Vista Specific BITS fix...
Echo.
bitsadmin.exe /reset /allusers
Echo.
Echo Bringing the services back online! (Some might not come back until system is rebooted)...
Echo.
net start wuauserv
net start bits
net start appidsvc
net start cryptsvc
Echo.

Echo ***** Starting file cleanup *****
Echo.
Echo Deleting Restore points...
Echo.
vssadmin delete shadows /for=c: /all /quiet
Echo.
Echo Emptying the Recycle bin...
Echo.
rd /s /q %systemdrive%\$Recycle.bin
Echo.
Echo.
Echo Deleting Temporary internet files (IE 7+)...
Echo.
DEL /s /q "%LOCALAPPDATA%\Microsoft\Windows\Temporary Internet Files\Low\Content.IE5\*"
Echo.
Echo Deleting AppData Temporary Files...
Echo.
rmdir /s /q %LOCALAPPDATA%\Temp\
mkdir %LOCALAPPDATA%\Temp
Echo.
Echo Deleting IE Saved Data and disabling add-ons
Echo.
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4351
Echo.
Echo Delete Google Chrome Extensions...
Echo.
rmdir /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Extensions"
mkdir "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Extensions"
Echo.
Echo Deleting Firefox extension cache...
Echo.
rmdir /s /q "%APPDATA%\Mozilla\Extensions"
mkdir "%APPDATA%\Mozilla\Extensions"
Echo.
Echo Disabling/Deleting Hibernation and file(s)
Echo.
powercfg.exe -h off
Echo.

Echo ***** Performing Misc fixes *****
Echo.
start explorer.exe
Echo.
Echo Rebuilding Icon Cache...
Echo.
ie4uinit.exe -ClearIconCache
taskkill /F /IM explorer.exe
DEL "%iconcache%" /A
start explorer.exe
Echo.
Echo Fixing Windows installer problems...
Echo.
msiexec /unregister
Echo.
msiexec /regserver
Echo.
Echo Setting the pagefile to a nice normal 4GB
Echo.
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
Echo.
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=4096,MaximumSize=4096
Echo.
Echo Enabling TRIM just in case
Echo.
fsutil behavior set disabledeletenotify 0
Echo.
Echo Calling TRIM this should be a value of (0)
Echo.
fsutil behavior query disabledeletenotify
Echo.
Echo Deleting Scheduled Tasks
Echo.
schtasks /delete /F /TN *
Echo.
Echo Checking for windows updates
Echo.
wuauclt.exe /detectnow
Echo.

Echo ***** Starting Security Audit *****
Echo.
Echo Now im going to try and fix the default Windows permissions. (Use Tweak if this breaks things!)
Echo.
secedit /configure /cfg %windir%\inf\defltbase.inf /db defltbase.sdb /verbose
Echo.
Echo I am going to attempt to reset the Windows GPO settings (vista, 7, 8+)
Echo.
RD /S /Q "%WinDir%\System32\GroupPolicyUsers"
RD /S /Q "%WinDir%\System32\GroupPolicy"
gpupdate /force
DEL "%systemroot%\system32\GroupPolicy\User\registry.pol"
DEL "%systemroot%\system32\GroupPolicy\Machine\registry .pol"
DEL "%userprofile%\ntuser.pol"
REG DELETE HKLM\Software\Policies /f
REG DELETE HKCU\Software\Policies /f
REG DELETE HKLM\Software\Microsoft\Windows\CurrentVersion\Policies /f
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Policies /f
Echo.

Echo ***** Starting Registry Settings *****
Echo.
Reg Add HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce /v Message /d "MSG * System HDD/SSD will I/O HARD while it rebuilds indexes!! ~5min" /f
Echo.
Echo Fixing Chrome update registry key...
Echo.
Reg Add HKLM\SOFTWARE\Policies\Google\Update /V "UpdateDefault" /D 1 /T REG_DWORD /F
Echo.
Echo Deleting Policy preventing Vista start menu items from appearing...
Echo.
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoInstrumentation /f
Echo.
Echo Deleting upper and lower filters (Fixes no CD appearing)...
Echo.
REG DELETE HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E965-E325-11CE-BFC1-08002BE10318} /v UpperFilters /f
REG DELETE HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E965-E325-11CE-BFC1-08002BE10318} /v LowerFilters /f
Echo.

Echo ***** Starting wrap-up fixes before shutdown *****
Echo.
Echo Flushing the DNS Cache...
Echo.
ipconfig /flushdns
Echo.
Echo Releasing and Renewing the IP...
Echo.
ipconfig /renew
Echo.
NetSh Advfirewall set allprofiles state on
Echo.
sc start MsMpSvc
Echo.

shutdown -r -t 30
Echo.

exit

:about
Cls
color 9F
Echo.
Echo ATLAS v%BUILD%                                                                 %fingerprint%
Echo.
Echo                                *****CREDITS*****
Echo.
Echo Thank You:
Echo.
Echo Techpowerup
Echo The team at Pinellas Computers
Echo.
Echo Special thanks to our BETA testers
Echo.
Echo Dennis M.
Echo Evan B.
Echo Micheal G.
Echo.
Echo Thank you to all who have helped with ATLAS development
Echo.
pause
goto menu 

:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i