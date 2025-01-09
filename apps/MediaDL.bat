:: ===============================================================================
:: ======================= THIS APP/GUI WAS DEVELOPED BY =========================
:: ===============================================================================
:: n0stal6ic#0001 -   Discord
:: nostalgic.cc   -   Website
:: n0stal6ic      -   Anything Else
:: ===============================================================================
:: ================= THIS APP USES 3RD PARTY LIBRARIES TO OPERATE ================
:: ===============================================================================
:: youtube-dl     -   https://youtube-dl.org/
:: ffmpeg         -   https://www.ffmpeg.org/
:: yt-dlp         -   https://github.com/yt-dlp/yt-dlp
:: ===============================================================================
:: ================ If you are reading this, hellooooo hiiiiiiiiii ===============
:: ===============================================================================
::
:: -------------------------------------------------- Setting up the window
@echo off
title Media Downloader
color B
mode con cols=40 lines=3
cls
:: -------------------------------------------------- Checks for libraries
:checkifexistdir
if exist ytdir.yt (
	set /p ytdir=<ytdir.yt
	attrib +r +h +s ytdir.yt
    goto direxists
) else (
    set ytdir=C:\youtube-dl\
	if not exist C:\youtube-dl\ goto ytdlni
	goto direxists
)
:direxists
cd %ytdir%
if not exist %ytdir% goto ytdlni
if not exist %ytdir%\youtube-dl.exe goto ytdlni
color 0a
goto settingscheck
:: -------------------------------------------------- Checks for user settings
:settingscheck
:: ADD SHIT HERE
set downloader=yt-dlp.exe
set downloaddir=%USERPROFILE%\Desktop
set batfiledir=%cd%
::set iosqualityspoof=--extractor-args "youtube:player_client=default,ios"
:: Fix Below Please ----------------------- And Above lol
::set albumart=--embed-thumbnail
::set albumartwrite=--write-thumbnail
::set addmeta=--add-metadata
set cookies=--cookies-from-browser chrome
goto start
:: -------------------------------------------------- Starts the introduction
:startcls
cls
:start
mode con cols=50 lines=5
color 0a
echo Paste URL:
echo.
set /p url="> "
goto formatdownload
:: -------------------------------------------------- Refresh after finishing a command
:formatdownloadcls
cls
:: -------------------------------------------------- The second page
:formatdownload
mode con cols=40 lines=15
color 0a
cls
echo What would you like to download?
echo.
echo [O] Original
echo [V] Video Only
echo [A] Audio Only
echo [P] YT Playlist ID
echo [C] Custom Command
echo.
echo [S] Settings
echo [X] Clear Cache
echo [D] Factory Reset
echo [1] Credits
echo.
set /p input= "> " 
if %input%==O goto downloadboth
if %input%==V goto downloadvideo
if %input%==A goto downloadaudio
if %input%==P goto downloadplaylist
if %input%==o goto downloadboth
if %input%==v goto downloadvideo
if %input%==a goto downloadaudio
if %input%==p goto downloadplaylist
if %input%==C goto custom
if %input%==c goto custom
if %input%==D goto uninstallytdl
if %input%==d goto uninstallytdl
if %input%==X goto clearcache
if %input%==x goto clearcache
if %input%==s goto settings
if %input%==S goto settings
if %input%==1 goto credits
if %input%==stop goto exit
if %input%==quit goto exit
if %input%==exit goto exit
cls
color 4
echo Invalid Input...
timeout 2 >nul
goto formatdownloadcls
exit
:: -------------------------------------------------- Settings page
:downloadoptions
:settings
cls
mode con cols=40 lines=14
color 0a
cls
echo Settings
echo.
echo [Y] Force YT-DLP
echo [2] Force YouTube-DL
echo [A] Embed Album Art
echo [R] Download Album Art
echo [S] Embed Subtitles
echo [X] Download Subtitles
echo [M] Add Metadata
echo.
echo [R] Reset Settings
echo.
set /p inputs= "> " 
if %inputs%==A goto downloadboth
if %inputs%==a goto downloadboth
if %inputs%==S goto wip
if %inputs%==s goto wip
if %inputs%==R goto wip
if %inputs%==r goto wip
if %inputs%==stop goto exit
if %inputs%==quit goto exit
if %inputs%==exit goto exit
cls
color 4
echo Invalid Input...
timeout 2 >nul
goto formatdownloadcls
echo
:: -------------------------------------------------- Program Options (Deprecated)
:: :downloadoptions
:: cls
:: mode con cols=40 lines=13
:: color 0a
:: cls
:: echo Other Options
:: echo.
:: echo [1] Use YOUTUBE-DL
:: echo [2] Use YT-DLP
:: echo.
:: echo YT-DLP can be used to bypass
:: echo age restricted videos
:: echo amongst other things.
:: echo The default is set to
:: echo youtube-dl on launch.
:: echo. 
:: set /p inputdo= "> " 
:: if %inputdo%==1 set downloader=youtube-dl.exe
:: if %inputdo%==2 set downloader=yt-dlp.exe
:: timeout 1 >nul
:: cls
:: goto formatdownloadcls
:: -------------------------------------------------- App Credits
:credits
cls
mode con cols=40 lines=16
color 0a
cls
echo App Credits
echo.
echo App Made By
echo n0stal6ic#0001 - Discord
echo https://n0stal6ic.com/
echo n0stal6ic
echo.
echo Libraries Used
echo ffmpeg     https://www.ffmpeg.org/
echo youtube-dl https://youtube-dl.org/
echo yt-dlp     https://github.com/yt-dlp
echo. 
pause
cls
goto formatdownloadcls
exit
:: -------------------------------------------------- Format Download Commands
:downloadaudio
mode con cols=54 lines=5
cls
echo Downloading Audio...
timeout 1 >nul
%downloader% -f bestaudio %albumart% -o "~/Desktop/%%(title)s.%%(ext)s" %url%
goto finished
:downloadvideo
mode con cols=54 lines=5
cls
echo Downloading Video...
timeout 1 >nul
%downloader% -f bestvideo -o "~/Desktop/%%(title)s.%%(ext)s" %url%
goto finished
:downloadplaylist
mode con cols=54 lines=5
cls
echo Downloading Playlist...
timeout 1 >nul
%downloader% -i -f bestvideo+bestaudio -o "~/Desktop/%%(title)s.%%(ext)s" --yes-playlist %url%
goto finished
:downloadboth
mode con cols=54 lines=5
cls
echo Downloading Original...
timeout 1 >nul
%downloader% -f bestvideo+bestaudio -o "~/Desktop/%%(title)s.%%(ext)s" %url%
goto finished
:: -------------------------------------------------- If null selection then choose other
:wip
cls
color 4
echo This is a WIP!
echo Please try again later.
timeout 2 >nul
goto startcls
:: -------------------------------------------------- If input is invalid
:invalidinput
cls
color 4
echo Invalid Input...
timeout 3 >nul
goto startcls
:: -------------------------------------------------- Finished the download
:finished
mode con cols=15 lines=2
cls
color 0a
echo Done!
timeout 2 >nul
:: bruh this is annoying remove this shit
:: explorer %downloaddir%
:: timeout 1 >nul
:: bruh this is annoying remove this shit
goto exit
:: -------------------------------------------------- Custom Commands
:custom
cls
mode con cols=60 lines=15
color 0a
cd %ytdir%
echo Set a custom command!
echo (ffmpeg "values here")
echo (youtube-dl "values here")
echo.
timeout 1 >nul
set /p customyt= "> "
%customyt%
echo.
goto finished 
:: -------------------------------------------------- Instalation of Libraries
:ytdlni
mode con cols=40 lines=8
cls
color 4
title Installation Wizard
echo Brand New Installation Setup
echo.
echo [1] Auto Install
echo [2] Manual Install
echo [3] Set Custom Directory
echo.
timeout 1 >nul
set /p ytdlzip= "> " 
cls
mode con cols=82 lines=10
echo Downloading...
if %ytdlzip%==1 goto dlzip
if %ytdlzip%==2 start https://ffmpeg.org/download.html
if %ytdlzip%==2 start https://github.com/yt-dlp/yt-dlp
if %ytdlzip%==2 start https://youtube-dl.org/
if %ytdlzip%==3 goto newdirloc
exit
:enddlzip
timeout 2 >nul
cls
exit
:dlzip
md C:\youtube-dl
md C:\youtube-dl\settings
cls
echo Installing Required Libraries...
powershell -command "start-bitstransfer -source https://cdn.discordapp.com/attachments/1161852044974493756/1171078916316868618/ffmpeg.exe -destination C:\youtube-dl\ffmpeg.exe"
::powershell -command "start-bitstransfer -source https://github.com/ytdl-org/youtube-dl/releases/download/2021.02.10/youtube-dl.exe -destination C:\youtube-dl\youtube-dl.exe"
powershell -command "start-bitstransfer -source https://github.com/yt-dlp/yt-dlp/releases/download/2024.05.27/yt-dlp.exe -destination C:\youtube-dl\yt-dlp.exe"
attrib -r -h -s ytdir.yt
cls
del ytdir.yt
cls
goto enddlzip
:: -------------------------------------------------- Set new directory for libraries
:newdirloc
cls
color 0a
mode con cols=45 lines=5
echo Set your new directory!
echo (C:\Folder1\)
echo.
set /p ytdir= "> "
echo %ytdir% >> ytdir.yt
timeout 1 >nul
cls
echo New Directory Set!
attrib +r +h +s ytdir.yt
timeout 3 >nul
cls
goto checkifexistdir
:: -------------------------------------------------- Clear program cache
:clearcache
cls
cd /D "%~dp0"
cls
attrib -r -h -s ytdir.yt
cls
echo Clearing...
timeout 2 >nul
del ytdir.yt
goto cleared
:: -------------------------------------------------- Uninstalling libraries
:uninstallytdl
cls
echo Uninstalling assets...
echo Please Wait...
timeout 4 >nul
@RD /S /Q "C:\youtube-dl"
cls
@RD /S /Q "C:\ffmpeg"
cls
@RD /S /Q "%ytdir%"
cls
echo Clearing Cache...
timeout 3 >nul
attrib -r -h -s ytdir.yt
del ytdir.yt
cls
echo Uninstalled!
timeout 3 >nul
exit
:cleared
cls
color 0a
echo Cleared!
timeout 3 >nul
cls
goto formatdownload
:: -------------------------------------------------- Exit the app
:exit
timeout 2 >nul
exit
:fastexit
exit
