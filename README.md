# dotfiles

## Alacritty

Those files need to be in ~/.config/alacritty/ or in one of the other places alacritty checks for its config file. Also make sure you change the path of the home directory within the alacritty config.

## Neofetch

That will need to be placed in ~/.config/neofetch/


## Fish

The fish config relies on [Starship](https://starship.rs/). Please install it before attempting to use that config file. I also use Figlet, which is likely in your repositories, just make sure you have that too and change the text it outputs, or if you don't want it at all; just get rid of it.

## Vim

Run ```mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/color ~/.vim/plugged``` in your terminal then run ```curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim``` which will give you my plugin manager. Then you can run ```:source .vimrc``` then run ```:PlugInstall``` within vim, which will install my plugins. You'll then want to follow the steps for the [Dracula](https://draculatheme.com/) color scheme for vim, and do what it says. Now you're done!

## Neovim

To use my config with neovim, just create a symlink from .vimrc to init.vim with ```sudo ln -s ~/.vimrc ~/.config/nvim/init.vim``` and copy plugged from vim to neovim with ```cp ~/.vim/autoload/plug.vim ~/.local/share/nvim/site/autoload/plug.vim``` and you should be good to go!

# Zsh

It uses [Zapped](https://www.zapzsh.com/) for plugin management.

Most of my configs use the [Dracula](https://draculatheme.com/) color scheme. Please check them out!
