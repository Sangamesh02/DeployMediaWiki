# DeployMediaWiki

Deploy MediaWiki, to Azure Kubernetes Service (AKS) using Docker containers.

Prerequisites

we need the following prerequisites:

An Azure subscription
Azure CLI installed locally or access to Azure Cloud Shell
Azure Container Registry (ACR) to store Docker images
Azure Kubernetes Service (AKS) cluster created
kubectl installed locally or access to Azure Cloud Shell
Docker installed locally or access to Azure Cloud Shell


Steps

1. Build Docker Images (We build docker images either on VM, or in Azure DevOps Build pipeline in build_push.yaml file and then move to ACR.)

docker build -t mediawiki .

docker build -t mysql .

2. Tag and Push Docker Images to ACR 

Tag the built Docker images with Azure Container Registry (ACR) login server and push them to ACR

* Log in to ACR
az acr login --name <acr_name>

* Tag and push MediaWiki image
docker tag mediawiki <acr_login_server>/mediawiki

docker push <acr_login_server>/mediawiki

* Tag and push MySQL image
docker tag mysql <acr_login_server>/mysql

docker push <acr_login_server>/mysql

3. Deploy MediaWiki and MySQL to AKS

Deploy MediaWiki and MySQL to AKS using the Kubernetes manifest files

* Deploy MediaWiki
kubectl apply -f mediawiki-deployment.yaml

* Deploy MySQL
kubectl apply -f mysql-deployment.yaml


4. Expose MediaWiki Service
Expose the MediaWiki service to access it externally

kubectl apply -f mediawiki-service.yaml

5. Access MediaWiki
Get the external IP address of the MediaWiki service

kubectl get svc mediawiki-service

Access MediaWiki using the external IP address in web browser.

We also do build images on our LinuxVM and then push it to ACR.

