$url = "https://github.com/yeabisra-b/tclip/releases/download/v0.1.1/tclip.exe"
$targetDir = "C:\tools"
$targetFile = "$targetDir\tclip.exe"

# Create the a tools folder if it doesn't exist
if (!(Test-Path -Path $targetDir)) {
    Write-Host "Creating directory $targetDir..."
    New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
}

# Download the executable from github releases
Write-Host "Downloading tclip.exe from GitHub..."
try {
    Invoke-WebRequest -Uri $url -OutFile $targetFile
    Write-Host "Download successful."
} catch {
    Write-Error "Failed to download tclip.exe. Please check your internet connection and the URL."
    exit
}

# Get the current User PATH
$userPath = [Environment]::GetEnvironmentVariable("PATH", "User")

# Check if the target directory is already in the PATH
if ($userPath -notmatch [regex]::Escape($targetDir)) {
    Write-Host "Adding $targetDir to the user PATH..."
    # Ensure there's a semicolon separator if the path isn't empty
    if ($userPath -and !$userPath.EndsWith(";")) {
        $userPath += ";"
    }
    $newPath = $userPath + $targetDir
    [Environment]::SetEnvironmentVariable("PATH", $newPath, "User")
    
    Write-Host "PATH updated successfully!"
    Write-Host "*** Note: You may need to restart your terminal for the PATH changes to take effect. ***" -ForegroundColor Yellow
} else {
    Write-Host "$targetDir is already in your PATH."
}

Write-Host ""
Write-Host "Installation complete! You can now use 'tclip' in your terminal." -ForegroundColor Green
