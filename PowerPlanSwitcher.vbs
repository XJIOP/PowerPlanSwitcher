Set oShell = CreateObject ("Wscript.Shell") 
Dim strArgs
strArgs = "cmd /c PowerPlanSwitcher.bat"
oShell.Run strArgs, 0, false