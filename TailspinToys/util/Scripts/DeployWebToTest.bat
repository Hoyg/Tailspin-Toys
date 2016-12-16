C:\Windows\System32\Inetsrv\appcmd.exe recycle apppool Tailspin
"C:\Program Files\IIS\Microsoft Web Deploy\msdeploy.exe" -verb:sync -source:package=%1 -dest:auto
pause