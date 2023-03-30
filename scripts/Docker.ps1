Enable-WindowsOptionalFeature -Online -FeatureName containers -All
RefreshEnv
choco install -y rancher-desktop
choco install -y vscode-docker