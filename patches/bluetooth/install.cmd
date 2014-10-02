@echo off
cls
color 1f
echo        http://www.win2008r2workstation.com/ presents:
echo ================================================================
echo  Windows 7 Bluetooth Stack installer for Windows Server 2008 R2
echo  By AsciiWolf - http://asciiwolf.com/
echo ================================================================
echo.
echo [+] Press any key to start the installation...
echo [!] This installer will enable Test Mode, which means you can install any self-signed driver.
pause>nul
echo [+] Installing Windows 7 Bluetooth Stack...
xcopy /E /I /Y "files\inf" "%SystemRoot%\inf">nul
xcopy /E /I /Y "files\System32" "%SystemRoot%\System32">nul
xcopy /E /I /Y "files\SysWOW64" "%SystemRoot%\SysWOW64">nul
echo [+] Registering Windows 7 Bluetooth Stack...
pushd %windir%\SysWOW64
regsvr32 /s fdBthProxy.dll
regsvr32 /s btpanui.dll
popd
pushd %windir%\System32
regsvr32 /s BthpanContextHandler.dll
regsvr32 /s fdBthProxy.dll
regsvr32 /s btpanui.dll
popd
files\SetACL.exe -on "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\don't load" -ot reg -actn setowner -ownr "n:Administrators;s:n">nul
files\SetACL.exe -on "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Control Panel\don't load" -ot reg -actn ace -ace "n:Administrators;p:full">nul
files\SetACL.exe -on "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Control Panel\don't load" -ot reg -actn setowner -ownr "n:Administrators;s:n">nul
files\SetACL.exe -on "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Control Panel\don't load" -ot reg -actn ace -ace "n:Administrators;p:full">nul
files\SetACL.exe -on "HKLM\SOFTWARE\Microsoft\Function Discovery\Categories\Layered\Microsoft.Devices.FunctionEnumerators" -ot reg -actn setowner -ownr "n:Administrators;s:n">nul
files\SetACL.exe -on "HKLM\SOFTWARE\Microsoft\Function Discovery\Categories\Layered\Microsoft.Devices.FunctionEnumerators" -ot reg -actn ace -ace "n:Administrators;p:full">nul
reg import files\bth.reg>nul 2>nul
schtasks /Create /tn Microsoft\Windows\Bluetooth\UninstallDeviceTask /XML files\UninstallDeviceTask.xml>nul
bcdedit /set testsigning on>nul
if %errorlevel% NEQ 0 goto error
echo [+] Windows 7 Bluetooth Stack installed successfully!
echo [!] The Remove Watermark patcher will be launched now. It will remove desktop "Test Mode" watermark.
echo [!] If you want to apply this patch, choose "Y" (Yes).
files\RemoveWatermarkX64.exe>nul
goto end

:error
echo [-] Installation failed! Are you running the installation as Administrator?

:end
echo [+] Press any key to exit the installer...
pause>nul
color