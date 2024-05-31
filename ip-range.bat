@echo off 
setlocal enabledelayedexpansion
:start
set pings=255
set ping_batch=10
:Y
for /f "tokens=2 delims=:(" %%i in ('ipconfig /all ^| find "IPv4"') do for /f "tokens=1,2,3 delims=. " %%a in ("%%i") do echo %%a.%%b.%%c|findstr /r "^[0-9]*[.][0-9]*[.][0-9]*$" >NUL&&set prefix_range=%%a.%%b.%%c
:input
del "%TMP%\xxZhPuG.online._.*.txt" 1>NUL 2>NUL
del "%TMP%\xxZhPuG.online.ip.*.txt" 2>NUL
cls
title Main Ping Script
echo:                                        
echo:................                          + i::o::p
echo:Press S to scan                           %pings% :::::
echo:------ --------                           - j:k:l
echo:                                                          
choice /c s0ijokpl  /n 
if %errorlevel%==3 set /a pings +=25
if %errorlevel%==4 set /a pings -=25
if %errorlevel%==5 set /a pings +=12
if %errorlevel%==6 set /a pings -=12
if %errorlevel%==7 set /a pings +=2
if %errorlevel%==8 set /a pings -=2
if %pings% GEQ 255 set pings=254
if %pings% LSS 1 set pings=1
if %errorlevel%==1 goto scan
cls
goto input
:get_mac.py
color 2
title Ping...
cls
if not exist get_mac.py set check_repository=1&set file_not_exist= get_mac.py&goto display_macadd_ismissing
for /f "tokens=*" %%i in ('where python 2^>NUL') do set python_path=%%i
echo "%python_path%" |findstr /r "[\\]" >NUL&&(echo:..Python path found.."%python_path%"..) || (set check_repository=0&echo:&echo:Python not found!&set install_python=1&set file_not_exist=     python&goto display_macadd_ismissing)
color 7
echo:Running get_mac.py..&echo:
if exist xxZhPuG1000.arp.LOGBOOK.BOOK.print_troubleshoot_from_github.txt del xxZhPuG1000.arp.LOGBOOK.BOOK.print_troubleshoot_from_github.txt
del xxZhPuG1000.arp.list.txt 2>NUL
python get_mac.py
echo:---
for /f "tokens=*" %%a in ('type xxZhPuG1000.arp.LOGBOOK.BOOK.print_troubleshoot_from_github.txt') do set file_ip_found=1
if "%file_ip_found%" NEQ "1" echo: No results found.
if "%file_ip_found%" == "1" type xxZhPuG1000.arp.LOGBOOK.BOOK.print_troubleshoot_from_github.txt
echo:---
echo:
echo:Press a key to start mac address to name mapping..
color 7
pause >NUL
cls
if not exist mac_add.print_troubleshoot_from_github echo:&echo:Unable to map mac address to name&echo:File `mac_add.print_troubleshoot_from_github` is missing & timeout 3 >NUL
if not exist mac_add.print_troubleshoot_from_github set check_repository=1&set file_not_exist=mac_add.print_troubleshoot_from_github&goto display_macadd_ismissing
echo|set/p=>xxZhPuG1000.python.print_troubleshoot_from_github.txt
for /f "tokens=1,2 delims= " %%i in ('type xxZhPuG1000.arp.LOGBOOK.BOOK.print_troubleshoot_from_github.txt') do for /f "tokens=3 delims=," %%a in ('type mac_add.print_troubleshoot_from_github ^| find /i "%%j"') do echo %%i %%j "%%a" >> xxZhPuG1000.python.print_troubleshoot_from_github.txt

for /f "tokens=1,2 delims= " %%i in ('type xxZhPuG1000.arp.LOGBOOK.BOOK.print_troubleshoot_from_github.txt') do type xxZhPuG1000.python.print_troubleshoot_from_github.txt | find "%%i"&&echo: || echo:%%i %%j Randomised Mac address#>> xxZhPuG1000.python.print_troubleshoot_from_github.txt
timeout 1 >NUL
cls
echo:Results
echo:======
type xxZhPuG1000.python.print_troubleshoot_from_github.txt
echo:#Suspected
echo:
del xxZhPuG1000.arp.LOGBOOK.BOOK.print_troubleshoot_from_github 2>NUL
pause
for /l %%i in (1,1,5) do pause >NUl
goto input
:scan
call :flash ca
cls
title Pinger ... 
echo:                       
if not defined PREFIX_RANGE goto enter_subnet
echo:           -----------------------------------
echo:            S to Scan
echo:            E to Edit Subnet = %prefix_range%
echo:          ------------------------------------
choice /c se /m "" /n
if %errorlevel%==1 goto loop
:enter_subnet
cls
echo:press /enter\ for the default value
echo:..
set PREFIX_RANGE=
echo: Enter Subnet
set /p PREFIX_RANGE=Subnet X.X.X:
if "%PREFIX_RANGE%"=="" set PREFIX_RANGE=192.168.1
for /f %%i in ('powershell -c "'%PREFIX_RANGE%' -match '^\d{0,1}\d{0,1}\d{0,1}[.]\d{0,1}\d{0,1}\d{0,1}\.\d{0,1}\d{0,1}\d{0,1}$'"') do set state=%%i
if "%state%"=="False"  powershell -c "write-host -nonewline TRY AGAIN!`r"&TIMEOUT 1 >nul & goto :enter_subnet
ECHO:
:loop
timeout 1 >NUL
cls
echo:
echo:
echo:
echo:GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * 
echo:GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * 
echo:GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * 
echo:GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * 
echo:GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * 
echo:GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * 
echo:GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * 
echo:GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * 
echo:GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * 
echo:GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * 
echo:GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * 
echo:GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * 
echo:GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * 
echo:GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * GOGI TECH * 
                       



set ping_no=1
echo|set/p=>"%TMP%\xxZhPuG.progress.mac_cat.txt"
ECHO:

del "%TMP%\xxZhPuG.online.ip.*.txt" 2>NUL
title Main Window: Pinger
set skip_count=0
set found_ip=
set present=%pings%
set found=0
set /a division=ping_batch*10000/pings
set clearcounter=0
set percent=0
:there
set /a clearcounter+=1
set /a clearcountermodulus=clearcounter %% 20
set /a updatevariable=clearcounter %% 2
set /a absent=present-ping_batch
set /a ping_batch_var=ping_batch*clearcounter
if %absent% LSS 0 set absent=0
for /l %%i in (%absent%,1,%present%) do start /min cmd /c "title xGUHHEJ-Ping_WINDOW&PING -n %ping_no% %PREFIX_RANGE%.%%i | findstr /i "[^<=^>][0-9]*ms"&&echo|set/p=%prefix_range%.%%i>"%TMP%\xxZhPuG.online.ip.%%i.txt"&echo|set/p=>"%TMP%\xxZhPuG.online._.%%i.txt""
for /f "tokens=1" %%i in ('dir "%TMP%\xxZhPuG.online._.*.txt" ^| find "File(s)"') do set pings_actual=%%i&set begun=0&cls & echo %date%%time%  & echo:&echo:Sending pings to Ip s : %PREFIX_RANGE%.%absent%-%present% &  echo:Pings Requested: %ping_batch_var%&echo:Pings Actualized:%%i
if %found% GEQ 1 echo:&echo FOUND&echo:[92mX[0m%found_ip%[92mX[0m&echo:&echo I.P(s) found = %skip_count%
if %updatevariable% == 1 call :update_screen
if not defined begun cls&echo %date%%time%   & echo:&echo:Pinging to Ip  : %PREFIX_RANGE%.%absent%-%present% &  echo:&echo spawning ping Windows ...
set test_ip=0
if %skip_count% GEQ 1 for /f "skip=%skip_count% delims=" %%i in ('dir /b /od "%TMP%\xxZhPuG.online.ip.*.txt" 2^>NUL') do for /f "delims=" %%a in ('type "%TMP%\%%i"') do set /a skip_count+=1&call :setfound %%a
if %skip_count% == 0 for /f "delims=" %%i in ('dir /b "%TMP%\xxZhPuG.online.ip.*.txt" 2^>NUL') do  for /f "delims=" %%a in ('type "%TMP%\%%i" 2^>NUL') do set /a skip_count+=1&call :setfound %%a
set /a present=absent
echo:
goto skip_ip
:update_screen
set /a percentage=pings_actual*100/pings
set var=Main Window: Pinger Zzz:..pings sent.                       ++++ + + + +++ %percentage% %%
REM set var=!var:~0,%percentage%!
title !var!
exit /b
:setfound
set /a found+=1
if %skip_count% NEQ 2500 echo:FOUND %~1
set found_ip=%found_ip% %~1,
exit /b
:update_screen_display
for /f "delims=" %%i in ('type "%TMP%\xxZhPuG.progress.mac_cat.txt" 2^>NUL') do set begun=0&cls & echo %date%%time%  & echo:&echo:Sending pings to Ip s : %PREFIX_RANGE%.%absent%-%present% &  echo:&echo  %%i
if %found% GEQ 1 echo:&echo FOUND&echo:[92mX[0m%found_ip%[92mX[0m&echo:&echo I.P(s) found = %skip_count%
exit /b
:set_batch_size
echo:Press S to Save
choice /c ijS /m "+i -j ping batch size:(%ping_batch%)" /n
if %errorlevel%==1 set /a ping_batch+=3
if %errorlevel%==2 set /a ping_batch-=2
if %errorlevel%==3 exit /b
if %ping_batch% GTR 20 set ping_batch=20
if %ping_batch% LSS 1 set ping_batch=1
goto set_batch_size
:skip_ip

echo:
if %absent% == 0 goto wait
if %present% GTR 0 set /a absent=present-5
if %present% GEQ 0 goto there
:wait
if "%percentage%" NEQ "complete" echo:&echo:Variables have stopped Updateing&title Main Window: Pinger Zzz:. %progress% pings sent.                         ++++ + + + +++ Complete

if %skip_count% GEQ 1 for /f "skip=%skip_count% delims=" %%i in ('dir /b /od "%TMP%\xxZhPuG.online.ip.*.txt" 2^>NUL') do for /f "delims=" %%a in ('type "%TMP%\%%i"') do set /a skip_count+=1&call :setfound %%a
if %skip_count% == 0 for /f "delims=" %%i in ('dir /b "%TMP%\xxZhPuG.online.ip.*.txt" 2^>NUL') do  for /f "delims=" %%a in ('type "%TMP%\%%i"') do set /a skip_count+=1&call :setfound %%a
timeout 1 >NUL
set /a rund+=1
if %rund%==3 echo:Waiting for All ping Windows to complete and close....&set /a rund=0
if not defined dontholdon if %rund%==4 echo:Waiting for the final result,&set dontholdon=0
tasklist /fi "windowtitle eq xGUHHEJ-Ping_WINDOW*"|find /i "cmd.exe" >NUL&&goto wait || echo: >NUL
del "%TMP%\xxZhPuG.online._.*.txt" 1>NUL 2>NUL

:ping
:ping_only
set repeat=0
:repeat
set ip_online_disclaimer=
set /a repeat+=1
set initial_messages=0
:choose_ping
:testing
set /a initial_messages+=1
:set_repeat_count
set found_ip=
set skip_count=2500
for /f "delims=" %%i in ('dir /b "%TMP%\xxZhPuG.online.ip.*.txt" 2^>NUL') do  for /f "delims=" %%a in ('type "%TMP%\%%i"') do call :setfound %%a
echo:
echo:List of i.p. addresses online#%ip_online_disclaimer%
set found_ip=%found_ip: =%
echo:---
powershell -c "$ipString = \"%found_ip%\";$ipAddresses = $ipString -split ',\s*';function Get-LastOctet { param ( [string]$ip ) return [int]($ip.Split('.')[3]) };$sortedIpAddresses = $ipAddresses | Sort-Object { Get-LastOctet $_ };$sortedIpAddresses;" 2>NUL
if  %ERRORLEVEL% neq 0 for %%a in (%found_ip%) do echo %%a 
echo:--- 
echo:#means, found in the network
echo:
REM goto testing
:input_file_name

set /p input_file_name=Enter file name to save:
echo Press a key to save !input_file_name!.txt
pause >NUL
(if exist "!input_file_name!.txt" echo: File name already exists.&pause&goto input) 
for /f "tokens=*" %%i in ("%input_file_name%") do if "%%i" NEQ "" echo WRITING to FILE...&powershell -c "$ipString = \"%found_ip%\";$ipAddresses = $ipString -split ',\s*';function Get-LastOctet { param ( [string]$ip ) return [int]($ip.Split('.')[3]) };$sortedIpAddresses = $ipAddresses ^| Sort-Object { Get-LastOctet $_ };$sortedIpAddresses ^| Out-File -FilePath \"!input_file_name!.txt\" -Encoding utf8;" 2>NUL & for /f "tokens=*" %%a in ('whoami') do echo:>>"%%i.txt"&echo:==============>>"%%i.txt"&echo:Generated on: %date% %time% by %%a>>"%%i.txt"&echo:==============>>"%%i.txt"
del "%TMP%\xxZhPuG.online.ip.*.txt" 2>NUL
goto input
choice /c Pabcdefghijklmnoqrstuvwxyz0123456789 /m "Press P to ping a list:"
if %errorlevel% NEQ 1 goto input
:ping_list
echo:paste the list here
echo:Then, Write `ping` to start pinging..
for /l %%i in (1,1,200) do CALL set /p name%%i=&CALL :checkname %%i&if "!temp!"=="ping" set temp=%%i&goto strtpng
goto :eof
:strtpng
echo **********************************************
echo beginning pings................
echo ((((((((((((((((((((((((((((((((((((((((((((((
echo:
echo:
for /l %%i in (1,1,!temp!) do CALL CALL :ping_param %%name%%i%%
:checkname
CALL set temp=%%name%1%%
exit /b
:ping_param
set temp_ping_name=%1
set temp_ping_name=!temp_ping_name: =!
if "!temp_ping_name!"=="ping" echo End--&PAUSE&goto :eof
echo !temp_ping_name!|findstr /r "[0-9]*[.][0-9]*[.][0-9]*[.][0-9]*"&&(echo pinging ..&ping -n 1 !temp_ping_name!&echo:&echo:-------press a key to continue pinging--------&pause >NUL)
echo:
exit /b
pause
if exist xxZhPuG1000.path.LOGBOOK.BOOK.print_troubleshoot_from_github.txt set arp_done=0&echo:Would u like to ping these devices found in the logbook? Press N to skip
if exist xxZhPuG1000.path.LOGBOOK.BOOK.print_troubleshoot_from_github.txt choice /c Nabcdefghijklmopqrstuvwxyz0123456789 /m "Press any (letter/number) key to continue to ping.." /n
if not exist xxZhPuG1000.path.LOGBOOK.BOOK.print_troubleshoot_from_github.txt goto print_ip_lists
if exist xxZhPuG1000.path.LOGBOOK.BOOK.print_troubleshoot_from_github.txt if %errorlevel% == 1 goto skip_ping
echo:
echo:Pinging IP Addresses...  
set file_contents=0
start cmd /c "echo off & cls & mode 30,20 & color 20 & (for /f "delims=" %%i in (xxZhPuG1000.path.LOGBOOK.BOOK.print_troubleshoot_from_github.txt) do ping -n 1 %%i | find /i "TTL" >NUL&&echo %%i is up || echo pinging.... %%i [trying])&pause"
goto choose_ping
for /f "delims=" %%i in (xxZhPuG1000.path.LOGBOOK.BOOK.print_troubleshoot_from_github.txt) do set file_contents=0&echo:&echo:trying to ping %%i&echo:&ping -n 1 %%i | find /i "TTL"&&call :color || call :offset
if %file_contents%==1 echo: File (log file) empty.&echo:&echo:Run a scan to get started.&echo:
goto choose_ping
:skip_ping
:arp-a
echo:
(set arp_done=0)&echo:Press Y for arp -a mac address name mapping.....
choice /c Yabcdefghijklmnopqrstuvwxz0123456789 /m "Press any (letter/number) key to skip.." /n
if %errorlevel% NEQ 1 goto print_ip_lists
echo:
echo|set/p= > xxZhPuG1000.arp.LOGBOOK.BOOK.print_troubleshoot_from_github.txt

(arp -a | findstr /r "[a-z0-9][a-z0-9][-][a-z0-9][a-z0-9][-][a-z0-9][a-z0-9][-]" > xxZhPuG1000.arp.LOGBOOK.BOOK.print_troubleshoot_from_github.txt)&(set arp_done=1)
copy xxZhPuG1000.arp.LOGBOOK.BOOK.print_troubleshoot_from_github.txt xxZhPuG1000.arp.list.txt /Y
goto next
:trim_mac
set ip_=%1
set mac_=%2
echo Processing ... %ip_% %mac_%
set mac_=%mac_:-=%
set mac_=%mac_:~0,6%
for /f "tokens=*" %%i in ('type  mac_add.print_troubleshoot_from_github ^| find /i "%mac_%"') do for /f "tokens=3 delims=," %%f in ("%%i") do echo %ip_% "%%f" >> PRINTER.Arp_get.LOGBOOK.BOOK.print_troubleshoot_from_github.txt
Exit /B
:color
title Pinging..
echo:[92mX[0monline[92mX[0m
Exit /B
:offset
echo:ZZz.offline.zZZ
Exit /b
:next
title xxZhPuG1000.arp.LOGBOOK.BOOK.print_troubleshoot_from_github.txt
if not exist mac_add.print_troubleshoot_from_github echo ! File missing (mac_add.print_troubleshoot_from_github) ! & echo: & timeout 3
for /f "tokens=1,2" %%i in (xxZhPuG1000.arp.LOGBOOK.BOOK.print_troubleshoot_from_github.txt) do call :trim_mac %%i %%j
move /Y PRINTER.Arp_get.LOGBOOK.BOOK.print_troubleshoot_from_github.txt  xxZhPuG1000.arp.LOGBOOK.BOOK.print_troubleshoot_from_github.txt
@echo on & cls
@echo off 
:print_ip_lists
type xxZhPuG1000.path.LOGBOOK.BOOK.print_troubleshoot_from_github.txt 1>NUL 2>NUL
echo:
echo:
if %errorlevel% == 0 echo:List of i.p. addresses online# (from Last Scan)
if %errorlevel% NEQ 0 echo:
if %errorlevel% == 0 echo:---
type xxZhPuG1000.path.LOGBOOK.BOOK.print_troubleshoot_from_github.txt 2>NUL
if %errorlevel% == 0 echo:--- 
if %errorlevel% == 0 echo:#means, found in the network
echo:
echo:
if exist xxZhPuG1000.arp.LOGBOOK.BOOK.print_troubleshoot_from_github.txt if %arp_done%==0 echo:List of device names using arp -a command [old results] 
if exist xxZhPuG1000.arp.LOGBOOK.BOOK.print_troubleshoot_from_github.txt if %arp_done%==1 echo:List of device names using arp -a command
if exist xxZhPuG1000.arp.LOGBOOK.BOOK.print_troubleshoot_from_github.txt type xxZhPuG1000.arp.LOGBOOK.BOOK.print_troubleshoot_from_github.txt&&title Result
echo: 
if exist xxZhPuG1000.arp.LOGBOOK.BOOK.print_troubleshoot_from_github.txt echo:---
echo:
echo:
if exist xxZhPuG1000.arp.LOGBOOK.BOOK.print_troubleshoot_from_github.txt pause
goto input
:restart-spooler
if not exist restart_spooler.bat cls&echo 'restart_spooler.bat' file is missing & set file_not_exist=       file&goto display_macadd_ismissing
echo Set objShell = CreateObject("Shell.Application") >LOG.ip.scan.xxxxxxxxxx0931092.vbs
echo Set FSO = CreateObject("Scripting.FileSystemObject") >>LOG.ip.scan.xxxxxxxxxx0931092.vbs
echo objShell.ShellExecute "cmd", "/c " ^& Chr(34) ^& "cd %cd% & restart_spooler.bat" ^& Chr(34) , "", "runas" >>LOG.ip.scan.xxxxxxxxxx0931092.vbs
wscript "LOG.ip.scan.xxxxxxxxxx0931092.vbs"
del LOG.ip.scan.xxxxxxxxxx0931092.vbs
echo: 
pause
goto input
:flash
color %1
echo:
ping -n 1 localhost >NUL
color 7
exit /b
:display_macadd_ismissing
title %file_not_exist% is missing ! See repository
echo:
if "%mac_add%"=="1" echo:File name: mac_add.print_troubleshoot_from_github
echo:
echo:
echo:
echo:                          _________________________
echo:                        ^|                         ^|
echo:                        ^|  %file_not_exist% is         ^|
echo:                        ^|         missing !       ^|
echo:                        ^|_________________________^|
echo:
echo:                               i use this file !!
echo:
echo:
echo:
if "%check_repository%"=="1" echo:Check repository.
if "%install_python%"=="1" choice /m "Try to Install python?"
if "%install_python%"=="1" if %errorlevel%==2 goto paused
if "%install_python%"=="1" echo:&echo:Trying to install using winget..
if "%install_python%"=="1" timeout 1 >nul
if "%install_python%"=="1" winget install  python & echo:&PAUSE
if "%install_python%"=="1" goto input
echo:
:paused
pause
