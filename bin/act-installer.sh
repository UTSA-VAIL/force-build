#!/bin/bash

# Function to check if act is installed
check_act_installed() {
    if command -v act &> /dev/null
    then
        echo "Act is already installed."
        exit 0
    else
        echo "Act not found, proceeding with installation."
    fi
}

# Function to determine OS and architecture and download the correct binary
get_download_url() {
    local os=$(uname -s | tr '[:upper:]' '[:lower:]')
    local arch=$(uname -m)

    if [ "$arch" == "x86_64" ]; then
        arch="amd64"
    elif [ "$arch" == "aarch64" ]; then
        arch="arm64"
    else
        echo "Unsupported architecture: $arch"
        exit 1
    fi

    local version="v0.2.48"  # Update this to the latest version if necessary
    local download_url="https://github.com/nektos/act/releases/download/${version}/act_${os}_${arch}.tar.gz"

    echo "$download_url"
}

# Function to install act
install_act() {
    local url=$1
    local dest_dir="/usr/local/bin"

    # Download the tarball
    echo "Downloading act from $url ..."
    wget "$url" -O /tmp/act.tar.gz

    # Extract the binary
    tar -xzf /tmp/act.tar.gz -C /tmp/

    # Move the binary to /usr/local/bin
    sudo mv /tmp/act "${dest_dir}/act"
    sudo chmod +x "${dest_dir}/act"

    # Verify installation
    if command -v act &> /dev/null
    then
        echo "Act installed successfully."
    else
        echo "Failed to install Act."
    fi
}

check_act_installed
download_url=$(get_download_url)
install_act "$download_url"
