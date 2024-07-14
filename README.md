# VS Code Extensions Manager

This repository contains Bash scripts to manage Visual Studio Code (VS Code) extensions easily. It includes scripts for saving the list of installed extensions to a file (`save_extensions.sh`) and for installing extensions listed in a file (`install_extensions.sh`). These scripts are designed to work seamlessly with both the stable version (`code`) and the insiders version (`code-insiders`) of VS Code.

## Features

- **Save Extensions**: Use `save_extensions.sh` to save the list of currently installed VS Code extensions to a file (`extensions.txt`).
- **Install Extensions**: Use `install_extensions.sh` to install extensions listed in `extensions.txt` to a new instance of VS Code.

## Usage

### Save Extensions

1. **Run `save_extensions.sh`**:
   - Open a terminal or command prompt.
   - Navigate to the directory where `save_extensions.sh` is located.
   - Make the script executable if not already (`chmod +x save_extensions.sh`).
   - Run the script:
     ```bash
     bash save_extensions.sh filename.txt
     ```

### Install Extensions

1. **Prepare `extensions.txt`**:

   - Before running `install_extensions.sh`, ensure `extensions.txt` contains a list of extensions (each on a new line) you want to install.

2. **Run `install_extensions.sh`**:
   - Open a terminal or command prompt.
   - Navigate to the directory where `install_extensions.sh` is located.
   - Run the script:
     ```bash
     bash install_extensions.sh file_with_extensions.txt
     ```

## Prerequisites

- **VS Code**: Ensure you have Visual Studio Code installed on your system.
- **Bash**: These scripts require a Unix-like environment with Bash support.

## Notes

- **Compatibility**: Scripts are designed to work on Unix-like systems (Linux, macOS). Adjustments may be necessary for Windows environments.
- **Contributions**: Contributions are welcome! Feel free to fork the repository and submit pull requests for improvements or additional functionality.
