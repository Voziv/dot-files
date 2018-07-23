# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi


################################################################################
#
# Path variables
#
################################################################################
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
#PATH="$HOME/bin:$HOME/.local/bin:$PATH"


################################################################################
#
# Git customization
#
################################################################################
parse_git_branch() {
    # git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    (git branch 2> /dev/null) | grep \* | cut -c3-
}

has_git_changes() {
    [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && echo "**"
}

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\] \[\033[032m\]\$(parse_git_branch)\$(has_git_changes)\[\033[00m\]\$ "

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi


################################################################################
#
# Aliases and term settings
#
################################################################################
alias pbcopy="xclip -sel clip"
alias dc='docker-compose'


################################################################################
#
# The end
#
################################################################################

