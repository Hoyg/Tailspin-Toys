C:\Windows\System32\Inetsrv\appcmd.exe recycle apppool Tailspin
cd "C:\Program Files\Microsoft Visual Studio 10.0\VSTSDB\Deploy"
vsdbcmd /Action:Deploy /ModelFile:C:\Scripts\baseline\Tailspin.Schema.dbschema /ManifestFile:C:\Scripts\baseline\Tailspin.Schema.deploymanifest /dd
pause