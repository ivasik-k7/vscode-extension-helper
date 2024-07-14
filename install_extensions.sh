#!/usr/bin/env bash
# -*- coding: utf-8 -*-

install_extensions() {
    local code_command="$1"
    local extensions_file="$2"

    if ! command -v "$code_command" &>/dev/null; then
        echo "Error: $code_command command not found. Make sure VS Code is installed."
        exit 1
    fi

    if [ ! -f "$extensions_file" ]; then
        echo "Error: Extensions file '$extensions_file' not found."
        exit 1
    fi

    while IFS= read -r extension || [ -n "$extension" ]; do
        "$code_command" --install-extension "$extension"
    done <"$extensions_file"

    echo "Extensions installed from $extensions_file"
}

if command -v code &>/dev/null; then
    echo "Detected: Using stable version of VS Code"
    install_extensions "code" "extensions.txt"
elif command -v code-insiders &>/dev/null; then
    echo "Detected: Using insiders version of VS Code"
    install_extensions "code-insiders" "extensions.txt"
else
    echo "Error: Neither code nor code-insiders command found. Make sure VS Code or VS Code Insiders is installed."
    exit 1
fi
