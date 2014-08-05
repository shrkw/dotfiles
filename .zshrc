#bindkey -v             # vi key bindings
bindkey -e             # emacs key bindings
# bindkey ' ' magic-space  # also do history expansion on space

# add-zsh-hook for prevention to override precmd
autoload -Uz add-zsh-hook

####################################################################
# local variable
#
local GRAY=$'%{\e[1;30m%}'
local LIGHT_GRAY=$'%{\e[0;37m%}'
local WHITE=$'%{\e[1;37m%}'

local LIGHT_BLUE=$'%{\e[1;36m%}'
local YELLOW=$'%{\e[1;33m%}'
local PURPLE=$'%{\e[1;35m%}'
local GREEN=$'%{\e[1;32m%}'
local BLUE=$'%{\e[1;34m%}'
local DEFAULT=$'%{\e[1;00m%}'

####################################################################
# prompt settings
#
autoload -U colors
colors
setopt prompt_subst
setopt transient_rprompt
#PROMPT='%B%{${fg[blue]}%}[%n@%m]%# %{${reset_color}%}%b'
#RPROMPT='%B%{${fg[blue]}%}[%~]%{${reset_color}%}%b'

#PROMPT='[%n@%m]%~%# '    # default prompt
#RPROMPT=' %~'     # prompt for right side of screen

PROMPT=$LIGHT_BLUE'[${USER}@${HOST}] %(!.#.$) '$DEFAULT
RPROMPT=$LIGHT_BLUE'[%39<...<${PWD}]'$DEFAULT

####################################################################
# enable contents assist at default
autoload -U compinit
compinit

####################################################################
# around directory settings
#
setopt auto_cd
setopt auto_pushd # automatically pushd
setopt pushd_ignore_dups

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
# history settings
#
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt share_history
setopt inc_append_history
setopt extended_history

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

HISTFILE=~/.zsh/zsh-history
HISTSIZE=100000
SAVEHIST=100000
function history-all { history -E 1 }

## peco integration
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history


####################################################################
# other
#
_Z_CMD=j
source ~/.zsh/z/z.sh

####################################################################
# other
#
source ~/.zsh/git-info
add-zsh-hook precmd _precmd_vcs_info

_precmd_prompt() {
    hostnam=${HOST##.*}     # wildcard, not regex!
    usernam=$(whoami)
    newPWD=${PWD}
    promptstr="--(${usernam}@${hostnam})-<mm/dd-hh:mm>---(${PWD})--"
    fillsize=$(( ${COLUMNS} - ${#promptstr} ))
    if [ $fillsize -ge 0 ]
    then
        fill=${(l.${fillsize}..-.)}
    else
        fill=""
        offset=$(( (${fillsize}*(-1)) + 4 ))
        newPWD="..."${newPWD[${offset},-1]}
    fi
}

add-zsh-hook precmd _precmd_prompt
add-zsh-hook precmd _precmd_vcs_info

source ~/.zsh/functions
source ~/.zsh/aliases
source ~/.zshenv.local
