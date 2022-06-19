# Dotfiles

My custom configuration files for my linux system and a script which automates the installation of necessary tools and customization.

## Get started

**NOTE : This script is only for Debian based operating systems.**  

Make sure wget and unzip is installed on your system with

```bash
wget --version
unzip --version
```
Otherwise install wget and unzip using

```bash
sudo apt install wget -y
sudo apt install unzip -y
```

Copy the following code into your terminal

```bash
wget https://github.com/devadathanmb/Dotfiles/archive/refs/heads/master.zip
unzip master.zip
cd Dotfiles-master
```

### To execute the install script

```bash
sudo ./install-script.sh
```

### To execute the cutomization script

**NOTE : Make sure that you run this script after running the install script.**

```bash
./customize.sh
```
