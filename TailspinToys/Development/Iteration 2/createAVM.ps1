Get-AzureSubscription | select SubscriptionName
$SubscriptionName= ‘Visual Studio Enterprise with MSDN'
# Create-Azurevm.ps1 
# This script creates an azure VM 
# Set Values 
# VM Label we are looking for 
$label          = 'Windows Server 2012 R2 Datacenter, October 2015' 
#vm and vmservice names 
$vmname         = 'AppDeploy' 
$vmservicename  = 'AppDeploy' 
# vm admin user and username 
$vmusername     = 'azureuser' 
$vmpassword     = 'P2ssw0rd' 
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

Set-AzureSubscription -Name "Visual Studio Enterprise with MSDN" -CurrentStorageAccountname "portalvhdszw76l9806bp5n"

New-AzureVMConfig -Name $vmname -Instance $vminstancesize -Image $imgnm `
| Add-AzureProvisioningConfig -Windows -AdminUser 'azureuser' -Pass $vmpassword `
| New-AzureVM -ServiceName 'AppDeploy' -Location $vmlocation 