<#
This creates a lab to play with
CMT 13-April-2021
#>
$rgname = "Lab-1"

#Create a resource group
New-AzResourceGroup -Name $rgname -Location 'East US'

#Create Public IPs
$PubIP = New-AzPublicIpAddress -Name "Public-IP" -ResourceGroupName $rgname `
    -Location "eastus2" -Sku "Standard" -IdleTimeoutInMinutes 4 -AllocationMethod "static"

#Create VNets
New-AzVirtualNetwork -Name "Chad" -Location 'East US' -ResourceGroupName $rgname -AddressPrefix "10.0.0.0/16"
New-AzVirtualNetwork -Name "Michael" -Location 'East US' -ResourceGroupName $rgname -AddressPrefix "10.1.0.0/16"

#Create Subnets
$chadsub = New-AzVirtualNetworkSubnetConfig -AddressPrefix "10.0.0.0/24" -Name "Chad"
$michaelsub = New-AzVirtualNetworkSubnetConfig -AddressPrefix "10.0.0.0/24" -Name "Michael" 

#Create VMs   
#New-AzVM -Name "Chad-VM" -AddressPrefix  


#Add locks

#Create Bastion Host


