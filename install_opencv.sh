#!/bin/bash

currentdir=$(pwd)

mkdir OpenCV
cd OpenCV

Version="4.6.0"

echo "Downloading OpenCV 4.6.0"
wget https://github.com/opencv/opencv/archive/$Version.zip

echo "Unzipping OpenCV 4.6.0"
unzip $Version

echo "Making build directory"
mkdir build
cd build


echo "Setting build options"
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=OFF -D INSTALL_PYTHON_EXAMPLES=OFF -D BUILD_EXAMPLES=OFF -D WITH_QT=ON -D WITH_OPENGL=ON -D OPENCV_GENERATE_PKGCONFIG=ON ../opencv-$Version


## -D CMAKE_DISABLE_FIND_PACKAGE_TBB=ON -D WITH_PROTOBUF=OFF-D WITH_WEBP=OFF
## -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib-3.4.3/modules

make clean

echo "Building"
make -j$1

echo "Installing OpenCV 4.6.0"
sudo make install

echo "Moving files to proper location"
cd && cd .. && cd .. && cd /usr/local/include/opencv4 && sudo cp -avr /usr/local/include/opencv4/opencv2 /usr/local/include

sudo sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig

cd 
cd $currentdir
