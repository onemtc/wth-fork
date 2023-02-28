$location = 'eastus'
$deploymentName = 'challenge-21-deployment'
$resourceGroupName='challenge-21-rg'

az group create --name $resourceGroupName --location $location

New-AzSubscriptionDeployment `
	-Name $deploymentName `
	-TemplateFile ./challenge-21.bicep `
	-ResourceGroupName $resourceGroupName `
	-Location $location `
	-TemplateParameterFile ./challenge-21.parameters.json