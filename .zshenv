#export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/usr/local/bin
#export DYLD_INSERT_LIBRARIES=/opt/local/lib/libreadline.dylib
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/usr/local/Caskroom"

if [ "$TERM" = "screen" ]; then
  PROMPT=$LIGHT_BLUE'[${USER}@${HOST} win:[$WINDOW]] %(!.#.$) '$DEFAULT
  chpwd () { echo -n "_`dirs`__" }
  preexec() {
    # see [zsh-workers:13180]
    # http://www.zsh.org/mla/workers/2000/msg03993.html
    emulate -L zsh
    local -a cmd; cmd=(${(z)2})
    case $cmd[1] in
      fg)
        if (( $#cmd == 1 )); then
          cmd=(builtin jobs -l %+)
        else
          cmd=(builtin jobs -l $cmd[2])
        fi
        ;;
      %*) 
        cmd=(builtin jobs -l $cmd[1])
        ;;
      cd)
        if (( $#cmd == 2)); then
          cmd[1]=$cmd[2]
        fi
        ;&
      *)
        echo -n "k$cmd[1]:t__"
        return
        ;;
    esac

    local -A jt; jt=(${(kv)jobtexts})

    $cmd >>(read num rest
      cmd=(${(z)${(e):-_$jt$num}})
      echo -n "k$cmd[1]:t__") 2>/dev/null
  }
  chpwd
fi
