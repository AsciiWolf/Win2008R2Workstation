@echo off
cls
color 1f
echo        http://www.win2008r2workstation.com/ presents:
echo =========================================================
echo  Windows 7 Broadcast Driver Architecture (BDA) installer
echo  for Windows Server 2008 R2
echo  By AsciiWolf - http://asciiwolf.com/
echo =========================================================
echo.
echo [+] Press any key to start the installation...
pause>nul
echo [+] Installing Windows 7 BDA...
xcopy /E /I /Y "files\x64" "%SystemRoot%\System32">nul
xcopy /E /I /Y "files\x86" "%SystemRoot%\SysWOW64">nul
echo [+] Registering Windows 7 BDA...
pushd %windir%\SysWOW64
regsvr32 /s bdaplgin.ax
regsvr32 /s kstvtune.ax
regsvr32 /s ksxbar.ax
regsvr32 /s Mpeg2Data.ax
regsvr32 /s MSDvbNP.ax
regsvr32 /s MSNP.ax
regsvr32 /s MSVidCtl.dll
regsvr32 /s psisdecd.dll
regsvr32 /s psisrndr.ax
regsvr32 /s VBICodec.ax
regsvr32 /s vbisurf.ax
regsvr32 /s WSTPager.ax
regsvr32 /s EncDec.dll
popd
pushd %windir%\System32
regsvr32 /s bdaplgin.ax
regsvr32 /s kstvtune.ax
regsvr32 /s ksxbar.ax
regsvr32 /s Mpeg2Data.ax
regsvr32 /s MSDvbNP.ax
regsvr32 /s MSNP.ax
regsvr32 /s MSVidCtl.dll
regsvr32 /s psisdecd.dll
regsvr32 /s psisrndr.ax
regsvr32 /s VBICodec.ax
regsvr32 /s vbisurf.ax
regsvr32 /s WSTPager.ax
regsvr32 /s EncDec.dll
popd
reg import files\bda.reg>nul 2>nul
if %errorlevel% NEQ 0 goto error
echo [+] Windows 7 BDA installed successfully!
goto end

:error
echo [-] Installation failed! Are you running the installation as Administrator?

:end
echo [+] Press any key to exit the installer...
pause>nul
color