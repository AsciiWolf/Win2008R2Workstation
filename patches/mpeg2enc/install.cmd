@echo off
cls
color 1f
echo      http://www.win2008r2workstation.com/ presents:
echo ===============================================================
echo  Microsoft MPEG-2 Encoder installer for Windows Server 2008 R2
echo  By AsciiWolf - http://asciiwolf.com/
echo ===============================================================
echo.
echo [+] Press any key to start the installation...
pause>nul
echo [+] Installing Microsoft MPEG-2 Encoder...
xcopy /E /I /Y "files\x64" "%SystemRoot%\System32">nul
xcopy /E /I /Y "files\x86" "%SystemRoot%\SysWOW64">nul
echo [+] Registering Microsoft MPEG-2 Encoder...
reg import files\mpeg2enc.reg>nul 2>nul
if %errorlevel% NEQ 0 goto error
echo [+] Microsoft MPEG-2 Encoder installed successfully!
goto end

:error
echo [-] Installation failed! Are you running the installation as Administrator?

:end
echo [+] Press any key to exit the installer...
pause>nul
color
