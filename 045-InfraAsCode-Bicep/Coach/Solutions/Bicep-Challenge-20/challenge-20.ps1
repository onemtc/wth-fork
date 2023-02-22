$location = 'eastus'
$deploymentName = 'challenge-20-deployment'
$resourceGroupName='challenge-20-rg'


# generate ssh key; save in aks and aks.pub
ssh-keygen -f aks

az group create --name $resourceGroupName --location $location

New-AzSubscriptionDeployment `
	-Name $deploymentName `
	-TemplateFile ./challenge-20.bicep `
	-ResourceGroupName $resourceGroupName `
	-Location $location `
	-TemplateParameterFile ./challenge-20.parameters.json