# If self-deploying the challenges, recommend adding a prefix to Azure resources.
# For example, resourceGroupName = "<my initials>-challenge-01-rg"
#
# From PSH terminal in the directory for these files, run ".\challenge-01.ps1"

$LOCATION = 'eastus'
$STORAGE_ACCOUNT_NAME = '<me>ch01'
$RESOURCE_GROUP_NAME = '<me>-challenge-01-rg'
$DEPLOYMENT_NAME = '<me>-challenge-01-deployment'

New-AzResourceGroup -Name $RESOURCE_GROUP_NAME -Location $LOCATION -Force

# The -WhatIf is added to allow you to see the outcomes of the BICEP deployment.
# Remove it to actually deploy the resources.
New-AzResourceGroupDeployment `
	-Name $DEPLOYMENT_NAME `
	-ResourceGroupName $RESOURCE_GROUP_NAME `
	-TemplateFile ./challenge-01.bicep `
	-location $LOCATION `
	-storageAccountName $STORAGE_ACCOUNT_NAME `
	- WhatIf
