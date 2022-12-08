#!/bin/env bash
set -e

echo "
__________                       
\______   \_____  _____    ______
 |       _/\__  \ \__  \  /  ___/
 |    |   \ / __ \_/ __ \_\___ \ 
 |____|_  /(____  (____  /____  >
        \/      \/     \/     \/ 
                 --Adriano's Raas
" && sleep 1

#Default vars
HELPER="paru"

#System update
echo "Lemme update this legacy stuff real-quick fr fr..." && sleep 1
sudo pacman --noconfirm -Syu

echo "--No Cap, ima install some stuff rn...
" && sleep 1

#Install dependancies if not installed
sudo pacman -S --noconfirm --needed awesome picom polybar rofi feh i3lock make neovim

#Choices begin
#AUR helper
echo "Select an AUR helper 1) paru  2) yay"
read -r -p "What is the AUR helper of your choice? (Default is paru): " num

if [ $num -eq 2 ]
then
    HELPER="yay"
fi

if ! command -v $HELPER &> /dev/null
then
    echo "It seems that you don't have $HELPER installed, I'll install that for you before continuing."
	git clone https://aur.archlinux.org/$HELPER.git ~/.srcs/$HELPER
	(cd ~/.srcs/$HELPER/ && makepkg -si )
fi

# #Shell   --Breaks vm's Just remove the dependancies from "fish" in order to uncomment this
# echo "Type the shell of your choice, eg: fish, zsh, etc"
# read -r -p "What is the shell of your choice? (default is bash): " shelly
# sudo pacman -S $shelly
# echo /usr/local/bin/$shelly | sudo tee -a /etc/shells
# chsh -s /bin/$shelly

#Terminal
echo "Type the terminal of your choice, eg: kitty(preffered), terminator, etc"
read -r -p "Note: You will have to edit rc.lua if you choose a terminal other than kitty?: " termi
sudo pacman -S $termi

#Editor
echo "Type the editor of your choice, eg: neovim, emacs, etc"
read -r -p "What is the editor of your choice? (Default is nano): " edity
sudo pacman -S $edity

#File Manager
echo "Type the File Manager of your choice, eg: krusader, ranger, etc"
read -r -p "What is the File Manager of your choice?: " fmany
sudo pacman -S $fmany

echo "Note: WM, DE and other options wil need other configs, therefore its not an option to change" && sleep 1

#Neovim dependencies
sudo pacman -S ctags git curl && sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#Polybar dependencies
sudo pacman -S ttc-iosevka ttf-icomoon-icons

#Choices end

#Install the rice and everything nice 
mkdir -p ~/.config/
    if [ -d ~/.config/rofi ]; then
        echo "Rofi configs detected, backing up..."
        mkdir ~/.config/rofi.old && mv ~/.config/rofi/* ~/.config/rofi.old/
        cp -r ~/dotfiles/Raased/rofi/* ~/.config/rofi;
    else
        echo "Installing rofi configs..."
        mkdir ~/.config/rofi && cp -r ~/dotfiles/Raased/rofi/* ~/.config/rofi;
    fi
    sleep 1
    if [ -d ~/.config/nvim ]; then
        echo "Neovim configs detected, backing up..."
        mkdir ~/.config/nvim.old && mv ~/.config/nvim/* ~/.config/nvim.old/
        cp -r ~/dotfiles/Raased/nvim/* ~/.config/nvim;
    else
        echo "Installing neovim configs..."
        mkdir ~/.config/nvim && cp -r ~/dotfiles/Raased/nvim/* ~/.config/nvim;
    fi
    sleep 1
    if [ -d ~/.config/picom ]; then
        echo "Picom configs detected, backing up..."
        mkdir ~/.config/picom.old && mv ~/.config/picom/* ~/.config/picom.old/
        cp -r ~~/dotfiles/Raased/picom/* ~/.config/picom;
    else
        echo "Installing picom configs..."
        mkdir ~/.config/picom && cp -r ~/dotfiles/Raased/picom/* ~/.config/picom;
    fi
if [ -d ~/.config/polybar ]; then
        echo "Polybar configs detected, backing up..."
        mkdir ~/.config/polybar.old && mv ~/.config/polybar/* ~/.config/polybar.old/
        cp -r ~/dotfiles/Raased/polybar/* ~/.config/polybar;
        chmod +x ~/.config/polybar/launch.sh
    else
        echo "Installing polybar configs..."
        mkdir ~/.config/polybar && cp -r ~/dotfiles/Raased/polybar/* ~/.config/polybar;
        chmod +x ~/.config/polybar/launch.sh
    fi
    sleep 1
    if [ -d ~/.config/awesome ]; then
        echo "awesome configs detected, backing up..."
        mkdir ~/.config/awesome.old && mv ~/.config/awesome/* ~/.config/awesome.old/
        cp -r ~/dotfiles/Raased/awesome/* ~/.config/awesome;
    else
        echo "Installing awesome configs..."
        mkdir ~/.config/awesome && cp -r ~/dotfiles/Raased/awesome/* ~/.config/awesome;
    fi
    sleep 1
    if [ -d ~/Pictures ]; then
        echo "Moving images to ~/Pictures..."
        cp -r ~/dotfiles/Raased/Resources/* ~/Pictures;
    else
        echo "Creating a Pictures folder in ~/..."
        mkdir ~/Pictures && cp -r ~/dotfiles/Raased/Resources/* ~/Pictures;
    fi

#Done Bozo 
echo "           __________                                 
         .'----------'.                              
         | .--------. |                             
         | | REBOOT | |       __________              
         | |  TIME  | |      /__________\             
.--------| '--------' |------|    --=-- |-------------.
|        '----,-.-----'      |o ======  |             | 
|       ______|_|_______     |__________|             | 
|      /  %%%%%%%%%%%%  \                             | 
|     /  %%%%%%%%%%%%%%  \                            | 
|     ^^^^^^^^^^^^^^^^^^^^                            | 
+-----------------------------------------------------+
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ "
sleep 5

#Remove bloat lol
while true; do
    read -p "Do you want to remove this rice bloat? (y/n)" yn
    case $yn in
        [Yy]* ) rm -rf ~/Raas; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done