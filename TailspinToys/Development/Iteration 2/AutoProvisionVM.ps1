#$subscr="Visual Studio Enterprise with MSDN"

$staccount="portalvhdszw76l9806bp5n"

Select-AzureSubscription -SubscriptionName $subscr -Current

Set-AzureSubscription -SubscriptionName $subscr -CurrentStorageAccountName $staccount



Get-AzureVMImage | select ImageFamily -Unique

$family="Windows Server 2012 R2 Datacenter"

$image=Get-AzureVMImage | where { $_.ImageFamily -eq $family } | sort PublishedDate -Descending | select -ExpandProperty ImageName -First 1



$vmname="ecanary-Test"

$vmsize="Small"

$vm1=New-AzureVMConfig -Name $vmname -InstanceSize $vmsize -ImageName $image | Add-AzureProvisioningConfig -Windows -AdminUsername "ecanaryAdmin" -Password "Canarys@123"



New-AzureVM -ServiceName "autoprovm" -VMs $vm1
