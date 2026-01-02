# /bin/bash

# Put the git stuff into temp, system can delete it after!
cd /tmp/
git clone https://github.com/ItsCryptic/dotfiles
cd dotfiles

# Setup ZSH

mv .zshrc ~/.zshrc

# Setup modprobe files!

cd modprobe.d
mv audio_powersave.conf /etc/modprobe.d/audio_powersave.conf

# Setup alacritty

cd ../.config/
mv alacritty/ ~/.config/alacritty/

# Setup fastfetch

mv fastfetch/ ~/.config/fastfetch/

# Setup pipewire

mv pipewire/ ~/.config/pipewire
