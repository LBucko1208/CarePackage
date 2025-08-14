# Set-ExecutionPolicy Unrestricted
# Set-ExecutionPolicy Restricted

# Install git and clone CarePackage
winget install -e --id Git.Git
winget install -e --id JesseDuffield.lazygit
cd /
git clone https://github.com/LBucko1208/CarePackage

# Install Software
winget install -e --id Mozilla.Firefox
winget install -e --id Spotify.Spotify
winget install -e --id Obsidian.Obsidian
winget install -e --id Bitwarden.Bitwarden

winget install -e --id 7zip.7zip
winget install -e --id Skillbrains.Lightshot

winget install -e --id Neovim.Neovim
winget install -e --id Notepad++.Notepad++
winget install -e --id TheDocumentFoundation.LibreOffice
winget install -e --id VideoLAN.VLC
winget install -e --id GIMP.GIMP

winget install -e --id CPUID.HWMonitor
winget install -e --id JetBrains.Toolbox

