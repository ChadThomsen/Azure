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

#Remove resource groups and all child items in the groups.
$resourcegroups = Get-AzResourceGroup
foreach($resourcegroup in $resourcegroups){
   if($resourcegroup.ResourceGroupName -ne $keepresouregroup){
       remove-azresourcegroup -Name $resourcegroup.ResourceGroupName -Force -Verbose 
   }
}

#Delete File Sync
    #Does the sync service exist? 
        #Unregister server
        #Delete Cloud Server endpoint. 
        #Delete sync group
        #Delete Storage Sync Services

write-host "All resources have been deleted from Azure."