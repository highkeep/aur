#!/bin/bash

PKG=${1}

remoteVersion=$(git ls-remote -q https://aur.archlinux.org/${PKG}.git heads/master | cut -f1)
currentVersion=$(cat versions/${PKG} 2>/dev/null)

if [ "${remoteVersion}" != "${currentVersion}" ]; then
    echo update=true
else
    echo update=false
fi
