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
" && sleep 2

#Default vars
HELPER="paru"

#System update
echo "Lemme update this legacy stuff real-quick fr fr..." && sleep 2
sudo pacman --noconfirm -Syu

echo ",---,---,---,---,---,---,---,---,---,---,---,---,---,-------,
|1/2| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | + | ' | <-    |
|---'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-----|
| ->| | Q | W | E | R | T | Y | U | I | O | P | ] | ^ |     |
|-----',--',--',--',--',--',--',--',--',--',--',--',--'|    |
| Caps | A | S | D | F | G | H | J | K | L | \ | [ | * |    |
|----,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'---'----|
|    | < | Z | X | C | V | B | N | M | , | . | - |          |
|----'-,-',--'--,'---'---'---'---'---'---'-,-'---',--,------|
| ctrl |  | alt |                          |altgr |  | ctrl |
'------'  '-----'--------------------------'------'  '------'
                       --No Cap, ima install some stuff rn...
" && sleep 2

#Install dependancies if not installed
sudo pacman -S --noconfirm --needed awesome picom polybar rofi ranger feh tmux i3lock kitty fish

#Install the rice and everything nice 
mkdir -p ~/.config/
    if [ -d ~/.config/rofi ]; then
        echo "Rofi configs detected, backing up..."
        mkdir ~/.config/rofi.old && mv ~/.config/rofi/* ~/.config/rofi.old/
        cp -r ~/Raas/Raased/rofi/* ~/.config/rofi;
    else
        echo "Installing rofi configs..."
        mkdir ~/.config/rofi && cp -r ~/Raas/Raased/rofi/* ~/.config/rofi;
    fi
    sleep 5
    if [ -d ~/.config/picom ]; then
        echo "Picom configs detected, backing up..."
        mkdir ~/.config/picom.old && mv ~/.config/picom/* ~/.config/picom.old/
        cp -r ~/Raas/Raased/picom/* ~/.config/picom;
    else
        echo "Installing picom configs..."
        mkdir ~/.config/picom && cp -r ~/Raas/Raased/picom/* ~/.config/picom;
    fi
    sleep 5
    if [ -d ~/.config/polybar ]; then
        echo "Polybar configs detected, backing up..."
        mkdir ~/.config/polybar.old && mv ~/.config/polybar/* ~/.config/polybar.old/
        cp -r ~/Raas/Raased/polybar/* ~/.config/polybar;
        chmod +x ~/.config/polybar/launch.sh
    else
        echo "Installing polybar configs..."
        mkdir ~/.config/polybar && cp -r ~/Raas/Raased/polybar/* ~/.config/polybar;
        chmod +x ~/.config/polybar/launch.sh
    fi
    sleep 5
    if [ -d ~/.config/awesome ]; then
        echo "awesome configs detected, backing up..."
        mkdir ~/.config/awesome.old && mv ~/.config/awesome/* ~/.config/awesome.old/
        cp -r ~/Raas/Raased/awesome/* ~/.config/awesome;
    else
        echo "Installing awesome configs..."
        mkdir ~/.config/awesome && cp -r ~/Raas/Raased/awesome/* ~/.config/awesome;
    fi
    sleep 5 
    if [ -d ~/Pictures ]; then
        echo "Moving images to ~/Pictures..."
        cp -r ~/Raas/Raased/Resources/* ~/Pictures;
    else
        echo "Creating a Pictures folder in ~/..."
        mkdir ~/Pictures && cp -r ~/Raas/Raased/Resources/* ~/Pictures;
    fi
    sleep 5 



    if [ -d ~/bin ]; then
        echo "~/bin detected, backing up..."
        mkdir ~/bin.old && mv ~/bin/* ~/bin.old/
        cp -r ~/Raas/Raased/bin/* ~/bin;
	clear
    else
        echo "Installing bin scripts..."
        mkdir ~/bin && cp -r ~/Raas/Raased/bin/* ~/bin/;
	clear
        SHELLNAME=$(echo $SHELL | grep -o '[^/]*$')
        case $SHELLNAME in
            bash)
                if [[ ":$PATH:" == *":$HOME/bin:"* ]]; then
                    echo "Looks like $HOME/bin is not on your PATH, adding it now."
                    echo "export PATH=\$PATH:\$HOME/bin" >> $HOME/.bashrc
                else
                    echo "$HOME/bin is already in your PATH. Proceeding."
                fi
                ;;

            zsh)
                if [[ ":$PATH:" == *":$HOME/bin:"* ]]; then
                    echo "Looks like $HOME/bin is not on your PATH, adding it now."
                    echo "export PATH=\$PATH:\$HOME/bin" >> $HOME/.zshrc
                else
                    echo "$HOME/bin is already in your PATH. Proceeding."
                fi
                ;;

            fish)
                echo "I see you use fish. shahab96 likes your choice."
                fish -c fish_add_path -P $HOME/bin
                ;;

            *)
                echo "Please add: export PATH='\$PATH:$HOME/bin' to your .bashrc or whatever shell you use."
                echo "If you know how to add stuff to shells other than bash, zsh and fish please help out here!"
        esac
    fi
    

# done 
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