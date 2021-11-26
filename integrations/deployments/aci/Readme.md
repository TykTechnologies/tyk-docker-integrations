# How to setup with Azure Container Instance (ACI)
To learn more about ACI and how to setup docker compose with ACI please check out this [documenation](https://docs.microsoft.com/en-us/azure/container-instances/tutorial-docker-compose) on the Microsoft site.

To get started you will need an Azure Registry. You can create one by running the following command:

```az acr create --resource-group myResourceGroup --name tykregistry --sku Basic```

Once you create an Azure Registry you will need to login to it:

```az acr login --name tykregistry```

You will then need to build and push the docker-compose images to your Azure Registry:

```docker-compose -f docker-compose.yml -f integrations/depoloyments/aci/docker-compose.yml build```

```docker-compose -f docker-compose.yml -f integrations/depoloyments/aci/docker-compose.yml push```

Finally, you can log docker into Azure and create an ACI context that will let you manage the ACI instances.

```docker login azure```

```docker context create dockeracicontext```

```docker context use dockeracicontext```

```docker compose -f docker-compose.yml -f integrations/depoloyments/aci/docker-compose.yml up```
