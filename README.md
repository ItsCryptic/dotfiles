# configs

## Alacritty Configs

Those files need to be in ~/.config/alacritty/ or in one of the other places alacritty checks for its config file. Also make sure you change the path of the home directory within the alacritty config.

## Neofetch Config

That will need to be placed in ~/.config/neofetch/


## Fish Config

The fish config relies on [Starship](https://starship.rs/). Please install it before attempting to use that config file. I also use Figlet, which is likely in your repositories, just make sure you have that too and change the text it outputs, or if you don't want it at all; just get rid of it.

## Vim Config

Run ```mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/color ~/.vim/plugged``` in your terminal then run ```curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim``` which will give you my plugin manager. Then you can run ```:source .vimrc``` then run ```:PlugInstall``` within vim

Most of my configs use the [Dracula](https://draculatheme.com/) color scheme. Please check them out!
