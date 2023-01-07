@description('Specifies the name of the key vault.')
param keyVaultName string

@description('Specifies the Azure location where the key vault should be created.')
param location string = resourceGroup().location

@description('Specifies the name of the app configuration store.')
param appConfigurationStoreName string

resource keyVault 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: take(keyVaultName, 23)
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    accessPolicies: []
  }
}

resource appConfigurationStore 'Microsoft.AppConfiguration/configurationStores@2021-10-01-preview' existing = {
  name: appConfigurationStoreName
}

resource appConfigurationStoreConnectionString 'Microsoft.KeyVault/vaults/secrets@2021-11-01-preview' = {
  parent: keyVault
  name: 'AppConfigurationConnectionString'
  properties: {
    value: filter(listkeys(appConfigurationStore.id, appConfigurationStore.apiVersion).value, k => k.name == 'Primary Read Only')[0].connectionString
  }
}

output name string = keyVault.name
