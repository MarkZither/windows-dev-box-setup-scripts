choco install -y wsl2 --params "/Version:2 /Retry:true"

#--- Ubuntu ---
# TODO: Move this to choco install once --root is included in that package
<#
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile ~/Ubuntu.appx -UseBasicParsing
Add-AppxPackage -Path ~/Ubuntu.appx
# run the distro once and have it install locally with root user, unset password

RefreshEnv
Ubuntu1804 install --root
Ubuntu1804 run apt update
Ubuntu1804 run apt upgrade -y
#>
<#
choco install -y wsl-ubuntu-2004
#>
Invoke-WebRequest -Uri https://aka.ms/wslubuntu2204 -OutFile ~/Ubuntu2204.appx -UseBasicParsing
Add-AppxPackage -Path ~/Ubuntu2204.appx
# run the distro once and have it install locally with root user, unset password

RefreshEnv
Ubuntu install --root
Ubuntu run apt update
Ubuntu run apt upgrade -y

<#
NOTE: Other distros can be scripted the same way for example:

#--- SLES ---
# Install SLES Store app
Invoke-WebRequest -Uri https://aka.ms/wsl-sles-12 -OutFile ~/SLES.appx -UseBasicParsing
Add-AppxPackage -Path ~/SLES.appx
# Launch SLES
sles-12.exe

# --- openSUSE ---
Invoke-WebRequest -Uri https://aka.ms/wsl-opensuse-42 -OutFile ~/openSUSE.appx -UseBasicParsing
Add-AppxPackage -Path ~/openSUSE.appx
# Launch openSUSE
opensuse-42.exe
#>

