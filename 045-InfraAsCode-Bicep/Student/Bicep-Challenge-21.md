# Challenge 21 - Deploy an Azure App Service

[< Previous Challenge](./Bicep-Challenge-20.md) - [Home](../README.md)

## Introduction

The goals of this challenge include understanding:
- How to deploy Azure App Service plan & App Service website using Bicep
- How to leverage Azure App Service source code integration to automatically deploy a sample app from GitHub

## Description

This challenge is all about [Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/overview). During the challenge, you will use bicep to create an Azure App Service Plan & App Service website.

Specifications:

- Deploy a linux web app with `linuxFxVersion` set to `NODE|14-LTS`
- The application can be found at the url `https://github.com/Azure-Samples/nodejs-docs-hello-world`
    - _hint: use this with the `repoUrl` parameter_

## Success Criteria

- Demonstrate that your application is running by launching the website in your browser
    - show https://<sitename>
    - show https://<sitename>/api
    - show https://<sitename>/api/accounts/jondoe

## Learning Resources

- Bicep resource definitions:
    - https://learn.microsoft.com/en-us/azure/templates/microsoft.web/serverfarms?pivots=deployment-language-bicep
    - https://learn.microsoft.com/en-us/azure/templates/microsoft.web/sites?pivots=deployment-language-bicep
    - https://learn.microsoft.com/en-us/azure/templates/microsoft.web/sites/sourcecontrols?pivots=deployment-language-bicep
