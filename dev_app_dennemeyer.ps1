# Description: Boxstarter Script
# Author: Microsoft
# Common dev settings for desktop app development

Disable-UAC

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "./scripts"
write-host "helper script base URI is $helperUri"

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
	iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

#--- Setting up Windows ---
executeScript "SystemConfiguration.ps1";
executeScript "FileExplorerSettings.ps1";
executeScript "RemoveDefaultApps.ps1";
executeScript "CommonDevTools.ps1";
executeScript "Browsers.ps1";
executeScript "HyperV.ps1";
executeScript "WSL.ps1";
executeScript "WingetTools.ps1";

write-host "Installing tools inside the WSL distro..."
# Nothing here at the moment, Ubuntu 20.04 comes with Python3 

write-host "Finished installing tools inside the WSL distro"

#--- Tools ---
#--- Installing VS and VS Code with Git
# See this for install args: https://chocolatey.org/packages/VisualStudio2022Professional
# https://docs.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-community
# https://docs.microsoft.com/en-us/visualstudio/install/use-command-line-parameters-to-install-visual-studio#list-of-workload-ids-and-component-ids
# visualstudio2017community
# visualstudio2017professional
# visualstudio2017enterprise

choco install -y visualstudio2022professional --package-parameters="'--add Microsoft.VisualStudio.Component.Git'"
Update-SessionEnvironment #refreshing env due to Git install

#--- UWP Workload and installing Windows Template Studio ---
choco install -y visualstudio2022-workload-azure
#choco install -y visualstudio2019-workload-universal
#choco install -y visualstudio2022-workload-universalbuildtools
choco install -y visualstudio2022-workload-manageddesktopbuildtools
choco install -y visualstudio2022-workload-manageddesktop
choco install -y visualstudio2022-workload-nativedesktop
choco install -y visualstudio2022-workload-netweb
choco install -y visualstudio2022-workload-vctools
choco install -y visualstudio2022-workload-data
choco install -y visualstudio2022-workload-visualstudioextension
choco install -y visualstudio2022-workload-office
choco install -y visualstudio2022-workload-visualstudioextensionbuildtools
choco install -y visualstudio2022-workload-azurebuildtools
choco install -y visualstudio2022-workload-officebuildtools
choco install -y visualstudio2022-workload-node
choco install -y visualstudio2022-workload-nodebuildtools
choco install -y visualstudio2022-workload-databuildtools
choco install -y visualstudio2022-workload-webbuildtools

choco install -y sql-server-2019
choco install -y sql-server-management-studio

choco install -y dotnet4.7
choco install -y netfx-4.7-devpack

#--- Tools ---
choco install -y nodejs-lts # Node.js LTS, Recommended for most users
# choco install -y nodejs # Node.js Current, Latest features

#--- Microsoft WebDriver ---
choco install -y microsoftwebdriver

choco upgrade all
#--- reenabling critial items ---
Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
