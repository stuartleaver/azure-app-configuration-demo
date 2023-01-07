# Azure App Configuration Resource Demo
Demo on using the Azure App Configuration resource to store and manage application settings and feature flags.

Microsoft describes Azure App Configuration as follows:

> Azure App Configuration provides a service to centrally manage application settings and feature flags. Modern programs, especially programs running in a cloud, generally have many components that are distributed in nature. Spreading configuration settings across these components can lead to hard-to-troubleshoot errors during an application deployment. Use App Configuration to store all the settings for your application and secure their accesses in one place.

[What is Azure App Configuration?](https://learn.microsoft.com/en-us/azure/azure-app-configuration/overview)

Another advantage of Azure App Configuration is that it allows you to update your application configuration without causing the application to restart.

This repo contains the following samples, with sample code, to get started with some of the features of Azure App Configuration.

| Feature                 | Description                                                                             | Link                                                            |
| -----------             | -----------                                                                             | -----------                                                     |
| Feature Management      | Using Azure App Configuration as a single repository to store and manage feature flags. | [Sample code](01-FeatureManagement/README.md)                   |