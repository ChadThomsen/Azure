<#
Cleans up Azure Lab space.
This can take 10-20 minutes to run.
Paramaterize this and add a compouter shutdown option? 
CMT 13-APR-2021
#>

$keepresouregroup = "Tools"
$keeplock = Get-AzResourceLock | Where-Object {$_.name -contains "Tools"}

#Find and remove locks.
$locks = Get-AzResourceLock 
foreach($lock in $locks){
    if($lock -ne $keeplock){
        Remove-AzResourceLock -Lockid $lock.Lockid -Force
    }
}

#Remove resoruce groups and all child items in the groups.
$resourcegroups = Get-AzResourceGroup
foreach($resourcegroup in $resourcegroups){
   if($resourcegroup.ResourceGroupName -ne $keepresouregroup){
       remove-azresourcegroup -Name $resourcegroup.ResourceGroupName -Force -Verbose 
   }
}
write-host "All resourced deleted from Azure."