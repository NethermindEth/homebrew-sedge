#!/bin/bash
#exit when any command fails
set -e

echo =======================================================
echo Updating Homebrew package
echo =======================================================

cd /tmp/binaries

darwin_amd64_hash="$(shasum -a 256 sedge-$VERSION-darwin-amd64/* | awk '{ print $1}')"
darwin_arm64_hash="$(shasum -a 256 sedge-$VERSION-darwin-arm64/* | awk '{ print $1}')"
linux_amd64_hash="$(shasum -a 256 sedge-$VERSION-linux-amd64/* | awk '{ print $1}')"

cd /home/runner/work/sedge/sedge/homebrew-sedge/Formula

sed -i "s/app_version =.*/app_version = '"$VERSION"'/" sedge.rb
awk -i inplace -v n=1 '/sha256/ { if (++count == n) sub(/sha256.*/, "sha256 \"'$darwin_amd64_hash'\""); } 1' sedge.rb
awk -i inplace -v n=2 '/sha256/ { if (++count == n) sub(/sha256.*/, "sha256 \"'$darwin_arm64_hash'\""); } 1' sedge.rb
awk -i inplace -v n=3 '/sha256/ { if (++count == n) sub(/sha256.*/, "sha256 \"'$linux_amd64_hash'\""); } 1' sedge.rb

echo =======================================================
echo Updating Homebrew package completed
echo =======================================================
