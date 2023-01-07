@description('The name of the function app that you wish to create.')
param appName string = 'appconfigdemo${uniqueString(resourceGroup().id)}'

param location string = resourceGroup().location

module appServicePlan './modules/appServicePlan.bicep' = {
  name: 'appServicePlan'
  params: {
    location: location
    appServicePlanName: appName
  }
}

module appService './modules/appService.bicep' = {
  name: 'appService'
  params: {
    appServiceName: appName
    location: location
    appServicePlanId: appServicePlan.outputs.id
  }
}

module appConfigurationStore './modules/appConfigurationStore.bicep' = {
  name: 'appConfiguration'
  params: {
    configStoreName: appName
    location: location
  }
}

module keyVault './modules/keyVault.bicep' = {
  name: 'keyVault'
  params: {
    keyVaultName: appName
    location: location
    appConfigurationStoreName: appConfigurationStore.outputs.name
  }
  dependsOn: [
    appConfigurationStore
  ]
}

module keyVaultAccessPolicy './modules/keyVaultAccessPolicy.bicep' = {
  name: 'keyVaultAccessPolicy'
  params: {
    keyVaultName: keyVault.outputs.name
    objectId: appService.outputs.principleId
  }
  dependsOn: [
    appService
    keyVault
  ]
}

module appSettings './modules/appServiceSettings.bicep' = {
  name: '${appName}-appsettings'
  params: {
    appServiceName: appService.outputs.name
    appSettings: {
      KeyVaultName: keyVault.outputs.name
    }
  }
  dependsOn: [
    appService
    keyVault
  ]
}
