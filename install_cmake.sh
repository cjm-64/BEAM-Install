#!/bin/bash

currentdir=$(pwd)

# Install cmake 3.26.0 as greater than 3.25 is needed for pupil core libuvc 
sudo apt remove --purge --auto-remove cmake

mkdir ~/temp
cd ~/temp
wget https://github.com/Kitware/CMake/releases/download/v3.26.0-rc6/cmake-3.26.0-rc6.tar.gz
tar -xzvf cmake-3.26.0-rc6.tar.gz
cd cmake-3.26.0-rc6
./bootstrap
make -j$(nproc)
sudo make install

cmake --version

cd 
cd $currentdir
