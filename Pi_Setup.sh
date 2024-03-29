#!/bin/bash

sudo apt update
sudo apt upgrade

set -e

echo "----------------Installing Dependencies----------------"
source dependencies.sh

echo "----------------Install OpenCV 4.6.0 (Pupil Core Variant)----------------"
source install_opencv.sh 1

VerNum=$(pkg-config --modversion opencv4)
echo "OpenCV" $VerNum "is ready to be used"

echo "----------------Install libuvc (Pupil Core Variant)----------------"
source install_libuvc.sh

echo "----------------Install BEAM----------------"
source install_BEAM.sh
