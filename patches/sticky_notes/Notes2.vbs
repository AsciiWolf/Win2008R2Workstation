Set oShell = CreateObject( "WScript.Shell" )
env=oShell.ExpandEnvironmentStrings("%ProgramData%")

File = env &"\Microsoft\Windows\Start Menu\Programs\Accessories\desktop.ini"
Text = "Sticky Notes.lnk=@%SystemRoot%\system32\SNTSearch.dll,-505"

Set fso = CreateObject("Scripting.FilesystemObject")
arrFile = SPLIT(fso.GetFile(File).OpenAsTextStream(1, -1).ReadAll,vbCrLf)
For line = UBOUND(arrFile) To 0 Step -1
If arrFile(line) = Text Then Wscript.Quit
Next  
Set ts =  fso.GetFile(File).OpenAsTextStream(8, -1)
ts.WriteLine()
ts.WriteLine(Text)
ts.close