@echo off
cls
color 1f
echo  http://www.win2008r2workstation.com/ presents:
echo ======================================================================
echo  Games Explorer (and gameux.dll) installer for Windows Server 2008 R2
echo  By AsciiWolf - http://asciiwolf.com/
echo ======================================================================
echo.
echo [+] Press any key to start the installation...
pause>nul
echo [+] Installing Games Explorer (and gameux.dll)...
xcopy /E /I /Y "files\System32" "%SystemRoot%\System32">nul
xcopy /E /I /Y "files\SysWOW64" "%SystemRoot%\SysWOW64">nul
xcopy /E /I /Y "files\Games" "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Games">nul
attrib +s +h "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Games\desktop.ini" /s>nul
attrib +r "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Games">nul
echo [+] Registering Games Explorer (and gameux.dll)...
"%SystemRoot%\System32\regsvr32" /s "%SystemRoot%\System32\gameux.dll">nul
"%SystemRoot%\SysWOW64\regsvr32" /s "%SystemRoot%\SysWOW64\gameux.dll">nul
reg import files\gamesexplorer.reg>nul 2>nul
pushd %SystemRoot%\System32\wbem
"%SystemRoot%\System32\wbem\mofcomp.exe" "WgxInstalledGame.mof">nul
popd
pushd %SystemRoot%\System32\wbem\en-US
"%SystemRoot%\System32\wbem\mofcomp.exe" "WgxInstalledGame.mfl">nul
popd
pushd %SystemRoot%\SysWOW64\wbem
"%SystemRoot%\SysWOW64\wbem\mofcomp.exe" "WgxInstalledGame.mof">nul
popd
pushd %SystemRoot%\SysWOW64\wbem\en-US
"%SystemRoot%\SysWOW64\wbem\mofcomp.exe" "WgxInstalledGame.mfl">nul
popd
if %errorlevel% NEQ 0 goto error
echo [+] Games Explorer (and gameux.dll) installed successfully!
goto end

:error
echo [-] Installation failed! Are you running the installation as Administrator?

:end
echo [+] Press any key to exit the installer...
pause>nul
color