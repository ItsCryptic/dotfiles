if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
  figlet -w 100 kevind.me 
end

starship init fish | source

