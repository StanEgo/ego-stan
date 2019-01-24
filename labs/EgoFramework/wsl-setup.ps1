$package = 'Ubuntu.appx'

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

#TODO: Doesn't work as expected, probably I should try wsl.exe instead of bash.exe.
# Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile $package -UseBasicParsing
# Add-AppxPackage -Path Ubuntu.appx
lxrun /install /y
