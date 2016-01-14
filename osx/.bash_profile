################################################################################
#
# Variables
#
################################################################################
# export HOMEBREW_GITHUB_API_TOKEN=

################################################################################
#
# Path variables
#
################################################################################
export PATH="/usr/local/git/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="~/.composer/vendor/bin:$PATH"
export PATH="~/.bin:$PATH"

################################################################################
#
# Git customization
#
################################################################################
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\] \[\033[032m\]\$(parse_git_branch)\[\033[00m\]\$ "

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

################################################################################
#
# Aliases and term settings
#
################################################################################
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

alias ls='ls -GFh'
alias ll='ls -lAh'


################################################################################
#
# Setup JDK
#
################################################################################
function setjdk() {
    if [ $# -ne 0 ]; then
        removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
        if [ -n "${JAVA_HOME+x}" ]; then
            removeFromPath $JAVA_HOME
        fi
        export JAVA_HOME=`/usr/libexec/java_home -v $@`
        export PATH=$JAVA_HOME/bin:$PATH
    fi
}

function removeFromPath() {
    export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}

setjdk 1.8

################################################################################
#
# Google Cloud SDK
#
################################################################################

# The next line updates PATH for the Google Cloud SDK.
source '~/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '~/google-cloud-sdk/completion.bash.inc'

################################################################################
#
# Docker Settings
#
################################################################################

# Docker
eval "$(docker-machine env default)"

################################################################################
#
# The end
#
################################################################################

