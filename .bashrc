# Needed for git diff colors
export LESS="-RX"

# Git completion
. .git-completion.bash

# alias mappen
alias cdy='cd ~'

# terminal settings
# echo -en "\033[0;30m **0-30 kleurentest** \033[0;31m **0-31 kleurentest**  \033[0;32m **0-32 kleurentest** \033[0;33m **0-33 kleurentest**  \033[0;34m **0-34 kleurentest**  \033[0;35m **0-35 kleurentest**  \033[0;36m **0-36 kleurentest**  \033[0;37m **0-37 kleurentest** \n \033[1;30m **1-30 kleurentest**  \033[1;31m **1-31 kleurentest**  \033[1;32m **1-32 kleurentest**  \033[1;33m **1-33 kleurentest**  \033[1;34m **1-34 kleurentest**  \033[1;35m **1-35 kleurentest**  \033[1;36m **1-36 kleurentest**  \033[1;37m **1-37 kleurentest** \n"
# origineel
# \u@\h:\w>
export PS1='\[\033[1;34m\]$LOGNAME\[\033[1;34m\]@\[\033[1;34m\]$HOST\[\033[0;31m\]:\[\033[1;35m\]$PWD\[\033[0;0m\] \[\033[0;33m\]\t \[\033[1;31m\]> \[\033[0;0m\]'

function _git_prompt() {
    local git_status="`git status -unormal 2>&1`"
    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
        if [[ "$git_status" =~ nothing\ to\ commit ]]; then
            local ansi='0;32'
        elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
            local ansi='1;33'
        else
            #local ansi='1;31'
            if git diff --quiet 2>/dev/null >&2; then
               local ansi='0;35'
            else
               local ansi='1;31'
            fi
        fi
        if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
            branch=${BASH_REMATCH[1]}
            #test "$branch" != master || branch=' '
        else
            # Detached HEAD.  (branch=HEAD is a faster alternative.)
            branch="(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null ||
                echo HEAD`)"
        fi
        echo -n '[\[\e['"$ansi"'m\]'"$branch"'\[\e[0m\]] '
    fi
}
randcolor='220'
function _prompt_command() {
   #PS1='\[\033[0;36m\]\t \[\033[1;34m\]$LOGNAME\[\033[1;34m\]@\[\033[1;34m\]$HOST\[\033[0;31m\]:\[\033[0;35m\]$PWD\[\033[0;0m\] '"`_git_prompt`"'\[\033[1;31m\]> \[\033[0;0m\]'
        PS1='\[\e[38;5;40m\]\t \[\e[38;5;197m\]$LOGNAME@$HOST\[\e[38;5;14m\]:\[\e[38;5;${randcolor}m\]$PWD\[\033[0;0m\] '"`_git_prompt`"'\[\e[$([[ $? = 0 ]] && printf 32 || printf 31);1m\]> \[\033[0;0m\]'

echo -ne "\033]0;${HOSTNAME} ${USER}: ${PWD}\007"
}
PROMPT_COMMAND=_prompt_command

alias recolorcmd='_recolor'
function _recolor(){
   randcolor="`shuf -i 0-231 -n 1`"
}


#history show time 
export HISTTIMEFORMAT="%F %T "

#ls colors
LS_COLORS='rs=00:di=01;34:ln=01;36:mh=00:pi=33;40:so=01;35:do=01;35:bd=01;33;40:cd=01;33;40:or=01;31;40:su=37;41:sg=30;43:ca=30;41:tw=30;103:ow=94;103:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:*.php=00;37:*.cbl=00;36:*.lst=00;37:';
export LS_COLORS

# alias commondo's
alias vi='vim -N -O -u ytlvi.vimrc'
alias view='vim -RNO -u ytlview.vimrc'
alias lt='ls -althr --color=always'
alias l='ls -alF --color=always'
alias ls='ls $LS_OPTIONS --color=always'
alias lsr='ls -lhR'
alias grep='grep --color=always'
alias drupcs='phpcs --standard=Drupal '
alias drupbf='phpcbf --standard=Drupal'

# for ref in $(git for-each-ref --sort=committerdate --format="%(refname)" refs/heads/ ); do git log -n1 $ref --pretty=format:"%Cgreen%cr%Creset %C(yellow)%d%Creset %C(bold blue)<%an>%Creset %s %n" | cat ; done | awk '! a[$0]++'
alias gitbranch='for ref in $(git for-each-ref --sort=committerdate --format="%(refname)" refs/heads/ ); do git log -n1 $ref --pretty=format:"%Cgreen%cr%Creset %C(yellow)%d%Creset %C(bold blue)<%an>%Creset %s %n" | cat ; done | awk '"'! a["'$0'"]++'"
alias gitbranchauthor='for ref in $(git for-each-ref --sort=authordate --format="%(refname)" refs/heads/ ); do git log -n1 $ref --pretty=format:"%Cgreen%ar%Creset %C(yellow)%d%Creset %C(bold blue)<%an>%Creset %s %n" | cat ; done | awk '"'! a["'$0'"]++'"
