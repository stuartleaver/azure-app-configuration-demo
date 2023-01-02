@description('Specifies the name of the app service that the settings should be added.')
param appServiceName string

@description('Specifies the the app setting that should be created.')
param appSettings object

resource siteconfig 'Microsoft.Web/sites/config@2022-03-01' = {
  name: '${appServiceName}/appsettings'
  properties: appSettings
}
