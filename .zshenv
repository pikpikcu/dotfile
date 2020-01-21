#
# ~/.zshenv
# Zsh passes these variables to Bash children

# Set $PATH
typeset -U path
path=(~/bin ~/bin/more ~/bin/markets $path)

## Source from .profile
[[ -f ~/.profile ]] && . ~/.profile

