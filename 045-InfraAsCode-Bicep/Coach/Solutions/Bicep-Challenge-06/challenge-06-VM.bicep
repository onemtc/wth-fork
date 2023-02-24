//Password for the VM
@secure()
param adminPassword string

//Username for the VM
param adminUsername string

//Resource Prefix for all VM Resources
param resourcePrefix string = 'bicepwth'

//The Ubuntu version for the VM. This will pick a fully patched image of this given Ubuntu version. Allowed values: 12.04.5-LTS, 14.04.2-LTS, 15.10.
@allowed([
  '16.04.0-LTS'
  '18.04-LTS'
])
param ubuntuOSVersion string = '18.04-LTS'

// Subnet Name
param subnetName string = 'Default'

var vnetName_var = '${resourcePrefix}-VNET'
var nicName_var = '${resourcePrefix}-VM-NIC'
var vmName_var = '${resourcePrefix}-VM'
var publicIPAddressName_var = '${resourcePrefix}-PIP'
var publicIPAddressType = 'Dynamic'
var dnsNameForPublicIP = '${resourcePrefix}${uniqueString(resourceGroup().id)}-pip'
var subnetRef = '${vnetName.id}/subnets/${subnetName}'
var vmSize = 'Standard_DS2_v2'
var imagePublisher = 'Canonical'
var imageOffer = 'UbuntuServer'

//Start of resource section for creating VM

resource vnetName 'Microsoft.Network/virtualNetworks@2022-07-01' existing = {
  name: vnetName_var
}

resource publicIPAddressName 'Microsoft.Network/publicIPAddresses@2022-07-01' = {
  name: publicIPAddressName_var
  location: resourceGroup().location
  properties: {
    publicIPAllocationMethod: publicIPAddressType
    dnsSettings: {
      domainNameLabel: dnsNameForPublicIP
    }
  }
}

resource nicName 'Microsoft.Network/networkInterfaces@2022-07-01' = {
  name: nicName_var
  location: resourceGroup().location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddressName.id
          }
          subnet: {
            id: subnetRef
          }
        }
      }
    ]
  }
}

resource vmName 'Microsoft.Compute/virtualMachines@2022-11-01' = {
  name: vmName_var
  location: resourceGroup().location
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: vmName_var
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: imagePublisher
        offer: imageOffer
        sku: ubuntuOSVersion
        version: 'latest'
      }
      osDisk: {
        name: 'osdisk'
        caching: 'ReadWrite'
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nicName.id
        }
      ]
    }
  }
}
//End of resource section for creating VM
