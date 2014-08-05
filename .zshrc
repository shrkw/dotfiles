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
#
setopt magic_equal_subst # directory assist at command option input
setopt auto_menu # Automatically list choices on an ambiguous completion
setopt correct # command suggestion at typo
setopt auto_name_dirs
setopt auto_remove_slash # 
setopt rm_star_silent
setopt sun_keyboard_hack
setopt extended_glob # ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
setopt list_types
setopt no_beep # no beep
setopt nolistbeep # no beep when complete list displayed
setopt always_last_prompt
setopt cdable_vars
setopt sh_word_split
setopt auto_param_keys
setopt list_packed # compacked complete list display

####################################################################
# change directory settings
#
setopt auto_cd
setopt auto_pushd # automatically pushd
setopt pushd_ignore_dups

# improved cd
source ~/.zsh/z/z.sh
_Z_CMD=j

####################################################################
# history settings
source ~/.zsh/.zshrc.history

####################################################################
# other
source ~/.zsh/.zshrc.functions
source ~/.zsh/.zshrc.aliases
source ~/.zshenv.local

