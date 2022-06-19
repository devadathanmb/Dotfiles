#! /bin/bash

USER_HOME=$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)
download_dir="${USER_HOME}/Downloads/script-downloads/"

# Install necessary fonts
echo "Installing nerd fonts.."
git clone "https://github.com/icantcodeanyways/my-fonts.git" ${download_dir}/my-fonts
sudo cp -v ${download_dir}/my-fonts/*.tff /usr/local/share/fonts
fc-cache -f -v

# Install oh my zsh
echo "Installing oh-my-zsh.."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Oh-my-zsh plugins
echo "Installing oh-my-zsh plugins.."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Setup p10k
echo "Setting up p10k.."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cp -v .zshrc ${USER_HOME}
cp -v .bashrc ${USER_HOME}

# Set zsh as default shell
echo "Changing default shell to zsh.."
sudo chsh -s $(which zsh)

# Set kitty config
echo "Setting up kitty configs.."
mkdir -p $USER_HOME/.config/kitty
cp -v kitty-config/{kitty.config, nord.config} ${USER_HOME}/.config/kitty

# Vscode setup
# Install extensions
echo "Setting up vscode configs.."
chmod -v 777 ./vscode/extensions
./vscode/extensions

# Move vscode settings.json 
cp -v vscode/settings.json ${USER_HOME}/.config/Code/User

# Setup vim config
mkdir -p ${USER_HOME}/.vim
cp -v vim/.vimrc/ {USER_HOME}/

# Setup terminal theme using Gogh
clear
echo "Changing terminal colorscheme.."
bash -c  "$(wget -qO- https://git.io/vQgMr)" 

# Change default terminal
clear
echo "Changing default terminal.."
sudo update-alternatives --config x-terminal-emulator

# Remove script download directory
rm -rf ${download_dir}

# Change fonts and run p10kconfig
clear
echo "Close the terminal, change the fonts to nerd fonts and run p10kconfig"
