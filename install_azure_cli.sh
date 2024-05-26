#!/bin/bash

# Update the package index
sudo apt-get update

# Install prerequisites
sudo apt-get install -y curl apt-transport-https lsb-release gnupg

# Download and install the Microsoft signing key
curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | \
    sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null

# Add the Azure CLI repository
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
    sudo tee /etc/apt/sources.list.d/azure-cli.list

# Update the package index again
sudo apt-get update

# Install Azure CLI
sudo apt-get install -y azure-cli

# Verify installation
az --version


#make it executable (chmod +x install_azure_cli.sh), 
#and then run it (./install_azure_cli.sh) on your Linux VM.
