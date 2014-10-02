@echo off
cls
color 1f
echo      http://www.win2008r2workstation.com/ presents:
echo ========================================================
echo  Windows 7 Sidebar installer for Windows Server 2008 R2
echo  By AsciiWolf - http://asciiwolf.com/
echo ========================================================
echo.
echo [+] Press any key to start the installation...
pause>nul
echo [+] Copying x64 Sidebar to "%ProgramFiles%\Windows Sidebar"...
xcopy /E /I /Y "files\x64\Windows Sidebar" "%ProgramFiles%\Windows Sidebar">nul
echo [+] Copying x86 Sidebar to "%ProgramFiles(x86)%\Windows Sidebar"...
xcopy /E /I /Y "files\x86\Windows Sidebar" "%ProgramFiles(x86)%\Windows Sidebar">nul
echo [+] Creating "Desktop Gadget Gallery" shortcut in the Start menu...
xcopy /Y "files\Sidebar.lnk" "%ProgramData%\Microsoft\Windows\Start Menu\Programs\">nul
wscript files\Sidebar1.vbs
wscript files\Sidebar2.vbs
if %errorlevel% NEQ 0 goto error
echo [+] Registering Sidebar...
pushd %ProgramFiles%\Windows Sidebar
%windir%\System32\regsvr32 /s sbdrop.dll
%windir%\System32\regsvr32 /s wlsrvc.dll
popd
pushd %ProgramFiles(x86)%\Windows Sidebar
%windir%\SysWOW64\regsvr32 /s sbdrop.dll
%windir%\SysWOW64\regsvr32 /s wlsrvc.dll
popd
reg import files\Sidebar.reg>nul 2>nul
"%ProgramFiles%\Windows Sidebar\sidebar.exe" /RegServer
"%ProgramFiles(x86)%\Windows Sidebar\sidebar.exe" /RegServer
if %errorlevel% NEQ 0 goto error
echo [+] Windows 7 Sidebar installed successfully!
goto end

:error
echo [-] Installation failed! Are you running the installation as Administrator?

:end
echo [+] Press any key to exit the installer...
pause>nul
color
