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
if [[ -d ${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh-completions ]]; then
  fpath=("${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh-completions" $fpath)

  autoload -Uz compinit
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  zcompdump_old=(${zcompdump}(N.mh+24))
  if [[ ! -s "$zcompdump" ]] || (( $#zcompdump_old )); then
    compinit -d "$zcompdump"
  else
    compinit -C -d "$zcompdump"
  fi
fi
