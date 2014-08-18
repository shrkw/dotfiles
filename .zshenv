#export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/usr/local/bin
#export DYLD_INSERT_LIBRARIES=/opt/local/lib/libreadline.dylib
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/usr/local/Caskroom"

function ssh() {
  if [[ -n $(printenv TMUX) ]]
  then
    local window_name=$(tmux display -p '#{window_name}')
    tmux rename-window -- "$@[-1]"
    command ssh $@
    tmux rename-window $window_name
  else
    command ssh $@
  fi
}
