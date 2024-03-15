#!/bin/bash

currentdir=$(pwd)

cd .. && git clone https://github.com/cjm-64/BEAM && cd BEAM && qmake BEAM.pro && make && chmod +x OpenKeyboard.sh && ls -la

mv runBEAM.sh /home/beam/Desktop

sudo mv keyboard.xml /usr/share/matchbox-keyboard/

cd 
cd $currentdir
