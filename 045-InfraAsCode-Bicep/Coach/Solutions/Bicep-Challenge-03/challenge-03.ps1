# If self-deploying the challenges, recommend adding a prefix to Azure resources.
# For example, resourceGroupName = "<my initials>-challenge-01-rg"
#
# From PSH terminal in the directory for these files, run ".\challenge-01.ps1"
#
# In challenge 3, new containers are added to the storage account created in Challenge 2.

$RESOURCE_GROUP_NAME = '<me>-challenge-02-rg'
$DEPLOYMENT_NAME = '<me>-challenge-02-deployment'
$STORAGE_ACCOUNT_NAME = '<storage account name from challenge 2>'

# The -WhatIf is added to allow you to see the outcomes of the BICEP deployment.
# Remove it to actually deploy the resources.
New-AzResourceGroupDeployment `
	-Name $DEPLOYMENT_NAME `
	-ResourceGroupName $RESOURCE_GROUP_NAME `
	-TemplateFile ./challenge-03.bicep `
	-storageAccountName $STORAGE_ACCOUNT_NAME `
	-containers 'container2', 'container3', 'container4' `
	-WhatIf
