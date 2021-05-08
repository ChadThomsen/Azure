<#
This creates a lab to play with
CMT 13-April-2021

Why is "networkwatcher east-us" created? Is this done automatically?
#>
$rgname = "Lab1"
$location = "East US"

#Create a resource group
New-AzResourceGroup -Name $rgname -Location $location

#Create Public IPs
$PubIP = New-AzPublicIpAddress -Name "PublicIP" -ResourceGroupName $rgname `
    -Location $location -Sku "Standard" -IdleTimeoutInMinutes 4 -AllocationMethod "static"

#Create VNets and apply NSGs
$chadnet = New-AzVirtualNetwork -Name "Chad-net" -Location $location -ResourceGroupName $rgname -AddressPrefix "10.0.0.0/16"
$michaelnet = New-AzVirtualNetwork -Name "Michael-net" -Location $location -ResourceGroupName $rgname -AddressPrefix "10.1.0.0/16"

#Create Subnets
$chadsub = Add-AzVirtualNetworkSubnetConfig -AddressPrefix "10.0.0.0/24" -Name "Chad" -virtualnetwork $chadnet
$michaelsub = Add-AzVirtualNetworkSubnetConfig -AddressPrefix "10.1.0.0/24" -Name "Michael" -virtualnetwork $michaelnet

#Associate Subnets with virtual networks
Set-AzVirtualNetwork -VirtualNetwork $chadnet
Set-AzVirtualNetwork -VirtualNetwork $michaelnet

#Create Network Security Group and Rules

#Create VMs   
#New-AzVM -Name "Chad-VM" -AddressPrefix  

#Add locks

#Create Bastion Host


