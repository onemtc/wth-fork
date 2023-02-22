LOCATION='eastus'
DEPLOYMENT_NAME='challenge-21-deployment'
RG='challenge-21-rg'

az deployment group create \
	--name $DEPLOYMENT_NAME \
	--resource-group $RG
    --template-file challenge-20.bicep \
	--parameters challenge-11.parameters.json 


az deployment group create `
	--name $deploymentName  `
	--resource-group $resourceGroupName `
    --template-file challenge-21.bicep `
	--parameters challenge-21.parameters.json 