@echo off
mode 120,30
setlocal enabledelayedexpansion
set error_of=0
set scroll_text="Press S to perform a scan upto" "E to Edit Subnet of I.P.      " "O to go to Options            " "Press keys 123, zxc to increase/decrease range"
set scrolltextnow=1
set label3=Press S to perform a scan upto
set /a revelation=%RANDOM%*2000/32767
set error=99
set last_error=0
set gotrange=0
set gotsubnet=0
Set error=0
set prefix_range=
rem set label1={+}123
rem set bel2={-}zxc
set cchar=0
set choose=0
for /l %%i in (1,1,9) do CALL set highlight%%i=    &echo: >NUL
:checkduplicate
REM for /f "tokens=*" %%i in ('tasklist /fi "windowtitle eq xxZhPuG.Pinger*" ^| find /i "cmd.exe"') do color c&title I worship the (+) Cross but you have a DANGEROUS EXCEPTION^^^!&echo Duplicate Process running..&echo:Impossible duplicate Script execution ^^^!&echo:Dangerous Exception ^^^!&echo:&echo:(Please stop the similar dialog that you have running and try again)&pause&goto  :eof

REM LIST OF POSSIBLE WRITE LOCATIONS
set writeing_dir="%TMP%" "%USERPROFILE%\AppData\Local\Temp" "%homedrive%\Users\%username%\AppData\Local"
title STARTUP: Checking directory permissions..
:check
echo ...............................
echo -------------------------------               
echo Ping Master v 1 (from Github)^|^|         Making  Computer   Pings  easy ^^^!^^^!
echo computer pinging utility     ^|^|                Initializing..
echo =============================^|^|
echo|set/p=.temp dir permission.
set start=0
if exist xxZhPuG.CustomDir.1 choice /m "Continue with custom DIR? yn"
if exist xxZhPuG.CustomDir.1 if %errorlevel%==2 del xxZhPuG.CustomDir.1 2>NUL
if exist xxZhPuG.CustomDir.1 for /f "delims=" %%a in ('type xxZhPuG.CustomDir.1') do set writeing_dir=%%a
for %%a in (%writeing_dir%) do call :testdir %%a
if %start%==0 echo Not found write directory
if %start%==0 set /p writeing_dir=Please provide directory(in quotes):&set custom_dir=!writeing_dir!

if %start%==0 goto :check
goto checkpwsh
:testdir
if %start%==1 exit /b
echo:>%1\xxZhPuG.write.-.test.txt
if exist %1\xxZhPuG.write.-.test.txt del %1\xxZhPuG.write.-.test.txt&set write_dir=%1&set start=1&title 
color F
if %start% == 1 echo:   [OK]
if %start% == 0 echo:   Error

title STARTUP: Using write_dir %1
Exit /B
:checkpwsh
if Defined custom_dir echo !custom_dir!>xxZhPuG.CustomDir.1
echo|set/p=.powershell available.
color 7
set powershellavlable=0
powershell -c "write-host \" \"" >NUL
if %errorlevel% == 0 color F&echo:  [OK]&set powershellavlable=1
if %errorlevel% NEQ 0 set powershellavlable=0
:getsettings
if exist "%write_dir%\xxZhPuG.*.options.txt" for /f "delims=" %%i in ('dir /od /b "%write_dir%\xxZhPuG.*.options.txt"') do set options_file=%%i
if defined options_file if exist "init.xxZhPuG.lock.*.conf.bak" echo INIT failed last time & timeout 1 >NUL & echo Resetting App... & call :delete_options_file
color 7
title STARTUP: Reading options %options_file%
if exist "%write_dir%\xxZhPuG.*.options.txt" for /f "delims=" %%i in ('dir /od /b "%write_dir%\xxZhPuG.*.options.txt" ^| find /v "%options_file%"') do del "%write_dir%\%%i"

set settings=1
if exist "%write_dir%\xxZhPuG.*.options.txt" type nul > "init.xxZhPuG.lock.1.conf.bak"&for /f "delims=" %%i in ('dir /od /b "%write_dir%\xxZhPuG.*.options.txt"') do set options_file=%%i&echo:.settings file.         [OK]
call :init
if not exist "%write_dir%\xxZhPuG.*.options.txt" set settings=0
goto start
:setuid
set make_me_a_string=a b c d e f g h i j k l m o p A B C D E F G I J K L 1 2 3 4 5 6
set resultstr=
set times=0
:times
set /a counter=0
set /a cchar=(%random%*32/32767)+1
for %%a in (%make_me_a_string%) DO set /a counter+=1&if !counter!==!cchar! set resultstr=!resultstr!%%a
set /a times+=1
if %times% LEQ 6 goto times
exit /b
:createoptions
echo:File not exists
echo:create settings file?
choice /c yn
if %errorlevel%==2 exit /b
echo|set/p=>"%write_dir%\xxZhPuG.%resultstr%.options.txt"
set options="profile:0" "profiles:" "filename:00" "file:" "powershell:1" "range:" "subnet:" "uuid:%resultstr%" "savesubnet:0" "saverange:0" "execute:0"
for %%a in (%options%) do echo %%~a>>"%write_dir%\xxZhPuG.%resultstr%.options.txt"
call :init_options_file
exit /b

:process_profiles
set profile_number=0
for %%a in (%current_profile%) do set /a profile_number+=1
if %profile_number% == 0 exit /b
set profile_number=0
for %%a in (%current_profile%) do set /a profile_number+=1&for /f "tokens=1,2,3 delims=," %%i in (%%a) do echo !profile_number!.[%%k]  %%i.1 - %%i.%%j
set total_profiles=%profile_number%
if "%~1" == "entry" exit /b
:entry
for %%a in (%current_profile%) do set /a profile_number+=1
if %profile_number% == 0 echo:No profiles.&timeout 2 >NUL & goto after_profiles
set /p enterprofile=Enter a profile number:
set /a enterprofile=%enterprofile%
if %enterprofile% LEQ 0 goto after_profiles
if %enterprofile% GTR %total_profiles% goto after_profiles
set /a profile_number=0
for %%a in (%current_profile%) do set /a profile_number+=1&if !profile_number!==%enterprofile% set choiceprofile=%%a
for /f "tokens=1,2,3 delims=," %%i in (%choiceprofile%) do set pings=%%j&set prefix_range=%%i&goto loop
goto after_profiles


:init
call :init_options_file
set powershell_or_not=0
set save_subnet=0
set save_range=0
set lastuuid=
set filename=""
set file_status=0
set script_execute=0
set profile_status=0

for /f "tokens=*" %%i in ('type "%write_dir%\%options_file%" 2^>NUL') do for /f "tokens=2 delims=." %%a in ("%%~ni") do set uid=%%a

for /f "tokens=2 delims=:" %%i in ('type "%write_dir%\%options_file%" 2^>NUL ^| find "profiles:"') do set current_profile=%%i
for /f "tokens=2 delims=: " %%i in ('type "%write_dir%\%options_file%" 2^>NUL ^| find "powershell:"') do set powershell_or_not=%%i

if "%powershell_or_not%" == "" goto skip_check_powershell_status2
if %powershell_or_not%==0 set powershellavlable=0
if %powershell_or_not%==1 set powershellavlable=1
:skip_check_powershell_status2

for /f "tokens=2 delims=: " %%i in ('type "%write_dir%\%options_file%" 2^>NUL ^| find "savesubnet:" ') do set save_subnet=%%i
for /f "tokens=2 delims=: " %%i in ('type "%write_dir%\%options_file%" 2^>NUL ^| find "save_range:"') do set save_range=%%i
for /f "tokens=2 delims=: " %%i in ('type "%write_dir%\%options_file%" 2^>NUL ^| find "uuid:"') do set lastuuid=%%i
for /f "tokens=2 delims=: " %%i in ('type "%write_dir%\%options_file%" 2^>NUL ^| find "file:"') do set file_status=%%i
for /f "tokens=2* delims=:" %%i in ('type "%write_dir%\%options_file%" 2^>NUL ^| find "filename:"') do set filename="%%~i"
for /f "tokens=2 delims=:" %%i in ('type "%write_dir%\%options_file%" 2^>NUL ^| find "execute:"') do set script_execute=%%i
for /f "tokens=2 delims=:" %%i in ('type "%write_dir%\%options_file%" 2^>NUL ^| find "profile:"') do set profile_status=%%i
if exist "init.xxZhPuG.lock.1.conf.bak" del "init.xxZhPuG.lock.1.conf.bak"
color 7
exit /b

:init_options_file

if exist "%write_dir%\xxZhPuG.*.options.txt" for /f "delims=" %%i in ('dir /od /b "%write_dir%\xxZhPuG.*.options.txt"') do set options_file=%%i

Exit /b
:delete_options_file
color 7
choice /c yn /m "Are you sure? yn" /n
if %errorlevel%==2 exit /b
del "%write_dir%\%options_file%"
if exist "%write_dir%\%options_file%" echo File not deleted.&PAUSE
del "init.xxZhPuG.lock.1.conf.bak" 2>NUL
del "init.xxZhPuG.lock.2.conf.bak" 2>NUL
timeout 1 >NUL
exit /b
:clean_junk
echo:make sure no instances of script is running..
choice /m "clean junk cache? yn"
if %errorlevel%==2 exit /b
del "%write_dir%\xxZhPuG.*.online._.*.txt"
del "%write_dir%\xxZhPuG.*.online.ip.*.txt"
exit /b

:set_ping_speed
echo:+i to increase
echo:-j to decrease
:ping_speed_loop
echo:ping speed is (%ping_batch%)
choice /c ijs /m "S to Set" /n
if %errorlevel%==1 set /a ping_batch+=1
if %errorlevel%==2 set /a ping_batch-=1
if %ping_batch% LSS 1 set ping_batch=1
if %errorlevel%==3 exit /b
goto ping_speed_loop

:options
echo:>"init.xxZhPuG.lock.2.conf.bak"

set choose=0
if %revelation%==666 title Praise God^^^!
cls
if exist "%write_dir%\xxZhPuG.*.options.txt" for /f "delims=" %%i in ('dir /od /b "%write_dir%\xxZhPuG.*.options.txt"') do set options_file=%%i
if not exist "%write_dir%\xxZhPuG.*.options.txt" call :createoptions&goto input
for /f "tokens=*" %%i in ('type "%write_dir%\%options_file%"') do for /f "tokens=2 delims=." %%a in ("%%~ni") do set uid=%%a

set powershell_or_not=0
set save_subnet=0
set save_range=0
set lastuuid=
set filename=""
set file_status=0
set script_execute=0
set profile_status=0

set powershell_tick=  &echo: >NUL
set single-file=  &echo: >NUL
set multi-file=  &echo: >NUL
set subnettick=  &echo: >NUL
set rangetick=  &echo: >NUL
set execution_tick=  &echo: >NUL
set profile_tick=  &echo: >NUL
call :init
call :powershelltick
call :filetick
call :savesubnettick
calL :saverangetick
call :execute_tick
call :profiletick
rem if "%powershell_or_not%" NEQ "" 
rem if "%powershell_or_not%" NEQ ""
if exist "init.xxZhPuG.lock.2.conf.bak" del "init.xxZhPuG.lock.2.conf.bak"
:reprintoptions
set special_symbol=---:
if %error% NEQ 6 if %error% NEQ 0 CALL set highlight%error%=%special_symbol%
if %error% NEQ 6 if %error% == 14 CALL set highlight6=%special_symbol%
if %error% NEQ 6 if %error% == 15 CALL set highlight7=%special_symbol%
if %error% NEQ 6 if %error% == 17 CALL set highlight9=%special_symbol%
if %error% NEQ 6 if %error% == 16 CALL set highlight8=%special_symbol%


echo                                                   {OPTIONS_FILE} %options_file%
echo:           -----------------------------------
echo:            S = Scan
echo:            E to Edit Subnet = %prefix_range%
echo:            O Additional Options :H Change Range
echo:          ------------------------------------
echo:     Enter Choice No.#                       Tk=Tick/Untick
echo:
echo:%highlight1%1.[%multi-file%] enable default save file name (multiple files generated)
echo:%highlight2%2.[%single-file%] enable default save file name (OVERWRITE^^^!)
echo:%highlight3%3.[%rangetick%] Remember Range
echo:%highlight4%4.[%subnettick%] Remember Subnet
echo:%highlight5%5.[%powershell_tick%] enable powershell
echo:%highlight6%6.[%execution_tick%] UnAssisted Script execution
echo:%highlight7%7.[%profile_tick%] Enable Profiles
echo:%highlight8%8. Ping Speed (%ping_batch%) (Not persistent across Sessions)
echo:%highlight9%9. Clean Junk
for /f "tokens=*" %%i in ("!filename!") do echo:     Filename: (%%~i)
echo:     Press C to Change filename
echo:  (D) Delete settings file, Reset settings
for /l %%i in (1,1,9) do CALL set highlight%%i=    &echo: >NUL
if "%pingspeednote%" NEQ "" echo %pingspeednote%&set pingspeednote=
:choice_options
choice /c 12345TseoDHCk6789 /n
set error=%errorlevel%

if %error% == 17 call :clean_junk
if %error% == 16 set pingspeednote=Note: Increasing ping speed can result in slower script execution.
if %error% == 12  set /p filename=Enter a file name:&call :addfilename "!filename!"&goto options
if %error% == 10 call :delete_options_file&call :init&goto input
if %error% == 7 goto scan
if %error% == 8 goto enter_subnet
if %error% == 13 set error=6
if %error% == 6 if %error% == 0 goto options
if %error% == 11 goto input
if %error%==6 if %last_error% GTR 0 if %last_error% == 16 call :set_ping_speed
if %error%==6 if %last_error% GTR 0 if %last_error% == 1 call :addfile 2&goto options
if %error%==6 if %last_error% GTR 0 if %last_error% == 2 call :addfile 1&goto options
if %error%==6 if %last_error% GTR 0 if %last_error% == 3 call :saverange&goto options
if %error%==6 if %last_error% GTR 0 if %last_error% == 4 call :savesubnet&goto options
if %error%==6 if %last_error% GTR 0 if %last_error% == 5 call :setpowershell&goto options
if %error%==6 if %last_error% GTR 0 if %last_error% == 14 if %save_range% == 0 if %save_subnet% NEQ 0 echo:Both Remember Range and Remember Subnet must be enabled.&PAUSE
if %error%==6 if %last_error% GTR 0 if %last_error% == 14 if %save_subnet% == 0 if %save_range% NEQ 0 echo:Both Remember Range and Remember Subnet must be enabled.&PAUSE
if %error%==6 if %last_error% GTR 0 if %last_error% == 14 if %save_subnet% == 0 if %save_range% == 0 echo:Both Remember Range and Remember Subnet must be enabled.&PAUSE
if %error%==6 if %last_error% GTR 0 if %last_error% == 14 if %save_subnet% neq 0 if %save_range% neq 0 call :setscriptexecute&goto options
if %error%==6 if %last_error% GTR 0 if %last_error% == 15 call :setprofile&goto options
set last_error=%error%
if %error% LEQ 5 if %error% NEQ 0 cls&goto reprintoptions
cls&goto reprintoptions
:powershelltick
if %powershell_or_not%==1 (set powershell_tick=\/) else (set powershell_tick=  &echo: >NUL)
exit /b
:profiletick
if %profile_status%==1 (set profile_tick=\/) else (set profile_tick=  &echo: >NUL)
exit /b
:filetick
if %file_status%==2 (set multi-file=\/) else (set multi-file=  &echo: >NUL)
if %file_status%==1 (set single-file=\/) else (set single-file=  &echo: >NUL)
exit /b
:savesubnettick
if %save_subnet%==1 (set subnettick=\/) else (set subnettick=  &echo: >NUL)
exit /b
:saverangetick
if %save_range%==1 (set rangetick=\/) else (set rangetick=  &echo: >NUL)
exit /b

:execute_tick
if %script_execute%==1 (set execution_tick=\/) else (set execution_tick=  &echo: >NUL)
exit /b

:add_profile
call :setuid
for /f "delims=" %%i in ('type "%write_dir%\%options_file%" ^| find /v "profiles:"') do echo %%i>>"%write_dir%\xxZhPuG.%resultstr%.options.txt"
echo profiles:%current_profile% "%prefix_range%,%pings%,%~1">>"%write_dir%\xxZhPuG.%resultstr%.options.txt"
exit /b
:setprofile
call :setuid
for /f "delims=" %%i in ('type "%write_dir%\%options_file%" ^| find /v "profile:"') do echo %%i>>"%write_dir%\xxZhPuG.%resultstr%.options.txt"
if %profile_status% == 0 (set profile_status=1) else (set profile_status=0)
echo profile:%profile_status%>>"%write_dir%\xxZhPuG.%resultstr%.options.txt"
exit /b

:setpowershell
call :setuid
for /f "delims=" %%i in ('type "%write_dir%\%options_file%" ^| find /v "powershell:"') do echo %%i>>"%write_dir%\xxZhPuG.%resultstr%.options.txt"
if %powershell_or_not%==1 (set powershell_status=0) else (set powershell_status=1)
echo powershell: %powershell_status% >>"%write_dir%\xxZhPuG.%resultstr%.options.txt"
exit /b

:setscriptexecute
if !filename!=="" echo:Filename is not set.&PAUSE&Exit /B
if !filename!==".txt" echo:Filename is not set.&PAUSE&Exit /B
if !filename!=="00" echo:Filename is not set.&PAUSE&Exit /B
call :setuid
for /f "delims=" %%i in ('type "%write_dir%\%options_file%" ^| find /v "execute:"') do echo %%i>>"%write_dir%\xxZhPuG.%resultstr%.options.txt"
if %Script_execute%==0 (set script_execute=1) else (set script_execute=0)
echo execute:%script_execute%>>"%write_dir%\xxZhPuG.%resultstr%.options.txt"
exit /b


:saverange
call :setuid
for /f "delims=" %%i in ('type "%write_dir%\%options_file%" ^| find /v "save_range:"') do echo %%i>>"%write_dir%\xxZhPuG.%resultstr%.options.txt"
if "%save_range%" == "" set save_range=0
if %save_range%==0 (set save_range=1) else (set save_range=0)
echo save_range:%save_range%>>"%write_dir%\xxZhPuG.%resultstr%.options.txt"
exit /b

:getsubnet
set gotsubnet=0
for /f "tokens=2 delims=: " %%i in ('type "%write_dir%\%options_file%" ^| findstr "^subnet:"') do set gotsubnet=1&set prefix_range=%%i
exit /b
:getrange
set gotrange=0
for /f "tokens=2 delims=: " %%i in ('type "%write_dir%\%options_file%" ^| findstr "^range:"') do set gotrange=1&set pings=%%i
exit /b

:savesubnet
call :setuid
for /f "delims=" %%i in ('type "%write_dir%\%options_file%" ^| find /v "savesubnet:"') do echo %%i>>"%write_dir%\xxZhPuG.%resultstr%.options.txt"
if "%save_subnet%" == "" set save_subnet=0
if %save_subnet%==0 (set save_subnet=1) else (set save_subnet=0)
echo savesubnet:%save_subnet%>>"%write_dir%\xxZhPuG.%resultstr%.options.txt"
exit /b

:subnet
REM ..echo I will save the subnet...Pls don't worry
Rem m Pause
call :setuid
for /f "delims=" %%i in ('type "%write_dir%\%options_file%" ^| findstr /v "^subnet:"') do echo %%i>>"%write_dir%\xxZhPuG.%resultstr%.options.txt"
echo subnet:%prefix_range%>>"%write_dir%\xxZhPuG.%resultstr%.options.txt"
exit /b

:range
call :setuid
for /f "delims=" %%i in ('type "%write_dir%\%options_file%" ^| findstr /v "^range:"') do echo %%i>>"%write_dir%\xxZhPuG.%resultstr%.options.txt"
echo range:%pings%>>"%write_dir%\xxZhPuG.%resultstr%.options.txt"
exit /b

:addfilename
rem echo just received a parcel for "%~1"
for /f "tokens=*" %%i in ("%~1") do set filename="%%~ni.txt"&if exist ".\%%~ni.txt" echo EXISTS^^^! ".\%%ni.txt" & timeout 4 >NUL & exit /b
call :setuid
for /f "delims=" %%i in ('type "%write_dir%\%options_file%" ^| find /v "filename:"') do echo %%i>>"%write_dir%\xxZhPuG.%resultstr%.options.txt"
echo filename:!filename!>>"%write_dir%\xxZhPuG.%resultstr%.options.txt"
exit /b

:addfile
if "%file_status%" == "" set file_status=0&goto skip_check_file_status
if %file_status% == 0 (set file_status=%1) else (set file_status=0)
:add_file_input_name
if %file_status% NEQ 0 if %filename% == "00" set /p filename=Enter a file name:&(if exist .\!filename! echo File exist already ^^^! & goto add_file_input_name)& call :addfilename !filename!&exit /b
:skip_check_file_status
call :setuid
for /f "delims=" %%i in ('type "%write_dir%\%options_file%" ^| find /v "file:"') do echo %%i>>"%write_dir%\xxZhPuG.%resultstr%.options.txt"
echo file:%file_status%>>"%write_dir%\xxZhPuG.%resultstr%.options.txt"
exit /b

:start
Set choose=0
del "%write_dir%\%totaluid%.online._.*.txt" 2>NUL
del "%write_dir%\%totaluid%.online.ip.*.txt" 2>NUL
call :setuid
if "%powershell_or_not%" == "" goto skip_check_powershell_status
if %powershell_or_not%==0 set powershellavlable=0
if %powershell_or_not%==1 set powershellavlable=1
:skip_check_powershell_status
set totaluid=xxZhPuG.!resultstr!
rem start of program ****************************************************************************************
REM 
rem set default variables ***********************************************************************************
:Y
if "%save_range%" == "" goto skip_save_range_2
if %save_range% == 1 call :getrange
:skip_save_range_2
if "%save_subnet%" == "" goto skip_save_subnet_2
if %save_subnet% == 1 call :getsubnet
:skip_save_subnet_2
if %gotrange%==0 set pings=254
set ping_batch=2
if %gotsubnet%==0 for /f "tokens=2 delims=:(" %%i in ('ipconfig /all ^| find "IPv4"') do for /f "tokens=1,2,3 delims=. " %%a in ("%%i") do echo %%a.%%b.%%c|findstr /r "^[0-9]*[.][0-9]*[.][0-9]*$" >NUL&&set prefix_range=%%a.%%b.%%c
:input
title ping master  ^^(*(oo)*)^^
set scrollc=0
for %%a in (%scroll_text%) do set /a scrollc+=1&if !scrollc!==!scrolltextnow! if %error_of%==2 title %%~a
set /a scrolltextnow+=1
if %scrolltextnow% GTR 4 set scrolltextnow=1
if %pings% GEQ 254 (set label1=Maximum Range Achieved) else (set label1=)
if %pings% GEQ 254 (set label2=      press keys)
if %pings% LSS 254 if %pings% GTR 1 set label2=                             press keys
if %pings% == 1 set label2=  press keys
if %pings% == 1 (set label1=Range cannot be less than 1)
if %profile_status%==1 (set label5= P Profiles &echo:>NUL) else (set label5=            &echo:>NUL)
if %error_of% == 2 (echo:>NUL&goto skip_labels) else (set error_of=0&cls)
echo: **************start pings*******^|^| Range: 1--x.x.x.%pings%
echo: --------------------------------^|^| !label1! %label2%
echo: %label3%  ^|^| 123^< .     .   . . increase 
echo: range, E to Edit Subnet of I.P. ^|^| zxc^< . .  .  .   . decrease
echo: O Additional Options%label5%^|^|___________________________
echo: -------------------------------------------------------------                   
if exist "%write_dir%\%options_file%" (echo: Loaded File: %options_file%    Ping Subnet:%prefix_range%) else (echo:)
if %profile_status%==1  echo:Profiles:-
if %choose% == 2 echo:     Tip-:(Please use Windows Console Host as your default terminal.)
if %profile_status%==1 (Call :process_profiles "entry")
if !cchar! GTR 24 call :flash F
if %revelation% == 666 color F&echo:                   i thanks Jesus for the strength to make this.
if %script_execute%==1 if %save_subnet%==1 cls&mode 40,20&for /l %%i in (1,1,10) do echo Running Auto Mode...Press C Cancel
if %script_execute%==1 choice /c Ct /n /d t /t 3
if %script_execute%==1 if %errorlevel%==2 goto loop
if %script_execute%==1 if %errorlevel%==1 mode 120,30&goto options
echo:&echo:Please Adjust Range before starting to Ping^^^!&echo:&echo:&echo:
:skip_labels
choice /c s03z2x1coePU /n /t 3 /d 0 >NUL
set error_of=%errorlevel%
set /a choose+=1
if %errorlevel%==3 set /a pings +=10
if %errorlevel%==4 set /a pings -=10
if %errorlevel%==5 set /a pings +=5
if %errorlevel%==6 set /a pings -=5
if %errorlevel%==7 set /a pings +=1
if %errorlevel%==8 set /a pings -=1
if %pings% GEQ 255 set pings=254
if %pings% LSS 1 set pings=1
if %errorlevel%==1 goto scan
if %errorlevel%==9 goto options
if %errorlevel%==10 goto enter_subnet
if %errorlevel%==11 goto entry
:after_profiles
del "init.xxZhPuG.lock.1.conf.bak" 2>NUL
del "init.xxZhPuG.lock.2.conf.bak" 2>NUL
goto input
:get_mac.py
color 2
title ping master  ^^(*(oo)*)^^
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
cls
title  ping master  ^^(*(oo)*)^^
echo:                       
if not defined PREFIX_RANGE goto enter_subnet
echo:======================================================       
echo:S to continue to Scanning I.P Addresses..^|         
echo:E = Edit Subnet                          ^|%prefix_range%            
echo:o Additional options                     ^|____________
echo:-----------------------------------------^|============

choice /c seO /m "" /n
if %errorlevel%==1 goto loop
if %errorlevel%==3 goto options
:enter_subnet
set choose=0
cls
echo:press /enter\ for the default value
echo:..
set PREFIX_RANGE=
echo: Enter Subnet
set /p PREFIX_RANGE=Subnet X.X.X:
if "%PREFIX_RANGE%"=="" set PREFIX_RANGE=192.168.1
if %powershellavlable%==1 for /f %%i in ('powershell -c "'%PREFIX_RANGE%' -match '^\d{0,1}\d{0,1}\d{0,1}[.]\d{0,1}\d{0,1}\d{0,1}\.\d{0,1}\d{0,1}\d{0,1}$'"') do set state=%%i
if %powershellavlable%==0 echo %PREFIX_RANGE%|findstr /r "^[0-9]*[.][0-9]*[.][0-9]*$"&& (goto input) || (echo:bad format&goto :enter_subnet)
if "%state%"=="False"  powershell -c "write-host -nonewline TRY AGAIN!`r"&TIMEOUT 1 >nul & goto :enter_subnet
ECHO:
:loop
if not defined PREFIX_RANGE goto enter_subnet
del "%write_dir%\%totaluid%.online._.*.txt" 2>NUL
del "%write_dir%\%totaluid%.online.ip.*.txt" 2>NUL
timeout 1 >NUL
cls
:displyascii
echo:
echo:
echo:     _       __ _ _          _                        _                _ _
echo:    ^| ^|     / _(_) ^|        ^| ^|                      ^| ^|              (_) ^|
echo:  __^| ^| ___^| ^|_ _^| ^| ___  __^| ^|______ ___ _ __   __ _^| ^| _____    ___  _^| ^|
echo: / _` ^|/ _ \  _^| ^| ^|/ _ \/ _` ^|______/ __^| '_ \ / _` ^| ^|/ / _ \  / _ \^| ^| ^|
echo:^| (_^| ^|  __/ ^| ^| ^| ^|  __/ (_^| ^|      \__ \ ^| ^| ^| (_^| ^|   ^<  __/ ^| (_) ^| ^| ^|
echo: \__,_^|\___^|_^| ^|_^|_^|\___^|\__,_^|      ^|___/_^| ^|_^|\__,_^|_^|\_\___^|  \___/^|_^|_^|
echo:
echo:
echo: _                                  _       _   _                          __
echo:(_)                                (_)     ^| ^| (_)                        / /
echo: _ _ __     __ _ ___ ___  ___   ___ _  __ _^| ^|_ _  ___  _ __   __      __/ /
echo:^| ^| '_ \   / _` / __/ __^|/ _ \ / __^| ^|/ _` ^| __^| ^|/ _ \^| '_ \  \ \ /\ / / /
echo:^| ^| ^| ^| ^| ^| (_^| \__ \__ \ (_) ^| (__^| ^| (_^| ^| ^|_^| ^| (_) ^| ^| ^| ^|  \ V  V / /
echo:^|_^|_^| ^|_^|  \__,_^|___/___/\___/ \___^|_^|\__,_^|\__^|_^|\___/^|_^| ^|_^|   \_/\_/_/
echo:
echo:
echo:
echo:ASCII Art source:http://patorjk.com/

timeout 1 >NUL
:initial_start
set ping_no=1
title Pinger Main Window: Pinger
set skip_count=0
set found_ip=
set present=%pings%
set found=0
set /a division=ping_batch*10000/pings
set clearcounter=0
set percent=0
set pings_actual=0
set updatevariable=0
set percentage=0
set ping_batch_var=0
set begun=1
for /f "delims=" %%i in ('ipconfig^| find /i "ipv4"') do goto there 
(echo: Computer internet not working?&timeout 5 >NUL)
:there
set /a clearcounter+=1
set /a clearcountermodulus=clearcounter %% 20
set /a absent=present-ping_batch
if %absent% LSS 1 set absent=1
call :updatevars
if %begun% NEQ 0 cls&echo:            ----------------------------------&echo:            [%PREFIX_RANGE%.%absent%]-[%PREFIX_RANGE%.%present%]&echo:            Status: Sending requests..
for /l %%i in (%absent%,1,%present%) do start /min cmd /c "title %totaluid%xGUHHEJ-Ping_WINDOW&PING -n %ping_no% %PREFIX_RANGE%.%%i | findstr /i "[^<=^>][0-9]*ms"&&echo|set/p=%prefix_range%.%%i>"%write_dir%\%totaluid%.online.ip.%%i.txt"&echo|set/p=>"%write_dir%\%totaluid%.online._.%%i.txt""
if %found% GEQ 1 echo:&echo FOUND&echo:[92mX[0m%found_ip%[92mX[0m&echo:&echo I.P(s) found = %skip_count%
if %percentage% LSS 80 (if %updatevariable% == 1 call :update_screen) else (call :update_screen)
set test_ip=0
if %skip_count% GEQ 1 for /f "skip=%skip_count% delims=" %%i in ('dir /b /od "%write_dir%\%totaluid%.online.ip.*.txt" 2^>NUL') do for /f "delims=" %%a in ('type "%write_dir%\%%i"') do set /a skip_count+=1&call :setfound %%a
if %skip_count% == 0 for /f "delims=" %%i in ('dir /b "%write_dir%\%totaluid%.online.ip.*.txt" 2^>NUL') do  for /f "delims=" %%a in ('type "%write_dir%\%%i" 2^>NUL') do set /a skip_count+=1&call :setfound %%a
set /a present=absent-1
echo:
goto skip_ip
:update_screen
set /a percentage=pings_actual*100/(pings)
set var=Pinger Main Window: pinger        (%percentage% %%)
REM set var=!var:~0,%percentage%!
title !var!
exit /b
:updatevars
set /a ping_batch_var=pings-absent+1
for /f "tokens=1" %%i in ('dir "%write_dir%\%totaluid%.online._.*.txt" 2^>NUL ^| find "File(s)"') do set pings_actual=%%i&set begun=0&cls & echo:&echo:            ----------------------------------&echo:            [%PREFIX_RANGE%.%absent%]-[%PREFIX_RANGE%.%present%]&echo:            Status: Sending ping requests..&echo:            Completed:%%i&echo:&set /a updatevariable=clearcounter %% 2
exit /b
:setfound
set /a found+=1
if %present% LSS 1 echo:FOUND %~1
set found_ip=%found_ip% %~1,
exit /b
:update_screen_title
for /f "tokens=1" %%i in ('dir "%write_dir%\%totaluid%.online._.*.txt" 2^>NUL ^| find "File(s)"') do set pings_actual=%%i
set /a percentage=pings_actual*100/(pings)
set var=Pinger Main Window: pinger        (%percentage% %%)
REM set var=!var:~0,%percentage%!
title !var!
exit /b
:skip_ip
echo:
if %absent% == 0 goto wait
if %present% GEQ 1 goto there
if %present% == 0 set /a present=pings
:wait
if %skip_count% GEQ 1 for /f "skip=%skip_count% delims=" %%i in ('dir /b /od "%write_dir%\%totaluid%.online.ip.*.txt" 2^>NUL') do for /f "delims=" %%a in ('type "%write_dir%\%%i"') do set /a skip_count+=1&call :setfound %%a
if %skip_count% == 0 for /f "delims=" %%i in ('dir /b "%write_dir%\%totaluid%.online.ip.*.txt" 2^>NUL') do  for /f "delims=" %%a in ('type "%write_dir%\%%i"') do set /a skip_count+=1&call :setfound %%a
timeout 1 >NUL
set /a rund+=1
if %rund%==3 echo:Windows closing....waiting&set /a rund=0
if not defined dontholdon if %rund%==4 echo:Waiting for the final result,&set dontholdon=0
tasklist /fi "windowtitle eq %totaluid%xGUHHEJ-Ping_WINDOW*"|find /i "cmd.exe" >NUL&&goto wait || echo: >NUL
call :updatevars
call :update_screen_title
del "%write_dir%\%totaluid%.online._.*.txt" 1>NUL 2>NUL
if %script_execute% == 1 if %file_status% NEQ 0 goto save_file_default_file_name
if %script_execute% == 1 if %file_status% == 0 echo Error running Script_execute. No default save file method defined.& timeout 4 >NUL

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
for /f "delims=" %%i in ('dir /b "%write_dir%\%totaluid%.online.ip.*.txt" 2^>NUL') do  for /f "delims=" %%a in ('type "%write_dir%\%%i"') do call :setfound %%a
echo:
echo: * List of I.P Addresses *%ip_online_disclaimer%
echo:that responded to requests
if "%found_ip%" == "" set found_ip=No_Results.
set found_ip=%found_ip: =%
echo:---
if %powershellavlable%==1 powershell -c "$ipString = \"%found_ip%\";$ipAddresses = $ipString -split ',\s*';function Get-LastOctet { param ( [string]$ip ) return [int]($ip.Split('.')[3]) };$sortedIpAddresses = $ipAddresses | Sort-Object { Get-LastOctet $_ };$sortedIpAddresses;" 2>NUL
if %powershellavlable%==0 for %%a in (%found_ip%) do echo %%a 
echo:--- 
echo:Save list
echo:.......................................
if %save_range% == 1 call :range&call :init_options_file
if %save_subnet% == 1 call :subnet&call :init_options_file
del "%write_dir%\%totaluid%.online.ip.*.txt" 2>NUL
if %filename% == "" goto skip_check_file_status
if %file_status% NEQ 0 goto save_file_default_file_name
:skip_check_file_status
:input_file_name
set input_file_name=
set /p input_file_name=Enter file name to save:
set input_file_name="%input_file_name%.txt"
if !input_file_name! NEQ ".txt" (echo Press a key to save !input_file_name!) else (echo:File will not be saved. No name mentioned.&pause&goto input)
pause >NUL
(if exist !input_file_name! echo: File name already exists.&pause&goto input)
(if "!input_file_name!" NEQ "" echo: Writing to file......)
:save_input_file_name
if !input_file_name! == "00" echo:Please set default filename from menu options.&pause >NUL&goto skip_check_file_status2
if %powershellavlable%==1 for /f "tokens=*" %%i in (%input_file_name%) do if "%%i" NEQ "" powershell -c "$ipString = \"%found_ip%\";$ipAddresses = $ipString -split ',\s*';function Get-LastOctet { param ( [string]$ip ) return [int]($ip.Split('.')[3]) };$sortedIpAddresses = $ipAddresses | Sort-Object { Get-LastOctet $_ };$sortedIpAddresses" >"%%i" & for /f "tokens=*" %%a in ('whoami') do echo:>>"%%i"&echo:==============>>"%%i"&echo:Generated on: %date% %time% by %%a>>"%%i"&echo:==============>>"%%i"
if %powershellavlable%==0 for /f "tokens=*" %%i in (%input_file_name%) do if "%%i" NEQ "" echo WRITING to FILE...&(for %%a in (%found_ip%) do echo %%a >"%%i")&for /f "tokens=*" %%a in ('whoami') do echo:>>"%%i"&echo:==============>>"%%i"&echo:Generated on: %date% %time% by %%a>>"%%i"&echo:==============>>"%%i"
if %scripT_execute% == 1 echo Script Execute Complete & timeout 4 >NUL & goto :eof
:after_save
if %powershellavlable%==1 echo:&echo Written [error_code:%errorlevel%]
if %powershellavlable%==0 if exist !input_file_name! echo Written
if %file_status% NEQ 0 echo:&echo:press key&pause >NUL
:skip_check_file_status2
set choose=0
if %profile_status%==1 choice /c yn /m "Save Profile?" /n /d n /t 4
if %profile_status%==1 if %errorlevel%==1 set /p enterprofilename=Enter friendly name:&call :add_profile "!enterprofilename!"
call :init
goto input
:save_file_default_file_name
set no_save=1
if %file_status%==2 call :check_file_name_multiple
if %no_save%==0 echo:Unable to write Unique Filename.&goto after_save
set input_file_name=!filename!
for %%i in (!input_file_name!) do echo:Enter file name to save: %%~i
goto save_input_file_name
:check_file_name_multiple
if %file_status%==1 for /f "tokens=*" %%i in ("!filename!") do set input_file_name="%%~i"&goto :save_input_file_name
call :check_file_name_exist & exit /b
exit /b
:check_file_name_exist
set inverted_comma=0
for /f "delims=" %%i in ('wmic os get localdatetime') do echo %%i|find "+" >NUL&&set trailer=%%i
set trailer=%trailer:~0,7%
for /f "tokens=*" %%i in ("!filename!") do for /l %%d in (1,1,99) do if !inverted_comma! NEQ 1 if not exist "%%~ni (%trailer%_%%d).txt"  set filename="%%~ni (%trailer%_%%d).txt" & set inverted_comma=1&exit /b
:check_file_name_exist_over
set no_save=0
:save_me_from_this
echo:you got saved
exit /b
if %powershellavlable%==1 set filename=%filename:@=`@%
if %powershellavlable%==1 set filename=%filename:#=`#%
if %powershellavlable%==1 set filename=%filename:{=`{%
if %powershellavlable%==1 set filename=%filename:}=`}%
if %powershellavlable%==1 set filename=%filename:(=`(%
if %powershellavlable%==1 set filename=%filename:)=`)%
if %powershellavlable%==1 set filename=%filename:'=`'%
if %powershellavlable%==1 set filename=%filename:;=`;%
if %powershellavlable%==1 set filename=%filename:|=`|%
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
