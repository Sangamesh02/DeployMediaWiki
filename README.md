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

1. Build Docker Images
docker build -t <acr_login_server>/mediawiki .

2. Push Docker Image to ACR
Log in to Azure Container Registry (ACR) and push the Docker image

az acr login --name <acr_name>
docker push <acr_login_server>/mediawiki

3. Deploy MediaWiki to AKS
Deploy MediaWiki to AKS using the Kubernetes manifest file

kubectl apply -f mediawiki-deployment.yaml

4. Expose MediaWiki Service
Expose the MediaWiki service to access it externally

kubectl apply -f mediawiki-service.yaml

5. Access MediaWiki
Get the external IP address of the MediaWiki service

kubectl get svc mediawiki-service

Access MediaWiki using the external IP address in web browser.

