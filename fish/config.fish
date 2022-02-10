if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias "vim"="nvim"
alias ".."="cd .."

function fish_greeting
  figlet -w 100 kevind.me 
end

starship init fish | source

