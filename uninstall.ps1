$targetDir = "C:\tools"
$targetFile = "$targetDir\tclip.exe"

# Remove the executable
if (Test-Path -Path $targetFile) {
    Write-Host "Removing $targetFile..."
    Remove-Item -Force $targetFile
} else {
    Write-Host "tclip.exe not found at $targetFile."
}

# Remove the tools dir from PATH if it's now empty
if ((Test-Path $targetDir) -and !(Get-ChildItem $targetDir)) {
    Write-Host "Removing empty $targetDir directory..."
    Remove-Item -Force $targetDir
}

# Remove C:\tools from user PATH
$userPath = [Environment]::GetEnvironmentVariable("PATH", "User")
if ($userPath -match [regex]::Escape($targetDir)) {
    $newPath = ($userPath -split ";" | Where-Object { $_ -ne $targetDir }) -join ";"
    [Environment]::SetEnvironmentVariable("PATH", $newPath, "User")
    Write-Host "Removed $targetDir from PATH."
}

Write-Host ""
Write-Host "tclip has been uninstalled." -ForegroundColor Green
