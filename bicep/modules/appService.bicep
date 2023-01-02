@description('Specifies the name of the app service that should be created.')
param appServiceName string

@description('Specifies the Azure location where the app configuration store should be created.')
param location string = resourceGroup().location

@description('Specifies the Id of the app service plan.')
param appServicePlanId string

resource appService 'Microsoft.Web/sites@2022-03-01' = {
  name: appServiceName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  kind: 'app'
  properties: {
    siteConfig: {
      netFrameworkVersion: 'v7.0'
    }
    serverFarmId: appServicePlanId
    httpsOnly: true
  }
}

output name string = appService.name
output principleId string = appService.identity.principalId
