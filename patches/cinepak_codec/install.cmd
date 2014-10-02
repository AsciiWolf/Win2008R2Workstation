@echo off
cls
color 1f
echo        http://www.win2008r2workstation.com/ presents:
echo ==============================================================
echo  Windows 7 Cinepak Codec installer for Windows Server 2008 R2
echo  By AsciiWolf - http://asciiwolf.com/
echo ==============================================================
echo.
echo [+] Press any key to start the installation...
pause>nul
xcopy /E /I /Y "x86" "%SystemRoot%\SysWOW64">nul
reg import iccvid.reg>nul 2>&1
if %errorlevel% NEQ 0 goto error
echo [+] Cinepak Codec installed successfully!
goto end

:error
echo [-] Installation failed! Are you running the installation as Administrator?

:end
echo [+] Press any key to exit the installer...
pause>nul
color