#!/bin/bash

currentdir=$(pwd)

git clone https://github.com/pupil-labs/libuvc
cd libuvc
mkdir build
cd build
cmake .. 
make && sudo make install
sudo ldconfig

cd 
cd $currentdir
