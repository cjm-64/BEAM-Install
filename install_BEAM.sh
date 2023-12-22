#!/bin/bash

currentdir=$(pwd)

cd .. && git clone https://github.com/cjm-64/BEAM && cd BEAM && git switch fps && qmake BEAM.pro && make && chmod +x OpenKeyboard.sh && ls -la

cd 
cd $currentdir
