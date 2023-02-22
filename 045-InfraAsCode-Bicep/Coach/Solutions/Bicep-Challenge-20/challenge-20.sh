LOCATION='eastus'
DEPLOYMENT_NAME='challenge-11-deployment'
RG='challenge-20-rg'

az deployment group create \
	--name $DEPLOYMENT_NAME \
	--resource-group $RG
    --template-file challenge-20.bicep \
	--parameters challenge-11.parameters.json 


az deployment group create `
	--name $deploymentName  `
	--resource-group $resourceGroupName `
    --template-file challenge-20.bicep `
	--parameters challenge-20.parameters.json 