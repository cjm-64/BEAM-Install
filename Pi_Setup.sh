#!/bin/bash

sudo apt update
sudo apt upgrade

set -e

echo "--- Removing any pre-installed ffmpeg and x264"
sudo apt-get -qq remove ffmpeg x264 libx264-dev

function install_dependency {
    echo "--- Installing dependency: $1"
    sudo apt-get -y install $1
}

echo "Installing Dependencies"


install_dependency libopencv-dev
install_dependency g++
install_dependency build-essential
install_dependency checkinstall
install_dependency cmake
install_dependency pkg-config
install_dependency yasm
install_dependency libtiff5-dev
install_dependency libjpeg-dev
install_dependency libavcodec-dev
install_dependency libavformat-dev
install_dependency libswscale-dev
install_dependency libdc1394-22-dev
install_dependency libxine2-dev
install_dependency libv4l-dev
install_dependency libprotobuf-dev

##Python installs are standard on RPi Bullseye
##install_dependency python-dev
##install_dependency python-numpy


install_dependency libtbb-dev
install_dependency libqt5x11extras5
install_dependency libqt5opengl5
install_dependency libqt5opengl5-dev
install_dependency libgtk2.0-dev
install_dependency libmp3lame-dev
install_dependency libopencore-amrnb-dev
install_dependency libopencore-amrwb-dev
install_dependency libtheora-dev
install_dependency libvorbis-dev
install_dependency libxvidcore-dev
install_dependency x264
install_dependency v4l-utils
install_dependency libglfw3-dev
install_dependency libgl1-mesa-dev
install_dependency libglu1-mesa-dev

#IDE Installs
install_dependency qtcreator
install_dependency qt5-assistant

#Misc Installs
install_dependency matchbox-keyboard
install_dependency zenity
install_dependency unzip
install_dependency default-jre
install_dependency default-jdk

mkdir OpenCV
cd OpenCV

Version="4.5.1.zip"

echo "Downloading OpenCV 4.0.0"
wget https://github.com/opencv/opencv/archive/$Version

echo "Unzipping OpenCV 4.0.0"
unzip $Version

echo "Making build directory"
mkdir build
cd build


echo "Setting build options"
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=OFF -D INSTALL_PYTHON_EXAMPLES=OFF -D BUILD_EXAMPLES=OFF -D WITH_QT=ON -D WITH_OPENGL=ON -D OPENCV_GENERATE_PKGCONFIG=ON ../opencv-4.5.1


## -D WITH_PROTOBUF=ON -D WITH_WEBP=OFF
## -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib-3.4.3/modules

make clean

echo "Building"
make -j4

echo "Installing OpenCV 4.0.0"
sudo make install

echo "Moving files to proper location"
cd && cd .. && cd .. && cd /usr/local/include/opencv4 && sudo cp -avr /usr/local/include/opencv4/opencv2 /usr/local/include

sudo sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig

echo "OpenCV" pkg-config --modversion opencv4 "is ready to be used"
