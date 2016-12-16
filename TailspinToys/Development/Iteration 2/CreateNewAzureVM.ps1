##https://azure.microsoft.com/en-in/documentation/articles/virtual-machines-ps-create-preconfigure-windows-vms/##

$subscr="Visual Studio Enterprise with MSDN"
$staccount="portalvhds74mfrmcdyht17"
Select-AzureSubscription -SubscriptionName $subscr –Current
Set-AzureSubscription -SubscriptionName $subscr -CurrentStorageAccountName $staccount
$vmname="DevDeployment"
$vmsize="Small"
$family="Windows Server 2012 R2 Datacenter"
$image=Get-AzureVMImage | where { $_.ImageFamily -eq $family } | sort PublishedDate -Descending | select -ExpandProperty ImageName -First 1
$vm1=New-AzureVMConfig -Name $vmname -InstanceSize $vmsize -ImageName $image
$svcname="mtreevm"
$vnetname="azurevnet"
$cred=Get-Credential -Message "Type the name and password of the local administrator account"
$vm1 | Add-AzureProvisioningConfig -Windows -AdminUsername $cred.GetNetworkCredential().Username -Password $cred.GetNetworkCredential().Password
$vm1 | Set-AzureSubnet -SubnetNames "Subnet-1"
New-AzureVM -ServiceName $svcname -VMs $vm1