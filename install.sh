#!/usr/bin/env bash
SCRIPT_DIR=$(
    cd "$(dirname "$0")" || exit
    pwd
)
# sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get install -y fish unar unzip build-essential curl file git
sudo cp "$SCRIPT_DIR"/wsl.conf /etc
cp "$SCRIPT_DIR"/.clang-format ~/

echo 'windows_commands'
mkdir -p ~/windows_commands
ln -s '/mnt/c/Users/morihaya/AppData/Local/Programs/Microsoft VS Code/bin/code' ~/windows_commands
ln -s '/mnt/c/Windows/System32/curl.exe' ~/windows_commands
ln -s '/mnt/c/Program Files/Docker/Docker/resources/bin/docker-credential-desktop.exe' ~/windows_commands
ln -s '/mnt/c/WINDOWS/explorer.exe' ~/windows_commands
ln -s '/mnt/c/Users/morihaya/.go/bin/gocopy.exe' ~/windows_commands
ln -s '/mnt/c/Users/morihaya/.go/bin/gopaste.exe' ~/windows_commands
ln -s '/mnt/c/WINDOWS/system32/ipconfig.exe' ~/windows_commands
ln -s '/mnt/c/WINDOWS/system32/mspaint.exe' ~/windows_commands
ln -s '/mnt/c/WINDOWS/notepad.exe' ~/windows_commands
ln -s '/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe' ~/windows_commands

echo 'homebrew'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >>  ~/.bashrc
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
mkdir -p ~/Source ~/Downloads
brew install tokei bat fd ripgrep python3 neofetch cpufetch onefetch

echo 'pip'
python3 -m pip install -U yt-dlp httpie

echo 'web'
brew install fnm deno
curl -fsSL https://fnm.vercel.app/install | bash
fnm env | source
fnm completions --shell fish >~/.config/fish/completions/fnm.fish
fnm completions --shell bash >>~/.bashrc
fnm install --lts
npm completion >>~/.bashrc
npm install -g all-the-package-names @google/clasp yarn

echo 'dotnet'
mkdir -p ~/.dotnet
curl -L -o ~/.dotnet/dotnet-install.sh https://dot.net/v1/dotnet-install.sh
chmod a+x ~/.dotnet/dotnet-install.sh
~/.dotnet/dotnet-install.sh --version latest --install-dir ~/.dotnet

echo 'clang'
brew install llvm clang-format cmake doxygen

echo 'golang'
curl -sSL https://git.io/g-install | sh -s -- fish -y

echo 'fish'
fish -c 'curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher'
fish -c 'fisher install metrofish/metrofish'
mkdir -p ~/.config/fish/
cp "$SCRIPT_DIR"/config.fish ~/.config/fish/
chsh -s /usr/bin/fish
