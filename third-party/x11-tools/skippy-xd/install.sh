#!/bin/bash

echo "Build ..."
make

echo "Install ..."
sudo make install

echo "Clean ..."
make clean

echo "All Done"
