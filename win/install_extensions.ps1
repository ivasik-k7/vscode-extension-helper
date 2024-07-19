# -*- coding: utf-8 -*-

param (
    [string]$ExtensionsFile
)

if (-not $ExtensionsFile) {
    Write-Host "Usage: $($MyInvocation.MyCommand.Name) -ExtensionsFile path_to_extensions_file"
    exit 1
}

if (-not (Test-Path -Path $ExtensionsFile -PathType Leaf)) {
    Write-Host "Error: File '$ExtensionsFile' not found or not readable."
    exit 1
}

$codeCommand = ""
if (Get-Command code -ErrorAction SilentlyContinue) {
    $codeCommand = "code"
} elseif (Get-Command code-insiders -ErrorAction SilentlyContinue) {
    $codeCommand = "code-insiders"
} else {
    Write-Host "Error: Neither 'code' nor 'code-insiders' is installed. Please install Visual Studio Code or Visual Studio Code Insiders."
    exit 1
}

Write-Host "Using $codeCommand to install extensions..."

Get-Content -Path $ExtensionsFile | ForEach-Object {
    $extension = $_.Trim()
    if ($extension) {
        Write-Host "Installing $extension..."
        & $codeCommand --install-extension $extension
    }
}

Write-Host "All extensions installed."
