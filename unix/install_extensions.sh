#!/usr/bin/env bash
# -*- coding: utf-8 -*-

if [ $# -eq 0 ]; then
    echo "Usage: $0 path_to_extensions_file"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found or not readable."
    exit 1
fi

if command -v code >/dev/null 2>&1; then
    CODE_COMMAND="code"
elif command -v code-insiders >/dev/null 2>&1; then
    CODE_COMMAND="code-insiders"
else
    echo "Error: Neither 'code' nor 'code-insiders' is installed. Please install Visual Studio Code or Visual Studio Code Insiders."
    exit 1
fi

echo "Using $CODE_COMMAND to install extensions..."

while IFS= read -r extension; do
    if [[ ! -z "$extension" ]]; then
        echo "Installing $extension..."
        $CODE_COMMAND --install-extension "$extension"
    fi
done <"$1"

echo "All extensions installed."
