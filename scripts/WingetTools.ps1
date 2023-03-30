function CheckCmdletExist($CmdName)
{
    $IsTheCmdValid = [bool](Get-Command -Name $CmdName -ErrorAction SilentlyContinue)
    return $IsTheCmdValid
}

$IsWingetInstalled = CheckCmdletExist "winget"
if(!$IsWingetInstalled){
    Invoke-WebRequest https://github.com/microsoft/winget-cli/releases/download/v0.1.42101-preview/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle -OutFile winget_installer.appxbundle
    Add-AppxPackage winget_installer.appxbundle
    $IsWingetBeenInstalled = CheckCmdletExist "winget"
}
if($IsWingetInstalled -Or $IsWingetBeenInstalled) { # Check if Boxstarter has been executed or not to avoid double install
    Write-Output "Installing winget packages"
    winget install --id=Microsoft.DotNet.Runtime.6 -e -h ;
    winget install --id=Microsoft.DotNet.SDK.6 -e -h ;
    winget install --id=Microsoft.dotNetFramework -v "4.7.1" -e -h ;
    winget install --id=Microsoft.dotNetFramework -v "4.8" -e -h ;
    winget install --id=Microsoft.AzureCLI -e -h ;
    winget install --id=Microsoft.AzureDataStudio -e -h ;
    winget install --id=SQLiteBrowser.SQLiteBrowser -e -h ;
    winget install --id=dbeaver.dbeaver -e -h ;
    winget install --id=StefanKueng.grepWin -e -h ;
    winget install --id=Microsoft.VC++2005Redist-x64 -e -h ;
    winget install --id=Microsoft.VC++2008Redist-x64 -e -h ;
    winget install --id=Microsoft.VC++2010Redist-x64 -e -h ;
    winget install --id=Microsoft.VC++2012Redist-x64 -e -h ;
    winget install --id=Microsoft.VC++2013Redist-x64 -e -h ;
    winget install --id=Microsoft.VC++2015Redist-x64 -e -h ;
    winget install --id=Microsoft.VC++2015-2019Redist-x64 -e -h ;
    winget install --id=Microsoft.VC++2017Redist-x64 -e -h ;
    winget install --id=Postman.Postman -e -h ;
    winget install --id=Microsoft.PowerShell -e -h ;
}