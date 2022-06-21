#! /bin/bash

# Run this script as root
if [ "$EUID" -ne 0 ]
then
  echo "Run as root"
  exit
fi

# Users home directory
USER_HOME=$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)

# Creating a directory for downloads
download_path="${USER_HOME}/Downloads/install-script-downloads"
mkdir -p $download_path

# Update system repositories and upgrade them
apt update && apt upgrade -y

# Install firefox
echo "Installing firefox.."
apt install firefox -y

# Install vscode
echo "Installing vscode.."
apt install code -y

# Install git
echo "Installing git.."
apt install git -y

# Install unzip
echo "Installing unzip.."
apt install unzip -y

# Install curl
echo "Installing curl.."
apt install curl -y

# Install htop bpytop
echo "Installing htop and bpytop.."
apt install htop bpytop -y

# Install neofetch
echo "Installing neofetch.."
apt install neofetch -y

# Install vlc
echo "Installing VLC Media Player.."
apt install vlc -y

# Install gnome tweaks
echo "Installing gnome tweaks.."
apt install gnome-tweaks -y

# Install smartmontools
echo "Installing smartmontools.."
apt install smartmontools -y

# Install notepadqq
echo "Intalling notepadqq.."
apt install notepadqq -y

# Install timeshift
echo "Installing timeshift.."
apt install timeshift -y

# Install zsh
echo "Installing zsh.."
apt install zsh -y

# Install simple screen recorder
echo "Installing simple screen recorder.."
apt install simplescreenrecorder -y

# Install batcat
echo "Installing batcat.."
apt install bat -y

# Install cmatrix
echo "Installing cmatrix.."
apt install cmatrix -y

# Install flatpak
echo "Installing flatpak.."
apt install flatpak -y
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install snap
echo "Installing snap.."
apt install snapd -y

# Install yarn
echo "Installing yarn.."
apt install yarn -y

# Install Gparted
echo "Installing gparted.."
apt install gparted -y

# Install virtualbox
echo "Installing virtualbox.."
apt install virtualbox -y

# JDK Installation
echo "Installing open jdk.."
apt install openjdk-18-jdk-headless -y

# Installing Proprietary Media Codecs and Fonts
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
apt install ubuntu-restricted-extras -y

# Install kitty
echo "Installing kitty.."
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Intall autocpufreq
echo "Installing autocpufreq.."
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && ./auto-cpufreq-installer -y
auto-cpufreq --install

# Install vim
echo "Installing vim.."
add-apt-repository ppa:jonathonf/vim -y
apt update
apt install vim -y

# Install neovim
echo "Installing neovim.."
add-apt-repository ppa:neovim-ppa/stable -y
apt update
apt install neovim -y

# Install appimagelauncher
echo "Installing appimagelauncher.."
add-apt-repository ppa:appimagelauncher-team/stable -y
apt update
apt install appimagelauncher -y

# Install brave browser
echo "Installing brave browser.."
apt install apt-transport-https curl -y
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"| tee /etc/apt/sources.list.d/brave-browser-release.list
apt update
apt install brave-browser -y

# Install google chrome
echo "Installing google chrome.."
wget -O "${download_path}/chrome.deb" https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i "${download_path}/chrome.deb"

# Install discord
echo "Installing discord.."
wget -O "${download_path}/discord.deb" https://discord.com/api/download?platform=linux&format=deb
dpkg -i "${download_path}/discord.deb"

# Install balena etcher
echo "Installing balena etcher.."
wget -O "${download_path}/etcher.deb" https://github.com/balena-io/etcher/releases/download/v1.7.9/balena-etcher-electron_1.7.9_amd64.deb
dpkg -i "${download_path}/etcher.deb"

# Install lsd
echo "Installing lsd.."
wget -O "${download_path}/lsd.deb" https://github.com/Peltoche/lsd/releases/download/0.21.0/lsd_0.21.0_amd64.deb
dpkg -i "${download_path}/lsd.deb"

# Install onlyoffice
echo "Installing onlyoffice.."
wget -O "${download_path}/onlyoffice-install.deb" https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb
dpkg -i "${download_path}/onlyoffice-install.deb"

# Autoinstall any missing dependencies 
sudo apt -f install -y

# Install telegram
echo "Installing telegram.."
flatpak install -y org.telegram.desktop

# Install postman
echo "Installing postman.."
flatpak install -y com.getpostman.Postman

# Install Login Manager Settings
echo "Installing Login Manager Settings.."
flatpak install -y io.github.realmazharhusain.GdmSettings

# Node js installation

  # Install and run nvm
  curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh -o ${download_path}/install_nvm.sh
  bash ${download_path}/install_nvm.sh

  # Export nvm
  export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  # Source nvm
  source ~/.bash_profile

  # Test if nvm is installed
  command -v nvm

  # Install nodejs
  nvm install --lts
  
# Remove the downloaded files
echo "Removing the downloaded packages and files.."
rm -v -rf ${download_path}

# Update repositories and upgrade them
apt update && apt upgrade -y

# Remove unwanted dependencies
apt autoremove -y
apt autoclean
