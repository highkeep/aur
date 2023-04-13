#!/bin/bash

check-version() {
    PKG=${1}

    remoteVersion=$(git ls-remote -q https://aur.archlinux.org/${PKG}.git heads/master | cut -f1)
    currentVersion=$(cat versions/${PKG} 2>/dev/null)

    if [[ "${remoteVersion}" != "${currentVersion}" ]]; then
        echo update=true
    else
        echo update=false
    fi
}

git-svn() {
    if [[ ! -z "$1" && ! -z "$2" ]]; then
        echo "Starting clone/copy ..."
        repo=$(echo $1 | sed 's/\/$\|.git$//')
        svn export "$repo/trunk/$2"
    else
        echo "Use: git-svn <repository> <subdirectory>"
    fi
}
