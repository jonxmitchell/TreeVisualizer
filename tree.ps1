# Configuration section
$Config = @{
    Path             = "C:\Your\Directory"     # Set the directory for which to generate the tree
    Blacklist        = @("node_modules", "*.log") # Directories and files to exclude completely
    PartialBlacklist = @("node_modules")          # Directories to display by name only
}

# Function to generate the tree structure
function Get-Tree {
    param (
        [string]$BasePath,
        [string]$Prefix = "",
        [string[]]$Blacklist,
        [string[]]$PartialBlacklist
    )

    $items = Get-ChildItem -LiteralPath $BasePath | Sort-Object { $_.PSIsContainer } -Descending

    for ($i = 0; $i -lt $items.Count; $i++) {
        $item = $items[$i]
        $isLast = ($i -eq $items.Count - 1)

        $isBlacklisted = $false
        foreach ($pattern in $Blacklist) {
            if ($item.Name -like $pattern) {
                $isBlacklisted = $true
                break
            }
        }
        if ($isBlacklisted) { continue }

        $displayOnly = $false
        foreach ($partial in $PartialBlacklist) {
            if ($item.Name -eq $partial) {
                $displayOnly = $true
                break
            }
        }

        $connector = if ($item.PSIsContainer) { "+" } else { "|" }
        Write-Output "$Prefix$connector-- $($item.Name)"
        
        if ($item.PSIsContainer -and -not $displayOnly) {
            $newPrefix = $Prefix
            if ($isLast) {
                $newPrefix += "    "
            } else {
                $newPrefix += "|   "
            }
            Get-Tree -BasePath $item.FullName -Prefix $newPrefix -Blacklist $Blacklist -PartialBlacklist $PartialBlacklist
        }
    }
}

# Output the root directory as part of the tree structure
$rootPath = (Resolve-Path $Config.Path).Path
Write-Output "+-- $(Split-Path -Leaf $rootPath)"
Get-Tree -BasePath $rootPath -Prefix "    " -Blacklist $Config.Blacklist -PartialBlacklist $Config.PartialBlacklist
