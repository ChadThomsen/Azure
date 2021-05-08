<#
Cleans up Azure Lab space.
This can take 10-20 minutes to run.
Paramaterize this and add a compouter shutdown option? 
CMT 13-APR-2021
#>

$resourcegroups = Get-AzResourceGroup
foreach($resourcegroup in $resourcegroups){
   if($resourcegroup.ResourceGroupName -ne "Diagnostics"){
       remove-azresourcegroup -Name $resourcegroup.ResourceGroupName -Force -Verbose
   }
}
write-host "All resourced deleted form Azure."