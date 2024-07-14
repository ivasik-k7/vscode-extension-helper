#!/usr/bin/env bash
# -*- coding: utf-8 -*-

save_extensions() {
    local code_command="$1"
    local extensions_file="$2"

    if ! command -v "$code_command" &>/dev/null; then
        echo "Error: $code_command command not found. Make sure VS Code is installed."
        exit 1
    fi

    extensions=$("$code_command" --list-extensions)

    echo "$extensions" >"$extensions_file"

    echo "Extensions list saved to $extensions_file"
}

# Determine which version of VS Code to use
if command -v code &>/dev/null; then
    echo "Detected: Using stable version of VS Code"
    save_extensions "code" "extensions.txt"
elif command -v code-insiders &>/dev/null; then
    echo "Detected: Using insiders version of VS Code"
    save_extensions "code-insiders" "extensions.txt"
else
    echo "Error: Neither code nor code-insiders command found. Make sure VS Code or VS Code Insiders is installed."
    exit 1
fi
