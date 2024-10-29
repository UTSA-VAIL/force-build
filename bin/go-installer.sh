#!/bin/bash

# Function to check if Go is installed
check_go_installed() {
    if command -v go &> /dev/null
    then
        echo "Go is already installed."
        exit 0
    else
        echo "Go not found, proceeding with installation."
    fi
}

# Function to get the correct download URL based on uname and architecture
get_download_url() {
    local os=$(uname -s | tr '[:upper:]' '[:lower:]')
    local arch=$(arch)

    local version="go1.21.1"  # You can modify this to install a specific version
    local download_url="https://go.dev/dl/${version}.${os}-${arch}.tar.gz"

    echo "$download_url"
}

# Function to install Go
install_go() {
    local url=$1
    local dest_dir="/usr/local"

    # Download the tarball
    echo "Downloading Go from $url ..."
    wget "$url" -O /tmp/go.tar.gz

    # Remove any existing Go installation
    sudo rm -rf /usr/local/go

    # Extract the downloaded tarball to the destination
    sudo tar -C "$dest_dir" -xzf /tmp/go.tar.gz

    # Add Go to the path by updating profile
    echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.profile
    source ~/.profile

    # Verify installation
    if command -v go &> /dev/null
    then
        echo "Go installed successfully."
    else
        echo "Failed to install Go."
    fi
}

check_go_installed
download_url=$(get_download_url)
install_go "$download_url"
