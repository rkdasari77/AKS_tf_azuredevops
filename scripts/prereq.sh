#!/bin/bash

tenantID="ad8fce69-02d9-4b85-bd73-6ef0bc142325"
subscriptionID="62ebc499-ffd9-4eaa-af6a-46364114c1ae"

RESOURCE_GROUP_NAME="tf-state-rg"
DEV_SA_ACCOUNT="tfdevbackendsa"
STAGE_SA_ACCOUNT="tfstagebackendsa"
CONTAINER_NAME="tf-state-container"

## Az login
az login -t $tenantID --use-device-code
az account set -s $subscriptionID

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location eastus

# Create storage account for staging environment
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STAGE_SA_ACCOUNT --sku Standard_LRS --encryption-services blob

# Create storage account for dev environment
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $DEV_SA_ACCOUNT --sku Standard_LRS --encryption-services blob

# Create blob container for staging environment
az storage container create --name $CONTAINER_NAME --account-name $STAGE_SA_ACCOUNT

# Create blob container for dev environment
az storage container create --name $CONTAINER_NAME --account-name $DEV_SA_ACCOUNT