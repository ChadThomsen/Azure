<#
This deletes all resource groups and their childern
CMT 12-April-2021
#>

$resourcegroupids = get-azresourcegroup * get-az