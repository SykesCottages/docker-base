#!/bin/sh

itShouldCheckThatAllInstalledSoftwareExists() {
    doesCommandExist zip
    doesCommandExist git
    doesCommandExist curl
    doesCommandExist openssl
    doesCommandExist add-apt-repository
}

doesCommandExist() {
    if ! [ -x "$(command -v $1)" ]; then
      echo "Error: $1 is not installed." >&2
      exit 1
    fi
}

itShouldCheckThatAllInstalledSoftwareExists
