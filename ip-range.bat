@echo off
mode 40,20
color 1F

:Y
for /f "tokens=2 delims=:(" %%i in ('ipconfig /all ^| find "IPv4"') do for /f "tokens=1,2,3 delims=. " %%a in ("%%i") do echo %%a.%%b.%%c|findstr /r "^[0-9]*[.][0-9]*[.][0-9]*$" >NUL&&set sample_ip=(Guess? Press Enter %%a.%%b.%%c)
:input
mode 60,40
color 7
cls
title Main Ping Script
echo:
echo:................
echo:Press S to scan
echo:------ --------
echo:
choice /c sp  /n 

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
color c0
cls
title Pinger ... 
echo: 
echo:   press {enter} for the default values.                       
echo:..

echo:
set PREFIX_RANGE=
echo: WHAT
color 7
set /p PREFIX_RANGE=Subnet %sample_ip%:
color 7
if "%PREFIX_RANGE%"=="" set PREFIX_RANGE=192.168.1
for /f %%i in ('powershell -c "'%PREFIX_RANGE%' -match '^\d{0,1}\d{0,1}\d{0,1}[.]\d{0,1}\d{0,1}\d{0,1}\.\d{0,1}\d{0,1}\d{0,1}$'"') do set state=%%i
if "%state%"=="False"  powershell -c "write-host -nonewline TRY AGAIN!`r"&TIMEOUT 1 >nul & goto :scan
ECHO:
ECHO:Set %prefix_range%
:loop
for /f "delims=" %%a in  ('wmic os get localdatetime /value') do for /f "tokens=1,2 delims=^=." %%i in ("%%a") do set daters=%%j
set randomers=%random%%daters%
ECHO:
ECHO:

echo:

timeout 1 >NUL
cls
echo:
echo:
echo:
echo:                  
echo:                  _______________________________
echo:                 ^|Warning:                      ^|
echo:                 ^|%range% new Windows will be
echo:                 ^|spawned   to Run Ping         ^|
echo:                 ^|                              ^|
echo:                 ^|                              ^|
echo:                 ^|            ~                 ^|
echo:                 ^|      wait patiently          ^|
echo:                 ^|Windows close by themselves   ^|
echo:                  Do not interrupt or close them^|
echo:                  Do Increase the batch size for^| 
echo:                 ^|faster processing             ^|
echo:                  more Windows open if u do that^|
echo:                 ^|
echo:                  This process automates itself ^|
echo:                  please come back in few mins. ^|
echo:                 ^|______________________________^|
echo:
echo:press key
pause >nul
echo|set /p= >xxZhPuG1000.path.LOGBOOK.BOOK.print_troubleshoot_from_github.txt
set ping_no=1
echo|set/p=>xxZhPuG.progress.mac_cat.txt
ECHO:
ECHO:Set %prefix_range%
echo:
echo:i.p upper range (integer):%RANGE%
echo:
echo:ping wait time: %wait% ms
echo:
del xxZhPuG.online.ip.*.txt 2>NUL
title Main Window: Pinger
set skip_count=0


set present=255
:there
set /a absent=present-5
echo Pinging Ip s : %PREFIX_RANGE%.%present%
for /l %%i in (%absent%,1,%present%) do start /min cmd /c "title xGUHHEJ-Ping_WINDOW&(echo|set/p=*)>>xxZhPuG.progress.mac_cat.txt&PING -n %ping_no% %PREFIX_RANGE%.%%i | findstr /i "[^<=^>][0-9]*ms"&&echo|set/p=%prefix_range%.%%i>xxZhPuG.online.ip.%%i.txt"

type xxZhPuG.progress.mac_cat.txt 2>NUL

set test_ip=0
echo %Skip_count% >NUL
if %skip_count% GEQ 1 for /f "skip=%skip_count% delims=" %%i in ('dir /b /od xxZhPuG.online.ip.*.txt 2^>NUL') do for /f "delims=" %%a in ('type %%i') do echo:&echo:-----&echo:FOUND&echo %%a&echo:------&echo:&set /a skip_count+=1
if %skip_count% GEQ 1 goto skip_ip
if %skip_count% == 0 for /f "delims=" %%i in ('dir /b xxZhPuG.online.ip.*.txt 2^>NUL') do  for /f "delims=" %%a in ('type %%i') do echo:&echo:-----&echo:FOUND&echo %%a&echo:------&echo:&set /a skip_count+=1
echo:
:skip_ip
REM if %test_ip%==1 ping -n 2 %ip_to_test% | findstr /i "[<=>][0-9]*ms" >NUL&&(set /a skip_count+=1) || del %ip_file%
REM if %test_ip%==1 set /a skip_count+=1
REM if %test_ip%==1 if exist %ip_file% for /f "delims=" %%a in ("%ip_file%") do echo:&echo:-----&echo:FOUND&type %%a&echo:------&echo:
echo:
if %present% GTR 0 set /a present=present-5
if %present% GTR 0 goto there
:wait
del xxZhPuG.progress.mac_cat.txt 1>NUL 2>NUL
timeout 1 >NUL
set /a rund+=1
if %rund%==3 echo:Waiting for All ping Windows to complete and close....&set /a rund=1
tasklist /fi "windowtitle eq xGUHHEJ-Ping_WINDOW*"|find /i "cmd.exe" >NUL&&goto wait || echo: >NUL
for /f "delims=" %%i in ('dir /b xxZhPuG.online.ip.*.txt 2^>NUL') do for /f "delims=" %%a in ('type %%i') do echo %%a>>xxZhPuG1000.path.LOGBOOK.BOOK.print_troubleshoot_from_github.txt
del xxZhPuG.online.ip.*.txt 2>NUL
:ping
echo|set/p=>xxZhPuG1000.sort_path.LOGBOOK.BOOK.print_troubleshoot_from_github.txt
echo|set/p=>xxZhPuG1000.sort.LOGBOOK.BOOK.print_troubleshoot_from_github.txt
for /f "tokens=4 delims=." %%i in ('type xxZhPuG1000.path.LOGBOOK.BOOK.print_troubleshoot_from_github.txt') do echo %%i >>xxZhPuG1000.sort_path.LOGBOOK.BOOK.print_troubleshoot_from_github.txt
type xxZhPuG1000.sort_path.LOGBOOK.BOOK.print_troubleshoot_from_github.txt | sort /+3 >> xxZhPuG1000.sort.LOGBOOK.BOOK.print_troubleshoot_from_github.txt
del xxZhPuG1000.path.LOGBOOK.BOOK.print_troubleshoot_from_github.txt
del xxZhPuG1000.sort_path.LOGBOOK.BOOK.print_troubleshoot_from_github.txt
for /f "tokens=1 delims= " %%i  in ('type xxZhPuG1000.sort.LOGBOOK.BOOK.print_troubleshoot_from_github.txt') do echo %PREFIX_RANGE%.%%i >> xxZhPuG1000.path.LOGBOOK.BOOK.print_troubleshoot_from_github.txt
del xxZhPuG1000.sort.LOGBOOK.BOOK.print_troubleshoot_from_github.txt
:ping_only
set repeat=0
:repeat
set ip_online_disclaimer=
set /a repeat+=1
set initial_messages=0
:choose_ping
set /a initial_messages+=1
echo:
if %initial_messages% GEQ 2 set ip_online_disclaimer= (*According to last scan)
type xxZhPuG1000.path.LOGBOOK.BOOK.print_troubleshoot_from_github.txt 1>NUL 2>NUL
if %errorlevel% == 0 echo:List of i.p. addresses online#%ip_online_disclaimer%
if %errorlevel% NEQ 0 echo:
if %errorlevel% == 0 echo:---
type xxZhPuG1000.path.LOGBOOK.BOOK.print_troubleshoot_from_github.txt 2>NUL
if %errorlevel% == 0 echo:--- 
if %errorlevel% == 0 echo:#means, found in the network
if %repeat% LSS 2 if %errorlevel% NEQ 0 echo:xxZhPuG1000.path.LOGBOOK.BOOK.print_troubleshoot_from_github.txt:&echo:Error reading file...  & echo:& timeout 5 & cls & goto repeat
echo:
:input_file_name
set /p input_file_name=Enter file name to save:
if exist %input_file_name% echo: File name already exists. & goto input_file_name
start cmd /c "(if "%input_file_name%" NEQ "" rename xxZhPuG1000.path.LOGBOOK.BOOK.print_troubleshoot_from_github.txt "%input_file_name%.txt")&del xxZhPuG1000.path.LOGBOOK.BOOK.print_troubleshoot_from_github.txt"
choice /c Pabcdefghijklmnoqrstuvwxyz0123456789 /m "Press P to ping a list:"
if %errorlevel%==1 start cmd /c "mode 20,5&echo off & cls & echo: "Notepad list" & notepad xxZhPuG1000.list.ping.print_troubleshoot_from_github.txt"&echo:Press to start pinging......&pause >NUL&start cmd /c "echo off & cls & for /f "delims=" %%i in (xxZhPuG1000.list.ping.print_troubleshoot_from_github.txt) do ping -n 1 %%i&echo:&Pause"
goto input
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
