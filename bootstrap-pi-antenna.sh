#!/bin/bash

# Update and upgrade
sudo apt update
sudo apt full-upgrade -y

# Install git and curl
sudo apt install -y git curl

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Load nvm without having to restart the terminal
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Install Node.js
nvm install node

# Install libusb and cmake
sudo apt install -y libusb-1.0-0-dev cmake

# Install rtl-sdr
git clone https://gitea.osmocom.org/sdr/rtl-sdr.git

# Build and install rtl-sdr
cd rtl-sdr/
mkdir build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON
make
sudo make install
sudo ldconfig

# Clone the antenna listener repository
git clone https://github.com/keebrev/nodejs-antenna-listener.git
cd nodejs-antenna-listener
npm i
