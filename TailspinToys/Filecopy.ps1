$AutoDeployDir = "$/Horizons/HorizonVSO/"
$deployDirectory = "\\AZURESQL2014\filecopy\"
    
    
#comment
# Add TFS 2013 dlls so we can download some files
[void][System.Reflection.Assembly]::LoadWithPartialName("Microsoft.TeamFoundation.Client")
[void][System.Reflection.Assembly]::LoadWithPartialName("Microsoft.TeamFoundation.VersionControl.Client")
$tfsCollectionUrl = "http://hoysalag.visualstudio.com/DefaultCollection"
$tfsCollection = New-Object -TypeName Microsoft.TeamFoundation.Client.TfsTeamProjectCollection -ArgumentList $tfsCollectionUrl
$tfsVersionControl = $tfsCollection.GetService([Microsoft.TeamFoundation.VersionControl.Client.VersionControlServer])


$tfsCollection = New-Object -TypeName Microsoft.TeamFoundation.Client.TfsTeamProjectCollection -ArgumentList $tfsCollectionUrl
$tfsVersionControl = $tfsCollection.GetService([Microsoft.TeamFoundation.VersionControl.Client.VersionControlServer])

# Register PowerShell commands
Add-PSSnapin Microsoft.TeamFoundation.PowerShell

# Get all directories and files in the AutoDeploy directory
$items = Get-TfsChildItem $AutoDeployDir -Recurse -Server $tfsCollection

# Download each item to a specific destination
foreach ($item in $items) {
    # Serverpath of the item
    Write-Host "TFS item to download:" $($item.ServerItem) -ForegroundColor Blue

    $destinationPath = $item.ServerItem.Replace($AutoDeployDir, $deployDirectory)
    Write-Host "Download to" $([IO.Path]::GetFullPath($destinationPath)) -ForegroundColor Blue

    if ($item.ItemType -eq "Folder") {
        New-Item $([IO.Path]::GetFullPath($destinationPath)) -ItemType Directory -Force
    }
    else {
        # Download the file (not folder) to destination directory
        $tfsVersionControl.DownloadFile($item.ServerItem, $([IO.Path]::GetFullPath($destinationPath)))
    }
}