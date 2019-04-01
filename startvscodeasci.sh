#! /bin/bash
NAME=$1
ACR_LOGIN_SERVER="uneidel.azurecr.io"
ACR_LOGIN_PW=$2
groupname="cdsmeeting"
echo "creating resourcegroup $groupname"
az group create --name $groupname --location westeurope
az container create \
    --resource-group $groupname \
    --name $NAME \
    --image uneidel.azurecr.io/cdsmeeting:1.5 \
    --restart-policy OnFailure \
    --registry-login-server $ACR_LOGIN_SERVER \
    --registry-username uneidel \
    --registry-password $ACR_LOGIN_PW \
    --command-line "code-server --allow-http --no-auth"

az group delete --name $groupname --yes
