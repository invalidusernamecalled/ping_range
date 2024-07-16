@echo off
mode 120,30
setlocal enabledelayedexpansion
for /f "tokens=1,2 delims=\" %%i in ('whoami') do set computer_name=%%i&set user_name=%%j
if not exist xxZhPuG.strlen.bytes.txt echo %computer_name%>xxZhPuG.strlen.bytes.txt
set strbyte=0
for /f "tokens=3" %%i in ('dir xxZhPuG.strlen.bytes.txt ^| find "File(s)"') do set strbyte=%%i
Del xxZhPuG.strlen.bytes.txt 2>NUL
set spaces=                                           
set /a strd=strbyte %% 2
if %strd%==1 set /a strbyte=strbyte+1
set /a strbyte=strbyte/2
set /a leftover=15-strbyte
CALL set spaces_pad=%%spaces:~0,%leftover%%%
set /a strdleftover=leftover %% 2
if %strdleftover%==1 set /a leftover=leftover+1
set /a strdleftover=leftover/2
CALL set spaces_right=%%spaces:~0,%strdleftover%%%
set computer_string=%spaces_pad%computer name: %computer_name%%spaces_right%user name:%user_name%
set juice=1
set scroll_text="Press S to perform a scan" "E to Edit Scan Subnet" "O to go to Settings" "Press keys: 123, 456"
set powershellavlable=0
Set ran_check=0
set notchange=1
set notreally=0
set last_ping=%pings%
set error_of=0
set scrolltextnow=1
set /a revelation=%RANDOM%*2000/32767
set error=99
set last_error=99
set gotrange=0
set gotsubnet=0
Set error=0
set prefix_range=
rem set label1={+}123
rem set bel2={-}zxc
set cchar=0
set choose=0
for /l %%i in (1,1,11) do CALL set highlight%%i=    &echo: >NUL
:checkduplicate
REM for /f "tokens=*" %%i in ('tasklist /fi "windowtitle eq xxZhPuG.Pinger*" ^| find /i "cmd.exe"') do color c&title I worship the (+) Cross but you have a DANGEROUS EXCEPTION^^^!&echo Duplicate Process running..&echo:Impossible duplicate Script execution ^^^!&echo:Dangerous Exception ^^^!&echo:&echo:(Please stop the similar dialog that you have running and try again)&pause&goto  :eof

REM LIST OF POSSIBLE WRITE LOCATIONS
set writeing_dir="%TMP%" "%USERPROFILE%\AppData\Local\Temp" "%homedrive%\Users\%username%\AppData\Local"
title STARTUP: Checking directory permissions..
:check
echo  ::::::::::::::::::::::::::::
echo -------------------------------               
echo Ping Master                  ^|^|         Making  Computer   Pings  easy ^^^!^^^!
echo computer pinging utility     ^|^|                Initializing..
echo -----------------------------^|^|
echo: :::::::::::::::::::::::::::::
echo:
set tmp_write_dir=%tmp%
if exist "%tmp_write_dir%\xxZhPuG.*.options.txt" for /f "delims=" %%i in ('dir /od /b "%tmp_write_dir%\xxZhPuG.*.options.txt" 2^>NUL') do set options_file=%%i&set write_dir=%tmp_write_dir%&set options_file_exists=1
if defined options_file if exist "init.xxZhPuG.lock.*.conf.bak" echo INIT failed last time & timeout 1 >NUL & echo Resetting App... & call :delete_options_file
if defined options_file goto getsettings
echo|set/p=.working dir permissions.
set start=0
if exist xxZhPuG.CustomDir.1 choice /m "Continue with custom DIR? yn"
if exist xxZhPuG.CustomDir.1 if %errorlevel%==2 del xxZhPuG.CustomDir.1 2>NUL
if exist xxZhPuG.CustomDir.1 for /f "delims=" %%a in ('type xxZhPuG.CustomDir.1') do set writeing_dir=%%a
for %%a in (%writeing_dir%) do call :testdir %%a
if %start%==0 echo Not found write directory
if %start%==0 set /p writeing_dir=Please provide directory(in quotes):&set custom_dir=!writeing_dir!

if %start%==0 goto :check
goto getsettings
:testdir
if %start%==1 exit /b
echo:>%1\xxZhPuG.write.-.test.txt
if exist %1\xxZhPuG.write.-.test.txt del %1\xxZhPuG.write.-.test.txt&set start=1&for /f "delims=" %%i in (%1) do set write_dir=%~1
color F
if %start% == 1 echo:   [\/]
if %start% == 0 echo:   Error

title STARTUP: Using write_dir "!write_dir!"
Exit /B
:checkpwsh
if Defined custom_dir echo !custom_dir!>xxZhPuG.CustomDir.1
color 7
set powershellavlable=0
powershell -c "write-host \" \"" >NUL
if %errorlevel% == 0 (color F&set powershellavlable=1&set power_on=  ^(Powershell Available^)) else (set power_on=  ^(Not Available^))
if %errorlevel% NEQ 0 set powershellavlable=0
exit /b
:getsettings
color 7
title STARTUP: Reading options %options_file%
if defined options_file type nul > "init.xxZhPuG.lock.1.conf.bak" 
echo:.reading settings.          [\/]
set exceptions=0
if defined options_file set exceptions=1&call :init&goto start
call :init
if defined options_file if exist "init.xxZhPuG.lock.*.conf.bak" echo INIT failed last time & timeout 1 >NUL & echo Resetting App... & call :delete_options_file
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
:NewSecretRxFx
if %bounce%==1 if "%scroller:~0,1%" == "*" (set scroller=%scroller:~1%*) 
if %bounce%==0 if "%scroller:~-1%" == "*" (set scroller=*%scroller:~0,-1%) 
Exit /b
:createoptions
echo:File not exists
echo:create settings file?
echo:R Restore
choice /c ynR 
if %errorlevel%==2 set juice=1&goto input&set /p=hello_from_hell
if %errorlevel%==3 goto create_from_backup
echo|set/p=>"%write_dir%\xxZhPuG.%resultstr%.options.txt"
set options="profile:0" "profiles:" "filename:00" "file:" "powershell:1" "range:" "subnet:" "uuid:%resultstr%" "savesubnet:0" "saverange:0" "execute:0"
for %%a in (%options%) do echo %%~a>>"%write_dir%\xxZhPuG.%resultstr%.options.txt"
call :init_options_file
goto end_of_create
:create_from_backup
for /f "delims=" %%i in ('dir /b xxZhPuG.settings.*.bak.txt') do findstr /i "subnet:" "%%i" >NUL&&(choice /m "is this %%i"&if !errorlevel!==1 set restore_file=%%i&goto :continue_backup_restore)
echo:Cannot continue file name should be in format = xxZhPuG.settings.#.bak.txt where # is a number digit & PAUSE & set juice=1& exit /b
:continue_backup_restore
set options=profile: profiles: filename: file: powershell: range: subnet: uuid: savesubnet: saverange: execute:
set sanity_check=0
for %%a in (%options%) do findstr /i "%%a" %restore_file% >NUL&& (set /a sanity_check+=1)
echo:Sanity Check: %sanity_check%
if %sanity_check%==11 (echo:Copying to write_dir "%write_dir%"..&copy  %restore_file% "%write_dir%\xxZhPuG.%resultstr%.options.txt" >NUL) else (echo:Check completed with Errors. Unable to continue restore from backup.&PAUSE&goto end_of_create)
call :init
if %errorlevel%==0 echo:Completed.
pause
:end_of_create
set juice=1
goto input

:process_profiles
set profile_number=0
for %%a in (%current_profile%) do set /a profile_number+=1
if %profile_number% == 0 exit /b
set profile_number=0
for %%a in (%current_profile%) do set /a profile_number+=1&for /f "tokens=1,2,3 delims=," %%i in (%%a) do echo !profile_number!.[%%k]  %%i.1 - %%i.%%j
set total_profiles=%profile_number%
if "%~1" == "entry" exit /b
:entry
set profile_number=0
for %%a in (%current_profile%) do set /a profile_number+=1
if %profile_number% == 0 echo:No profiles.&timeout 2 >NUL & goto after_profiles
set /p enterprofile=Enter a profile number:
set /a enterprofile=%enterprofile%
if %enterprofile% LEQ 0 set juice=1&echo Invalid ^^^!&goto after_profiles
if %enterprofile% GTR %total_profiles% set juice=1&echo Invalid ^^^!&goto after_profiles
set /a profile_number=0
for %%a in (%current_profile%) do set /a profile_number+=1&if !profile_number!==%enterprofile% set choiceprofile=%%a
for /f "tokens=1,2,3 delims=," %%i in (%choiceprofile%) do set pings=%%j&set prefix_range=%%i&set profile_status=0&goto loop
goto after_profiles

:backup
if %notreally%==2 exit /b
choice /m "Really yn"
set notreally=%errorlevel%
if %notreally% == 2 cls&goto reprintoptions
set options=profile: profiles: filename: file: powershell: range: subnet: uuid: savesubnet: saverange: execute:
set values=profile_status current_profile filename file_status powershell_or_not pings prefix_range lastuuid save_subnet save_range script_execute

set backup_count=0
for %%a in (%options%) do set arr_options[!backup_count!]=%%a&set /a backup_count+=1
set /a total_option=backup_count-1
set backup_count=0
for %%a in (%values%) do set arr_values[!backup_count!]=%%a&set /a backup_count+=1
set /a total_value=backup_count-1
if %total_value% NEQ %total_option% echo:Error backing up. Value/option mismatch in code.&pause&Exit /b
set backup_count=0
set counter_of=1
echo|set /p=>xxZhPuG.temp.1.bak
for /l %%i in (0,1,%total_value%) do echo !arr_options[%%i]!!arr_values[%%i]! >>xxZhPuG.temp.1.bak
:looper
if %counter_of% GTR 2000 set /a counter_of=0&echo: Something Fishy (infinite Loop?)&PAUSE
if exist xxZhPuG.settings.%counter_of%.bak.txt (set /a counter_of+=1&goto looper)
echo|set /p=>xxZhPuG.settings.%counter_of%.bak.txt
for /f "tokens=1,2* delims=: " %%a in ('type xxZhPuG.temp.1.bak') do CALL echo %%a:%%%%b%% >>xxZhPuG.settings.%counter_of%.bak.txt
echo:// please do not rename file for easy restore^^^!>>xxZhPuG.settings.%counter_of%.bak.txt
del xxZhPuG.temp.1.bak
echo:File saved to xxZhPuG.settings.%counter_of%.bak.txt
:here
exit /b


:init
if %exceptions%==0 call :init_options_file
set exceptions=0
set powershell_or_not=0
set save_subnet=0
set save_range=0
set lastuuid=
set filename=""
set file_status=0
set script_execute=0
set profile_status=0
if not defined options_file exit /b
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
for /f "tokens=2* delims=:" %%i in ('type "%write_dir%\%options_file%" 2^>NUL ^| find "filename:"') do set filename=%%i

REM strip_loop
REM strip_filename=%filename:" ="%
REM strip_filename=%filename: "="%
REM if %strip_filename% NEQ %filename% echo:striming file&echo|set/p=.&goto strip_loop
REM set filename=!strip_filename!
for /f "tokens=2 delims=:" %%i in ('type "%write_dir%\%options_file%" 2^>NUL ^| find "execute:"') do set script_execute=%%i
for /f "tokens=2 delims=:" %%i in ('type "%write_dir%\%options_file%" 2^>NUL ^| find "profile:"') do set profile_status=%%i
if exist "init.xxZhPuG.lock.1.conf.bak" del "init.xxZhPuG.lock.1.conf.bak"
color 7
exit /b

:init_options_file
set options_file_exists=0
if exist "%write_dir%\xxZhPuG.*.options.txt" for /f "delims=" %%i in ('dir /od /b "%write_dir%\xxZhPuG.*.options.txt"') do set options_file=%%i&set options_file_exists=1
Exit /b

:progress
set progress_bar=
set /a real=%1/2
set /a mid=Real/2
for /l %%i in (1,1,%mid%) do set progress_bar=!progress_bar!``
exit /b


:delete_options_file
color 7
choice /c yn /m "Are you sure? yn" /n
if %errorlevel%==2 exit /b
echo:trying to erase settings
echo:.
del "%write_dir%\xxZhPuG.*.options.txt"
echo:..
if not exist "%write_dir%\%options_file%" echo ...Success&echo:&echo:press key&PAUSE >NUL
if exist "%write_dir%\%options_file%" echo File not deleted.&PAUSE
del "init.xxZhPuG.lock.1.conf.bak" 2>NUL
del "init.xxZhPuG.lock.2.conf.bak" 2>NUL
echo:please wait..
call :init
set juice=1
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

:monkey_dance
echo:working...
echo|set/p=
exit /b

:options
echo:>"init.xxZhPuG.lock.2.conf.bak"
if not defined checkedpowershell call ::checkpwsh & set checkedpowershell=1
set choose=0
if %revelation%==666 title Praise God^^^!
cls & (for /l %%i in (1,1,20) do echo:)&echo:    Opening Options..
set ran_check=1&if exist "%write_dir%\xxZhPuG.*.options.txt" for /f "delims=" %%i in ('dir /od /b "%write_dir%\xxZhPuG.*.options.txt"') do set options_file=%%i
set ran_check=1&if not exist "%write_dir%\xxZhPuG.*.options.txt" call :createoptions&goto input
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
cls
:reprintoptions
if %ran_check%==0 if exist "%write_dir%\xxZhPuG.*.options.txt" for /f "delims=" %%i in ('dir /od /b "%write_dir%\xxZhPuG.*.options.txt"') do set options_file=%%i
if %ran_check%==0 if not exist "%write_dir%\xxZhPuG.*.options.txt" call :createoptions&goto input
if %notchange%==1 set notchange=0&goto options
set special_symbol=---:
if %error% NEQ 6 if %error% NEQ 0 CALL set highlight%error%=%special_symbol%
if %error% NEQ 6 if %error% == 14 CALL set highlight6=%special_symbol%
if %error% NEQ 6 if %error% == 15 CALL set highlight7=%special_symbol%
if %error% NEQ 6 if %error% == 18 CALL set highlight10=%special_symbol%
if %error% NEQ 6 if %error% == 16 CALL set highlight8=%special_symbol%
if %error% NEQ 6 if %error% == 17 CALL set highlight9=%special_symbol%



echo                                                   {settings file} %options_file%
echo:           -----------------------------------
echo:            S = Scan
echo:            E to Edit Subnet = %prefix_range%
echo:            O 0ptions 
echo:            B Back
echo:          ------------------------------------
echo:     Enter Choice No.#                       Tk=Tick/Untick
echo:
echo:%highlight1%1. [%multi-file%] enable default save file name (multiple files generated)
echo:%highlight2%2. [%single-file%] enable default save file name (OVERWRITE^^^!)
echo:%highlight3%3. [%rangetick%] Remember Range
echo:%highlight4%4. [%subnettick%] Remember Subnet
echo:%highlight5%5. [%powershell_tick%] enable powershell %power_on%
echo:%highlight6%6. [%execution_tick%] UnAssisted Script execution
echo:%highlight7%7. [%profile_tick%] Enable Profiles
echo:%highlight8%8. Ping Speed (%ping_batch%) (Not persistent across Sessions)
echo:%highlight9%9. Backup
echo:%highlight10%Z. Clean Cache
echo:%highlight11%11.Inspiration
echo:     Filename: (!filename!)
echo:     Press C to Change filename
echo:  (D) Delete settings file, Reset settings
for /l %%i in (1,1,11) do CALL set highlight%%i=    &echo: >NUL
if "%pingspeednote%" NEQ "" echo %pingspeednote%&set pingspeednote=
:choice_options
if %error% == 17 call :backup
set notreally=0
choice /c 12345TseoDbck6789Z >NUL
set error=%errorlevel%
if %error% == 11 set juice=1&goto input
if %error% == 1 if %last_error% == 1  call :credits
if %error%==17 cls&goto :reprintoptions
if %error% == 18 call :clean_junk
if %error% == 16 set pingspeednote=Note: Increasing ping speed can result in slower script execution.
if %error% == 12  set /p filename=Enter a file name:&call :addfilename "!filename!"&set notchange=1&goto options
if %error% == 10 call :delete_options_file&set notchange=1&goto input
if %error% == 7 goto scan
if %error% == 8 goto enter_subnet
if %error% == 13 set error=6
if %error% == 6 if %error% == 0 goto options
if %error% == 11 goto input
if %error%==6 if %last_error% GTR 0 if %last_error% == 16 call :set_ping_speed
if %error%==6 if %last_error% GTR 0 if %last_error% == 1 call :addfile 2&set notchange=1&goto reprintoptions
if %error%==6 if %last_error% GTR 0 if %last_error% == 2 call :addfile 1&set notchange=1&goto reprintoptions
if %error%==6 if %last_error% GTR 0 if %last_error% == 3 call :saverange&set notchange=1&goto reprintoptions
if %error%==6 if %last_error% GTR 0 if %last_error% == 4 call :savesubnet&set notchange=1&goto reprintoptions
if %error%==6 if %last_error% GTR 0 if %last_error% == 5 call :setpowershell&set notchange=1&goto reprintoptions
if %error%==6 if %last_error% GTR 0 if %last_error% == 14 if %save_range% == 0 if %save_subnet% NEQ 0 echo:Both Remember Range and Remember Subnet must be enabled.&PAUSE
if %error%==6 if %last_error% GTR 0 if %last_error% == 14 if %save_subnet% == 0 if %save_range% NEQ 0 echo:Both Remember Range and Remember Subnet must be enabled.&PAUSE
if %error%==6 if %last_error% GTR 0 if %last_error% == 14 if %save_subnet% == 0 if %save_range% == 0 echo:Both Remember Range and Remember Subnet must be enabled.&PAUSE
if %error%==6 if %last_error% GTR 0 if %last_error% == 14 if %save_subnet% neq 0 if %save_range% neq 0 call :setscriptexecute&set notchange=1&goto reprintoptions
if %error%==6 if %last_error% GTR 0 if %last_error% == 15 call :setprofile&set notchange=1&goto reprintoptions
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
set diff=5

:input
set /a perc=pings*100/254
call :progress %perc%
set scrollc=0
if %pings% LSS 254 for %%a in (%scroll_text%) do set /a scrollc+=1&if !scrollc!==!scrolltextnow! if %error_of%==13 set label1=%%~a
set labely=
if %pings% GEQ 254 set label1=Maximum
if %pings% == 254 title Press Z,x,c ^^^! Range At Maximum&set labely=-MAX
if %pings% == 1 title Press 1,2,3 ^^^! Range is At Minimum&set labely=
set /a scrolltextnow+=1
if "%prefix_range%" NEQ "" (set prefix-label=%prefix_range%.) else (set prefix-label=)
if %scrolltextnow% GTR 4 set scrolltextnow=1
if %profile_status%==1 (set label5=P Profiles  &echo:>NUL) else (set label5=            &echo:>NUL)

if %juice%==1 (cls) else (title  !label1!&goto skip_labels)
if %options_file_exists%==1 echo:                                                                                {%options_file%}
echo: !labelx!       
echo: ###                                                                [6]%label8%^>  increase
echo: ###                                            decrease  ^<%label7%[1]   
echo:                                                                              M=maximum
echo: ping FROM %prefix-label%1                   to                     %prefix-label%{%pings%}   
echo:                      
echo: 1^|:!progress_bar!!pings!!labely!!progress_bar!:^|254            
echo:
if "!label1!" NEQ "" title  !label1!  & REM echo %perc% %diff%
echo: %label5%                     %label6%                                    
echo: :
if %options_file_exists%==1 (echo:Subnet:%prefix_range%.x   S-Start,O-Optional Settings) else (echo:S-Start,O-Optional Settings)
echo: _
echo: _
if !cchar! GTR 24 call :flash F
if %revelation% == 666 color F&echo:                   Jesus made mae do this. 
if %script_execute%==1 if %save_subnet%==1 cls&mode 60,20&color 0a&for /l %%i in (1,1,10) do echo Running Auto Mode...Press C Cancel
if %script_execute%==1 choice /c Ct /n /d t /t 3
if %script_execute%==1 if %errorlevel%==2 goto loop
if %script_execute%==1 if %errorlevel%==1 mode 120,30&goto options
if %profile_status%==1  echo: Profiles (P)  
if %profile_status%==1 (Call :process_profiles "entry")
:skip_labels
set /a choose+=1
set last_ping=%pings%
Set juice=0
choice /c s0615243oePUyM /n /t 3 /d y >nul
set error_of=%errorlevel%
set label1=
if %errorlevel%==3 set /a pings +=10&set label1=[ +10 ] o0.. INCREASING &set label7=&set label8=---
if %errorlevel%==4 set /a pings -=10&set label1=[ -10 ] Oo.. DECREASING &set label7=---&set label8=
if %errorlevel%==5 set /a pings +=5&set label1=[ +5 ] o0.. INCREASING &set label7=&set label8=---
if %errorlevel%==6 set /a pings -=5&set label1=[ -5 ] 0o.. DECREASING &set label7=---&set label8=
if %errorlevel%==7 set /a pings +=1&set label1=[ +1 ] oO.. INCREASING &set label7=&set label8=---
if %errorlevel%==8 set /a pings -=1&set label1=[ -1 ] Oo.. DECREASING &set label7=---&set label8=
if %errorlevel%==14 set pings=254&set juice=1
set /a struffof=error_of %% 2
if %error_of% LEQ 8 if %struffof% == 0 (set labelx=OOo_) else (set labelx=_oOO)
if %error_of%==1 goto scan
if %error_of%==2 cls&(for /l %%i in (1,1,20) do echo:)&echo:    Opening Options..&goto options
if %error_of%==9 cls&(for /l %%i in (1,1,20) do echo:)&echo:    Opening Options..&goto options
if %error_of%==10 goto enter_subnet
if %profile_status%==1 if %error_of%==11 goto entry
if %error_of% NEQ 7 if %error_of% NEQ 8 set /a semi_diff=0
if %pings% GEQ 254 set pings=254&set label1=.             ^|:::::::::::::[254]-MAX:::::::::::::^|
if %pings% LSS 1 set pings=1&set label1= Cannot decrease Range any more

if %last_error%==7 set /a semi_diff+=1
if %last_error%==8 set /a semi_diff+=1
set Last_error=%error_of%
set /a diff=semi_diff
if %error_of% NEQ 7 if %error_of% NEQ 8 set /a diff=pings-last_ping
if %error_of% NEQ 7 if %error_of% NEQ 8 if %diff% LSS 0 set /a diff=-diff
if %error_of% GEQ 3 if %error_of% LEQ 8 set juice=1
:after_profiles

goto input
:scan
cls
title  Review - ping master  ^^(*(oo)*)^^
echo:                       
if not defined PREFIX_RANGE goto enter_subnet
echo:,,
echo:, , ,          .
echo:. . ..    .   ..
echo:. . . .  ,.. .. ..
echo:===================================================:::^>     
echo:S to continue to Scanning I.P Addresses..^|         
echo:E = Edit Subnet ------------------------^>^|%prefix_range%            
echo:o Additional options     H:-change range ^|____________
echo:-----------------------------------------^|h=go back:::

choice /c seOh /m "" /n
if %errorlevel%==1 goto loop
if %errorlevel%==3 goto options
if %errorlevel%==4 set juice=1&goto after_profiles
:enter_subnet
REM set choose=0
cls
echo:press /enter\ for the default value
echo:..
if "%prefix_range%" == "" set PREFIX_RANGE=
echo: Enter Subnet
set /p PREFIX_RANGE=Subnet X.X.X:
if "%PREFIX_RANGE%"=="" set PREFIX_RANGE=192.168.1
if %powershellavlable%==1 for /f %%i in ('powershell -c "'%PREFIX_RANGE%' -match '^\d{1,3}[.]\d{1,3}[.]\d{1,3}$'"') do set state=%%i
if %powershellavlable%==1 if "%state%"=="True" set juice=1&goto input
if %powershellavlable%==0 echo %PREFIX_RANGE%|findstr /r "^[0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*$"&& (set juice=1&goto input) || (echo:bad format&goto :enter_subnet)
if "%state%"=="False"  powershell -c "write-host -nonewline TRY AGAIN!`r"&TIMEOUT 1 >nul & goto :enter_subnet
ECHO:
:loop
if not defined PREFIX_RANGE goto enter_subnet
del "%write_dir%\%totaluid%.online._.*.txt" 2>NUL
del "%write_dir%\%totaluid%.online.ip.*.txt" 2>NUL
timeout 1 >NUL
cls
:displyascii
title  ping master  ^^(*(oo)*)^^
echo:
echo:
echo:       _             _
echo:      (_)           (_)
echo: _ __  _ _ __   __ _ _ _ __   __ _
echo:^| '_ \^| ^| '_ \ / _` ^| ^| '_ \ / _` ^|
echo:^| ^|_) ^| ^| ^| ^| ^| (_^| ^| ^| ^| ^| ^| (_^| ^|_ _ _
echo:^| .__/^|_^|_^| ^|_^|\__, ^|_^|_^| ^|_^|\__, (_^|_^|_)
echo:^| ^|             __/ ^|         __/ ^|
echo:^|_^|            ^|___/         ^|___/
echo:            __       _                _         _
echo:            \ \     ^| ^|              (_)       ^| ^|
echo: ______ _____\ \    ^| ^|__   ___  __ _ _ _ __   ^| ^|
echo:^|______^|______^> ^>   ^| '_ \ / _ \/ _` ^| ^| '_ \  ^| ^|
echo:             / /    ^| ^|_) ^|  __/ (_^| ^| ^| ^| ^| ^| ^|_^|
echo:            /_/     ^|_.__/ \___^|\__, ^|_^|_^| ^|_^| (_)
echo:                                 __/ ^|
echo:                                ^|___/
echo:
echo:
echo:ASCII Art source:http://patorjk.com/

timeout 1 >NUL
:initial_start
set start_time=%date% %time%
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
set pingstotal=%pings%
for /f "delims=" %%i in ('ipconfig^| find /i "ipv4"') do goto there 
(echo: Computer internet not working?&timeout 5 >NUL)
:there
set /a clearcounter+=1
set /a clearcountermodulus=clearcounter %% 20
set /a absent=present-ping_batch
if %absent% LSS 1 set absent=1
call :updatevars
if %begun% NEQ 0 cls&echo:                                              &echo:            [%PREFIX_RANGE%.%absent%]-[%PREFIX_RANGE%.%present%]&echo:            Status: Sending requests..
for /l %%i in (%absent%,1,%present%) do start /min cmd /c "title %totaluid%xGUHHEJ-Ping_WINDOW&PING -n %ping_no% %PREFIX_RANGE%.%%i | findstr /i "[^<=^>][0-9]*ms"&&type nul>"%write_dir%\%totaluid%.online.ip.%%i.txt"&type nul>"%write_dir%\%totaluid%.online._.%%i.txt""
if %found% GEQ 1 echo:&echo FOUND&echo:[92mX[0m%found_ip%[92mX[0m&echo:&echo I.P(s) found = %skip_count%
if %percentage% LSS 80 (if %updatevariable% == 1 call :update_screen) else (call :update_screen)
set test_ip=0
if %skip_count% GEQ 1 for /f "skip=%skip_count% delims=" %%i in ('dir /b /od "%write_dir%\%totaluid%.online.ip.*.txt" 2^>NUL') do for /f "tokens=5 delims=." %%a in ("%%i") do set /a skip_count+=1&call :setfound %prefix_range%.%%a
if %skip_count% == 0 for /f "delims=" %%i in ('dir /b "%write_dir%\%totaluid%.online.ip.*.txt" 2^>NUL') do  for /f "tokens=5 delims=." %%a in ("%%i") do set /a skip_count+=1&call :setfound %prefix_range%.%%a
set /a present=absent-1
echo:
goto skip_ip
:update_screen
set /a percentage=pings_actual*100/(pings)
set var=Pinger Main Window: pinger     --%percentage% %%--
REM set var=!var:~0,%percentage%!
title !var!
exit /b
:updatevars
set /a ping_batch_var=pings-absent+1
for /f "tokens=1" %%i in ('dir "%write_dir%\%totaluid%.online._.*.txt" 2^>NUL ^| find "File(s)"') do set pings_actual=%%i&set begun=0&set /a remain=pingstotal-%%i&cls & echo:&echo:                                              &echo:            @ %PREFIX_RANGE%.%absent% - %PREFIX_RANGE%.%present% @&echo:            Status: Sending ping requests..&echo:            Completed:%%i Remaining:!remain! Found:!skip_count!&echo:&set /a updatevariable=clearcounter %% 2
exit /b
:setfound
set /a found+=1
if %present% LSS 1 echo:FOUND %~1
set found_ip=%found_ip% %~1,
exit /b
:update_screen_title
for /f "tokens=1" %%i in ('dir "%write_dir%\%totaluid%.online._.*.txt" 2^>NUL ^| find "File(s)"') do set pings_actual=%%i
set /a percentage=pings_actual*100/(pings)
set var=Pinger Main Window: pinger     --%percentage% %%--
REM set var=!var:~0,%percentage%!
title !var!
exit /b
:skip_ip
echo:
if %absent% == 0 goto wait
if %present% GEQ 1 goto there
if %present% == 0 set /a present=pings
:wait
if %skip_count% GEQ 1 for /f "skip=%skip_count% delims=" %%i in ('dir /b /od "%write_dir%\%totaluid%.online.ip.*.txt" 2^>NUL') do for /f "tokens=5 delims=." %%a in ("%%i") do set /a skip_count+=1&call :setfound %prefix_range%.%%a
if %skip_count% == 0 for /f "delims=" %%i in ('dir /b "%write_dir%\%totaluid%.online.ip.*.txt" 2^>NUL') do  for /f "tokens=5 delims=." %%a in ("%%i") do set /a skip_count+=1&call :setfound %prefix_range%.%%a
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
for /f "delims=" %%i in ('dir /b "%write_dir%\%totaluid%.online.ip.*.txt" 2^>NUL') do   for /f "tokens=5 delims=." %%a in ("%%i") do call :setfound %prefix_range%.%%a
echo:
echo: * List of I.P Addresses *%ip_online_disclaimer%
echo:that responded to requests
set found_ip=%found_ip: =%
if "%found_ip%" == "" set found_ip=No_Results.
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
set input_file_name=00
set /p input_file_name=Enter file name to save:
set input_file_name="%input_file_name:"=%.txt"
REM for /f "tokens=*" %%I in (!input_file_name!) do if "%%xI" NEQ ".txt" set input_file_name="%%~I.txt"
:continue-to-strip
set strip_file_name=%input_file_name:" ="%&set strip_file_name=%input_file_name: "="%
if !strip_file_name! NEQ !input_file_name! echo:striping input_file_name (!input_file_name!) =to= !strip_file_name!&echo|set/p=.&goto continue-to-strip
if !input_file_name! NEQ "00.txt" (echo Press a key to save !input_file_name!) else (echo:File will not be saved. No name mentioned.&pause&set juice=1&goto input)
pause >NUL
(if exist !input_file_name! echo: File name already exists.& set filename=!input_file_name!& call :check_file_name_exist & set input_file_name=!filename!& if exist !filename! goto skip_check_file_status2)
(if !input_file_name! NEQ "" echo: Writing ......)
:save_input_file_name
set found_ip=%found_ip: =%
set found_ip=%found_ip:~0,-1%
if !input_file_name! == "00" echo:Please set default filename from menu options.&pause >NUL&goto skip_check_file_status2
if %powershellavlable%==1 for /f "tokens=*" %%i in (%input_file_name%) do if "%%i" NEQ "" powershell -c "$ipString = \"%found_ip%\";$ipAddresses = $ipString -split ',\s*';function Get-LastOctet { param ( [string]$ip ) return [int]($ip.Split('.')[3]) };$sortedIpAddresses = $ipAddresses | Sort-Object { Get-LastOctet $_ };$sortedIpAddresses">"%%i" & echo:>>"%%i"&echo:          -  I.P Scan requested : %start_time%>>"%%i"&echo:          -  Generated @         : %date% %time%>>"%%i"&echo:              ^>^>^>   Subnet %prefix_range%.x, Upto %pings% ^<^<^<>>"%%i"&echo:%computer_string%>>"%%i"
if %powershellavlable%==0 for /f "tokens=*" %%i in (%input_file_name%) do if "%%i" NEQ "" echo WRITING to FILE...&(echo|set/p=>"%%i"&for %%a in (%found_ip%) do echo %%a >>"%%i")&echo:>>"%%i"&echo:         -  I.P Scan requested : %start_time%>>"%%i"&echo:         -  Generated @         : %date% %time%>>"%%i"&echo:              ^>^>^>   Subnet %prefix_range%.x, Upto %pings% ^<^<^<>>"%%i"&echo:%computer_string%>>"%%i"
if %scripT_execute% == 1 echo Script Execute Complete & timeout 4 >NUL & goto :eof
:after_save
if %powershellavlable%==1 if exist !input_file_name! echo:&echo Written to !input_file_name! [error_code:%errorlevel%]
if %powershellavlable%==0 if exist !input_file_name! echo Written (!input_file_name!)
echo:&echo:press key&pause >NUL
:skip_check_file_status2
set choose=0
if %profile_status%==1 choice /c yn /m "Save Profile?" /n /d n /t 4
if %profile_status%==1 if %errorlevel%==1 set /p enterprofilename=Enter friendly name:&call :add_profile "!enterprofilename!"
call :init
set juice=1&goto input
:save_file_default_file_name
if !input_file_name! == "00" echo:Please set default filename from menu options.&timeout 4 >NUL&goto skip_check_file_status2
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
REM echo:you got saved
exit /b

:flash
color %1
ping -n 1 localhost >NUL
color 7
exit /b

:credits
cls
echo:
echo:
echo:
echo:
echo:
echo:
echo:
echo:                      ------------------------------------------------------------------------------
echo:                     ^| And there were flashed of lightning and sounds and peals of thunder;        ^|
echo:                     ^| And his appearance was like lightning, and his clothing as white as snow.   ^|
echo:                     ^|                 .                                                           ^|
echo:                       -*---000------------------------------------------------------------000---*-
echo:                      Source: https://bible.knowing-jesus.com/topics/Lightning
echo:
echo:
echo:
echo:
echo:
pause >NUL
exit /b
