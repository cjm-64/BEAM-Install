#!/bin/bash

echo "--- Removing any pre-installed ffmpeg and x264"
sudo apt-get -qq remove ffmpeg x264 libx264-dev

function install_dependency {
    echo "--- Installing dependency: $1"
    sudo apt-get -y install $1
}

echo "Installing Dependencies"


install_dependency g++
install_dependency build-essential
install_dependency checkinstall
install_dependency libssl-dev
source install_cmake.sh
install_dependency pkg-config
install_dependency yasm
install_dependency libtiff5-dev
install_dependency libjpeg-dev
install_dependency libturbojpeg-dev
install_dependency libpng-dev
install_dependency libavcodec-dev
install_dependency libavformat-dev
install_dependency libswscale-dev
install_dependency libdc1394-dev
install_dependency libxine2-dev
install_dependency libv4l-dev
install_dependency libprotobuf-dev
install_dependency python3-dev
install_dependency libtbb-dev
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
install_dependency libqt5opengl5
install_dependency libqt5opengl5-dev
install_dependency libqt5x11extras5

#Misc Installs
install_dependency matchbox-keyboard
install_dependency zenity
install_dependency unzip
install_dependency default-jre
install_dependency default-jdk
install_dependency libusb-1.0-0-dev
install_dependency cheese
