# Azure App Configuration Resource Demo
Demo on using the Azure App Configuration resource to store and manage application settings and feature flags

## Setup
### Create a resource group
Create a resource group using the following CLI command. Substituting the resource group name for the name used above, location for your preferred option.

```bash
az group create --resource-group <RESOURCE-GROUP-NAME> --location <LOCATION>
```

### Deployment credentials for GitHub Action
To be able to deploy the Bicep file via a GitHub Action, you will need to generate deployment credentials. Microsoft has documentation on this, so the link is below.

1. [Generate deployment credentials](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/deploy-github-actions?tabs=userlevel%2CCLI#generate-deployment-credentials)
1. [Configure the GitHub secrets](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/deploy-github-actions?tabs=userlevel%2CCLI#configure-the-github-secrets)

## Deployment
This repo contains a GitHub action for deploying the infrastructure using Azure Bicep. However, if you wish to do this manually, you can use the following step.

### Deploy azure Bicep files

```bash
az deployment group create --resource-group <RESOURCE-GROUP-NAME> --template-file main.bicep
```