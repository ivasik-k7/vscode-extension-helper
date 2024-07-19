# -*- coding: utf-8 -*-

function Save-Extensions {
    param (
        [string]$codeCommand,
        [string]$extensionsFile
    )

    if (-not (Get-Command $codeCommand -ErrorAction SilentlyContinue)) {
        Write-Host "Error: $codeCommand command not found. Make sure VS Code is installed."
        exit 1
    }

    $extensions = & $codeCommand --list-extensions

    $extensions | Out-File -FilePath $extensionsFile -Encoding utf8

    Write-Host "Extensions list saved to $extensionsFile"
}

# Determine which version of VS Code to use
if (Get-Command code -ErrorAction SilentlyContinue) {
    Write-Host "Detected: Using stable version of VS Code"
    Save-Extensions -codeCommand "code" -extensionsFile "extensions.txt"
} elseif (Get-Command code-insiders -ErrorAction SilentlyContinue) {
    Write-Host "Detected: Using insiders version of VS Code"
    Save-Extensions -codeCommand "code-insiders" -extensionsFile "extensions.txt"
} else {
    Write-Host "Error: Neither code nor code-insiders command found. Make sure VS Code or VS Code Insiders is installed."
    exit 1
}
