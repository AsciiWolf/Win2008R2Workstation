@echo off
cls
color 1f
echo        http://www.win2008r2workstation.com/ presents:
echo ======================================================
echo  Windows 7 Display Color Calibration installer
echo                     for Windows Server 2008 R2
echo  By AsciiWolf - http://asciiwolf.com/
echo ======================================================
echo.
echo [+] Press any key to start the installation...
pause>nul
echo [+] Installing Windows 7 Display Color Calibration...
xcopy /E /I /Y "files\System32" "%SystemRoot%\System32">nul
xcopy /E /I /Y "files\SysWOW64" "%SystemRoot%\SysWOW64">nul
echo [+] Registering Windows 7 Display Color Calibration...
reg import calibration.reg>nul 2>nul
if %errorlevel% NEQ 0 goto error
echo [+] Windows 7 Display Color Calibration installed successfully!
goto end

:error
echo [-] Installation failed! Are you running the installation as Administrator?

:end
echo [+] Press any key to exit the installer...
pause>nul
color