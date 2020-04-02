#!/bin/sh
cd $(dirname $0)
for dotfile in .?*; do
    case $dotfile in
        *.elc)
            continue;;
        ..)
            continue;;
        .git)
            continue;;
        .gitignore)
            continue;;
        .gitmodules)
            continue;;
        .git-templates)
            continue;;
        *)
            ln -Fis "$PWD/$dotfile" $HOME
            ;;
    esac
done


# Create site specific files
for localfile in .gitconfig.local .zshenv.local; do
    target=$HOME/$localfile
    if [[ ! -s $target ]]
        then touch $target
    fi
done

