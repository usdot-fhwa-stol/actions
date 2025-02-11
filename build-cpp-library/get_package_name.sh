#!/bin/bash

WORKING_FOLDER=$1

if [ -z "$WORKING_FOLDER" ]; then
  echo "Error: Working folder not specified."
  exit 1
fi

PACKAGE_NAME=$(grep CMAKE_PROJECT_NAME $WORKING_FOLDER/build/CMakeCache.txt | cut -d "=" -f2)

if [ -z "$PACKAGE_NAME" ]; then
  echo "Error: Package name not found in CMakeCache.txt"
  exit 1
fi

echo "$PACKAGE_NAME"
