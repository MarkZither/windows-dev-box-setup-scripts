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