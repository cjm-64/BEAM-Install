#!/bin/bash

currentdir=$(pwd)

git clone https://github.com/cjm-64/BEAM && cd BEAM && git switch fps && qmake BEAM.pro && make && ls -la

cd 
cd $currentdir
