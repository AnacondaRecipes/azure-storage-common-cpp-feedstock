#!/bin/bash
set -eux

# Disable installing dependencies with vcpkg
# https://github.com/Azure/azure-sdk-for-cpp/blob/main/CONTRIBUTING.md#customize-the-vcpkg-dependency-integration
# https://github.com/search?utf8=%E2%9C%93&q=AZURE_SDK_DISABLE_AUTO_VCPKG&type=code
export AZURE_SDK_DISABLE_AUTO_VCPKG=ON

cd sdk/storage/azure-storage-common

# https://github.com/Azure/azure-sdk-for-cpp/blob/main/CONTRIBUTING.md#building-the-project
mkdir build
cd build
cmake $CMAKE_ARGS \
  -G Ninja \
  -D CMAKE_INSTALL_PREFIX="${PREFIX}" \
  -D CMAKE_BUILD_TYPE=Release \
  -D BUILD_SHARED_LIBS=ON \
  -D BUILD_TRANSPORT_CURL=ON \
  ..
cmake --build . --target install --config Release
