@echo off
cls
color 1f
echo      http://www.win2008r2workstation.com/ presents:
echo =============================================================
echo  Windows 7 Sticky Notes installer for Windows Server 2008 R2
echo  By AsciiWolf - http://asciiwolf.com/
echo =============================================================
echo.
echo [+] Press any key to start the installation...
pause>nul
echo [+] Copying Sticky Notes files to "%ProgramFiles%\Sticky Notes" and SNTSearch.dll to %SystemRoot%\System32 ...
xcopy /E /I /Y "x64\Sticky Notes" "%ProgramFiles%\Sticky Notes">nul
xcopy /E /I /Y "x64\System32" "%SystemRoot%\System32">nul
if %errorlevel% NEQ 0 goto error
echo [+] Creating "Sticky Notes" shortcut in the Start menu...
xcopy /Y "Sticky Notes.lnk" "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Accessories\">nul
wscript Notes1.vbs
wscript Notes2.vbs
if %errorlevel% NEQ 0 goto error
pushd "%ProgramData%\Microsoft\Windows\Start Menu\Programs\"
attrib +r Accessories
popd
echo [+] Windows 7 Sticky Notes installed successfully!
goto end

:error
echo [-] Installation failed! Are you running the installation as Administrator?

:end
echo [+] Press any key to exit the installer...
pause>nul
color