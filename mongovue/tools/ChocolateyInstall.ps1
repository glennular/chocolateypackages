﻿try {
  $package = 'MongoVUE'

  if (Test-Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{5B55CD4F-146D-4B7E-9E75-DE4432797A43}") {
    Write-Host "MongoVUE is already installed! Adding to chocolatey database"
  }
  else {

    $url = 'http://www.mongovue.com/Installer-1.6.9.zip'
    $destination = Join-Path $Env:Temp 'MongoVue'
    $msiPath = Join-Path $destination 'Installer.msi'

    Install-ChocolateyZipPackage $package -url $url -unzipLocation $destination
    Install-ChocolateyInstallPackage $package 'msi' '/quiet' $msiPath

    Remove-Item $destination -Recurse
  }
  Write-ChocolateySuccess $package
} catch {
  Write-ChocolateyFailure $package "$($_.Exception.Message)"
  throw
}
