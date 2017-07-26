#!/usr/bin/env bash
# shellcheck disable=SC1090,SC2155
#
# Filename: lookup.sh
# Description: Look up project directory based on a locator file
# Author: ADoyle <adoyle.h@gmail.com>
# LICENSE: Apache License, Version 2.0
# First Created: 2017-07-26T07:13:55Z
# Last Modified: 2017-07-26T17:32:16Z
# Version: 0.1.0
# Bash Version: 4.x
# Source: https://github.com/adoyle-h/lookup.sh/blob/v0.1.0/src/lookup.sh
# Project: https://github.com/adoyle-h/lookup.sh


#######################################################################
#                           initialization                            #
#######################################################################

#######################################################################
#                           private methods                           #
#######################################################################

__default_locator=.project_locator

_lookup() {
    local path="$1"
    local locator="$2"

    while [[ "$path" != "" && ! -f $path/$locator ]]; do
        path=${path%/*}
    done

    echo "$path"
}

#######################################################################
#                           public methods                            #
#######################################################################

lookup() {
    local base_dir="$1"
    local locator="${2:-$__default_locator}"
    local path
    path="$(cd -P -- "$(dirname -- "$base_dir")" && pwd -P)"
    _lookup "$path" "$locator"
}

lookup_dir() {
    local base_dir="${BASH_SOURCE[1]}"
    local locator="${1:-$__default_locator}"
    local path base_path

    base_path="$(cd -P -- "$(dirname -- "$base_dir")" && pwd -P)"
    path=$(_lookup "$base_path" "$locator")

    if [[ -n "$path" ]]; then
        echo "$path"
    else
        echo "No matched locator \"$locator\" from any parent directories of directory: $base_dir" >&2
        return 1
    fi
}
