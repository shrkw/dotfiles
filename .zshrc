#bindkey -v             # vi key bindings
bindkey -e             # emacs key bindings
# bindkey ' ' magic-space  # also do history expansion on space

# add-zsh-hook for prevention to override precmd
autoload -Uz add-zsh-hook
# enable contents assist at default
autoload -U compinit
compinit

####################################################################
# prompt settings
source ~/.zsh/.zshrc.prompt

####################################################################
# Set shell options
source ~/.zsh/.zshrc.basic

####################################################################
# change directory settings
source ~/.zsh/.zshrc.cd

####################################################################
# history settings
source ~/.zsh/.zshrc.history

####################################################################
# other
source ~/.zsh/.zshrc.functions
source ~/.zsh/.zshrc.aliases
source ~/.zshenv.local

