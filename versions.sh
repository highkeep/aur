#!/bin/bash

PKG=${1}

remoteVersion=$(git ls-remote -q https://aur.archlinux.org/${PKG}.git heads/master | cut -f1)
currentVersion=$(cat versions/${PKG} 2>/dev/null)

[[ ${remoteVersion} != ${currentVersion} ]] && echo update=true || echo update=false
