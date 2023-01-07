@description('Specifies the name of the app service plan that should be created.')
param appServicePlanName string

@description('Specifies the Azure location where the app configuration store should be created.')
param location string = resourceGroup().location

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: 'F1'
    tier: 'Free'
  }
}

output id string = appServicePlan.id
