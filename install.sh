# -- zsh ---------------------
ln -s -f $PWD/zsh/.zshrc ~/
ln -s -f $PWD/zsh/.zshenv ~/
ln -s -f $PWD/zsh/.p10k.zsh ~/
ln -s -f $PWD/zsh/.zsh_history ~/

# -- Alacritty ---------------------
ln -s -f $PWD/alacritty/ ~/.config/

# -- i3wm ---------------------
ln -s -f $PWD/i3/ ~/.config/

# -- picom ---------------------
ln -s -f $PWD/picom/picom.conf ~/.config/

# -- lvim ---------------------
# First install node, python, rust and lunarvim to link this config
ln -s -f $PWD/lvim/ ~/.config/

# -- polybar ---------------------
ln -s -f $PWD/polybar/ ~/.config/

# -- rofi ---------------------
ln -s -f $PWD/rofi/ ~/.config/

# -- tmux ---------------------
ln -s -f $PWD/tmux/.tmux-themepack/ ~/
ln -s -f $PWD/tmux/.tmux.conf ~/
ln -s -f $PWD/tmux/.tmux.conf.local ~/


# -- scripts ---------------------
ln -s -f $PWD/scripts/ ~/

# -- yay ---------------------
# pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

# -- chrome ---------------------
# https://aur.archlinux.org/packages/google-chrome

# -- discord ---------------------
# https://wiki.archlinux.org/title/Discord#Installation

# -- bluetooth ---------------------
# https://wiki.archlinux.org/title/bluetooth#Installation
# https://wiki.archlinux.org/title/bluetooth_headset#Headset_via_Bluez5/PulseAudio

# -- git ---------------------
# https://wiki.archlinux.org/title/git#Installation

#  git config --global user.name  "Gandarfh"
#  git config --global user.email "jgdsantosferreira@gmail.com"
# config ssh and connect to github
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

# GPG Github
# https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification

# -- lazygit ---------------------
# https://github.com/jesseduffield/lazygit

# -- node - npm ---------------------
# https://wiki.archlinux.org/title/Node.js_#Installation

# -- Rust - cargo ---------------------
# https://wiki.archlinux.org/title/rust#Installation

# -- zsh ---------------------
# https://github.com/romkatv/powerlevel10k#manual
# https://wiki.archlinux.org/title/zsh#Installation
# make zsh your default shell `chsh -s $(which zsh)`

# -- Alacritty ---------------------
# https://wiki.archlinux.org/title/Alacritty#Installation

# -- Noisetorch ---------------------
# https://aur.archlinux.org/packages/noisetorch
