alias azls='az vm list -d -o table'

turn_azure_vm_on() {
    az vm start --name $1 --resource-group $2
    azls
}

turn_azure_vm_off() {
    az vm deallocate --name $1 --resource-group $2
    azls
}

check_azure_vm_subnet_and_ip() {
    vm_name=$1
    vm_resource_group=$2

    echo "Checking VM: $vm_name in Resource Group: $vm_resource_group..."
    network_interface_id=$(az vm show --resource-group $vm_resource_group --name $vm_name --query "networkProfile.networkInterfaces[0].id" -o tsv)
    
    az network nic show --ids $network_interface_id --query "{ip:ipConfigurations[0].privateIPAddress, subnet:ipConfigurations[0].subnet.id}" -o json

    echo ""
}