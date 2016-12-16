Get-AzureSubscription | select SubscriptionName
$SubscriptionName= ‘Visual Studio Enterprise with MSDN'
# Create-Azurevm.ps1 
# This script creates an azure VM 
# Set Values 
# VM Label we are looking for 
$label          = 'Windows Server 2012 R2 Datacenter, October 2015' 
#vm and vmservice names 
$vmname         = 'App-SampleTest' 
$vmservicename  = 'App-SampleTest' 
# vm admin user and username 
$vmusername     = 'ecanaryAdmin' 
$vmpassword     = 'Canarys@123' 
# instance size and location 
$vminstancesize = 'Basic_A2' 
$vmlocation     = 'Southeast Asia'

# Next, create a credential for the VM 
$Username = "$vmname\$vmusername" 
$Password = ConvertTo-SecureString $vmpassword -AsPlainText -Force 
$VMcred = new-object system.management.automation.PSCredential $username,$Password

# Get all Azure VM images 
$imgs = get-AzureVMImage 

# Then get the latest image's image name 
$img = $imgs| where label -eq $label 
$imgnm = $img.imagename

# OK - do it and create the VM

New-AzureVMConfig -Name $vmname -Instance $vminstancesize -Image $imgnm `
| Add-AzureProvisioningConfig -Windows -AdminUser 'ecanaryAdmin' -Pass $vmpassword `
| New-AzureVM -ServiceName 'App-SampleTest' -Location $vmlocation

Get-AzureSubscription | select SubscriptionName
$SubscriptionName= ‘Visual Studio Enterprise with MSDN'
Get-AzureVMImage | select ImageName
$image='fb83b3509582419d99629ce476bcb5c8__SQL-Server-2012-SP2-11.0.5537.0-Ent-ENU-Win2012-cy14su08'
$dclocation=’Southeast Asia’
$storageaccount=’1sqlsa1‘
New-AzureStorageAccount -StorageAccountName $storageaccount -Location $dclocation
$cloudServiceName = ‘1SQL-SampleTest1‘
$dclocation = 'Southeast Asia'
New-AzureService -ServiceName $cloudServiceName -Label "1SQL-SampleTest1" -Location $dclocation
$UserName = ‘ecanarysAdmin‘ 
$Password = ‘Canarys@123‘
$virtual_name = ‘SQL-SampleTest‘
New-AzureVMConfig -Name $virtual_name –InstanceSize Medium –ImageName $image | Add-AzureProvisioningConfig -Windows -Password $Password –AdminUsername $UserName | New-AzureVM –ServiceName $cloudServiceName

Sleep -Seconds 1200

$port = Get-AzureEndpoint -Name PowerShell -VM (Get-AzureVM -ServiceName App-SampleTest -Name $vmname) | Select -ExpandProperty Port  

$user = "ecanaryAdmin"
$p = convertto-securestring -string "Canarys@123" -asplaintext -force
$cred = new-object System.Management.Automation.pscredential -argumentlist $user, $p

$sessionoption = New-PSSessionOption -SkipCACheck  

$session = new-pssession -ComputerName app-sampletest.cloudapp.net -credential $cred -Port $port -UseSSL -SessionOption $sessionoption -Verbose
Invoke-Command -Session $session  -ScriptBlock {Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools -Verbose} -Verbose

Stop-AzureVM -ServiceName "App-SampleTest" -Name "App-SampleTest" -Force
Stop-AzureVM -ServiceName "SQL-SampleTest" -Name "1SQL-SampleTest1" -Force