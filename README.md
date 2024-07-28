# 🌳 TreeVisualizer

TreeVisualizer is a PowerShell script that generates a tree structure of a specified directory, similar to the `tree /f` command in the Windows terminal. It includes features to blacklist specific directories and files, as well as partially blacklist directories to display only their names without their contents.

## ✨ Features

- 📂 Generate a tree structure of a specified directory
- 🚫 Blacklist specific directories and files
- ⚠️ Partially blacklist directories to display only their names
- 🗂️ Include the root directory in the tree structure output

## 🔧 Configuration

Edit the `tree.ps1` script to configure the directory path, blacklist, and partial blacklist:

```powershell
# Configuration section
$Config = @{
    Path             = "C:\Your\Directory"     # Set the directory for which to generate the tree
    Blacklist        = @("node_modules", "*.log") # Directories and files to exclude completely
    PartialBlacklist = @("node_modules")          # Directories to display by name only
}
```

# 🚀 Usage

1. Clone the repository:

```sh
git clone https://github.com/yourusername/TreeVisualizer.git
cd TreeVisualizer
```

2. Edit the configuration:
   Open tree.ps1 and set the desired directory path, blacklist, and partial blacklist options in the configuration section.

3. Run the script:
   Double-click run_tree.bat or execute it from the command prompt:

```cmd
run_tree.bat
```

# 📝 Example

In the tree.ps1 file, you can set your configuration as follows:

```powershell
Copy code
# Configuration section
$Config = @{
    Path             = "C:\Your\Directory"     # Set the directory for which to generate the tree
    Blacklist        = @("node_modules", "*.log") # Directories and files to exclude completely
    PartialBlacklist = @("node_modules")          # Directories to display by name only
}
```

When you run run_tree.bat, the output will look like this:

```lua
+-- YourDirectory
    +-- subdir1
    |   +-- file1.txt
    |   +-- file2.txt
    +-- subdir2
        +-- file3.txt
```

# 📄 License

This project is licensed under the MIT License.
