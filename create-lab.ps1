<#
This creates a lab to play with
CMT 13-April-2021
#>

#Create a resource group
New-AzResourceGroup -Name "Lab-1" -Location 'East US'

#Create VNets
New-AzVirtualNetwork -Name "Chad" -Location 'East US' -ResourceGroupName "Lab-1" -AddressPrefix "10.0.0.0/16"
New-AzVirtualNetwork -Name "Michael" -Location 'East US' -ResourceGroupName "Lab-1" -AddressPrefix "10.1.0.0/16"

#Create Subnets
New-AzVirtualNetworkSubnetConfig -AddressPrefix "10.0.0.0/24" -Name "Chad-0" -

#Create VMs
New-AzVM -Name "Chad-VM" -


#Add locks

#Create Bastion Host


