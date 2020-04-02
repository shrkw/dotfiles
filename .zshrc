#bindkey -v             # vi key bindings
bindkey -e             # emacs key bindings
# bindkey ' ' magic-space  # also do history expansion on space

# add-zsh-hook for prevention to override precmd
autoload -Uz add-zsh-hook
source ~/.zsh.d/.zshrc.prompt
source ~/.zsh.d/.zshrc.basic
source ~/.zsh.d/.zshrc.cd
source ~/.zsh.d/.zshrc.history
source ~/.zsh.d/.zshrc.functions
source ~/.zsh.d/.zshrc.aliases
source ~/.zshenv.local

# load zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi
