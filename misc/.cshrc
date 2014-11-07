### tcsh configure create by zhoujd at 2014/10/4

bindkey '\e[1~' beginning-of-line      # Home
bindkey '\e[3~' delete-char            # Delete
bindkey '\e[4~' end-of-line            # End
bindkey "^W"    backward-delete-word   # Delete

set cr = "%{\e[31m%}" #red
set cg = "%{\e[32m%}" #green
set cy = "%{\e[33m%}" #yellow
set cc = "%{\e[36m%}" #cyan
set c0 = "%{\e[0m%}"  #back to default

# Set some variables for interactive shells
if ( $?prompt ) then
    if ( "$uid" == "0" ) then
	    set prompt = "$cy%B%U%n%u@%m.$cr%l$cg%b %c2 %B$c0%#%b " 
    else
	    set prompt = "$cy%B%U%n%u@%m.$cg%l$cr%b %c2 %B$c0%%%b "
    endif
endif

# ls colors
setenv LSCOLORS ExGxFxdxCxegedabagExEx
setenv CLICOLOR yes

# grep colors
#setenv GREP_OPTIONS --color=auto

set autolist
set autoexpand
set history = 100
set savehist = 10

set noclobber

alias mv 'mv -i'
alias cp 'cp -i'

alias ..    'cd ..'            # up directory
alias -	    'cd -'             # last directory
alias q	    'exit'             # exit
alias rm    'rm -i'            # remove protect
alias del   'rm -r'            # remove dirctory
alias mv    'mv -i'            # rename protect
alias cp    'cp -i'            # copy protect
alias ls    'ls --color=auto'  # ls color
alias la    'ls -a'            # show all files
alias ll    'ls -h -l'         # show file size limited
alias lr    'ls -R'            # rescuse
alias dh    'df -h -a -T'      # disk remainin show
alias ds    'du -sh'           # file/dirs size
alias 2sh   'bash --login -i'  # switch to sh

alias find-c	'find . -name "*.h" -o -name "*.c"'
alias find-x	'find . -name "*.h" -o -name "*.hpp" -o -name "*.cpp" -o -name "*.cxx"'
alias find-py	'find . -name ".py"'

alias wc-c	'find . -name "*.h" -o -name "*.c" | xargs wc | sort -k 4'
alias wc-x	'find . -name "*.h" -o -name "*.hpp" -o -name "*.cpp" -o -name "*.cxx" | xargs wc | sort -k 4'
alias wc-py	'find . -name ".py" | xargs wc | sort -k 4'
