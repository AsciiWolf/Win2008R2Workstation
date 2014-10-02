@echo off
cls
color 1f
echo  http://www.win2008r2workstation.com/ presents:
echo ======================================================
echo  xinput9_1_0.dll installer for Windows Server 2008 R2
echo  By AsciiWolf - http://asciiwolf.com/
echo ======================================================
echo.
echo [+] Press any key to start the installation...
pause>nul
echo [+] Installing 64bit xinput9_1_0.dll...
pushd x64
infinst.exe xinput9_1_0_x64.inf, Install_Driver
popd
xcopy /Y "x64\xinput9_1_0.dll" "%SystemRoot%\System32">nul
xcopy /Y "x64\en-US\xinput9_1_0.dll.mui" "%SystemRoot%\System32\en-US">nul
xcopy /Y "x64\xinput9_1_0_x64.cat" "%SystemRoot%\System32">nul
xcopy /Y "x64\xinput9_1_0_x64.inf" "%SystemRoot%\System32">nul
if %errorlevel% NEQ 0 goto error
pushd %windir%\System32
InfDefaultInstall xinput9_1_0_x64.inf, x64_Install
del xinput9_1_0_x64.cat xinput9_1_0_x64.inf
if %errorlevel% NEQ 0 goto error
popd
echo [+] Installing 32bit xinput9_1_0.dll...
xcopy /Y "x86\xinput9_1_0.dll" "%SystemRoot%\SysWOW64">nul
xcopy /Y "x86\en-US\xinput9_1_0.dll.mui" "%SystemRoot%\SysWOW64\en-US">nul
xcopy /Y "x86\xinput9_1_0_x86.cat" "%SystemRoot%\SysWOW64">nul
xcopy /Y "x86\xinput9_1_0_x86.inf" "%SystemRoot%\SysWOW64">nul
if %errorlevel% NEQ 0 goto error
pushd %windir%\SysWOW64
InfDefaultInstall xinput9_1_0_x86.inf, x86_Install
del xinput9_1_0_x86.cat xinput9_1_0_x86.inf
if %errorlevel% NEQ 0 goto error
popd
echo [+] xinput9_1_0.dll installed successfully!
goto end

:error
echo [-] Installation failed! Are you running the installation as Administrator?

:end
echo [+] Press any key to exit the installer...
pause>nul
color