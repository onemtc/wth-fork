# If self-deploying the challenges, recommend adding a prefix to Azure resources.
# For example, resourceGroupName = "<my initials>-challenge-01-rg"

# This file can be run using Windows Service for Linux, alternatively it
# be run from a bash shell like Git Bash assuming it's installed or
# run directly in VSCode from a Git Bash terminal.

LOCATION='eastus'
RESOURCE_GROUP_NAME='<me>-challenge-01-rg'
DEPLOYMENT_NAME='<me>-challenge-01a-deployment'
STORAGE_ACCOUNT_NAME='<me>ch01a'

az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

az deployment group create \
	--name $DEPLOYMENT_NAME \
    --resource-group $RESOURCE_GROUP_NAME \
    --template-file ./challenge-01.bicep \
	--parameters location=${LOCATION} storageAccountName=${STORAGE_ACCOUNT_NAME}
