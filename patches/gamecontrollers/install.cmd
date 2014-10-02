@echo off
cls
color 1f
echo        http://www.win2008r2workstation.com/ presents:      
echo ===========================================================
echo  Windows 7 Game Controllers Control Panel applet Installer
echo                                 for Windows Server 2008 R2
echo  By AsciiWolf - http://asciiwolf.com/
echo ===========================================================
echo.
echo [+] Press any key to start the installation...
pause>nul
echo [+] Copying x64 Game Controllers Control Panel applet...
xcopy /E /I /Y "x64" "%SystemRoot%\System32">nul
if %errorlevel% NEQ 0 goto error
echo [+] Copying x86 Game Controllers Control Panel applet...
xcopy /E /I /Y "x86" "%SystemRoot%\SysWOW64">nul
if %errorlevel% NEQ 0 goto error
echo [+] Game Controllers Control Panel applet installed successfully!
goto end

:error
echo [-] Installation failed! Are you running the installation as Administrator?

:end
echo [+] Press any key to exit the installer...
pause>nul
color
