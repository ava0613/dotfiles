###########
# 
#
export FZF_DEFAULT_OPTS="\
--cycle
--preview 'bat --style=numbers --color=always --line-range :500 {}' \
--bind ctrl-p:preview-up,ctrl-n:preview-down,\
ctrl-b:preview-page-up,ctrl-f:preview-page-down,\
ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,\
ctrl-h:preview-top,ctrl-e:preview-bottom,\
alt-up:half-page-up,alt-up:half-page-down"
#--wrap --wrap-sign '>> '


alias cdw='cd ~/work'
alias cdava='cd '$HOME'/work/avadev'

alias che='chezmoi'
alias cdche='cd ~/.local/share/chezmoi'
alias tmuxo='tmux -f ~/.config/tmux/tmux.conf.outer'
alias tmuxi='tmux -f ~/.config/tmux/tmux.conf.inner'
alias tmux18='tmux -f ~/.config/tmux/tmux18.conf.inner'

#alias cdp='cd $(ls ~/work | fzf)'

fzf_dir() # get the dir of a path selected with fzf, searches only in homedir
{
    if [ -n "$1" ]
    then
      input_path=$1
    else
      input_path=""
    fi
    #path=$(find $input_path | fzf)
    path=$(rg --files --color never $input_path | fzf --cycle)
    if [ -d "$path" ]; then
        printf $path
    else
        printf $(dirname $path)
    fi
}

fzf_cd()
{
    cd $(fzf_dir $1)
    ls -la
}
alias fcd=fzf_cd
  #
fzf_mc()
{
   mc $(fzf_dir $1)
}
alias mcd=fzf_mc

cd_project()
{
   cd ~/work/$(ls ~/work | fzf --cycle)
}
alias cdp=cd_project

alias fvi="fzf --bind 'enter:execute(nvim.appimage {})'"
alias fzz="fzf --bind 'enter:execute(cat {})'"

# git stuff
alias deltav='delta --side-by-side'
alias ggst='git status'
alias ggsu='git status -uno'
alias gglog='git log  --graph --oneline --pretty="%aI %C(green)%h %C(yellow)%an %C(red) %s"'
alias gglp='git log -p'
alias gglpU='git log -p -U99999'
alias gglf='git log --name-only'
#alias ggck='git checkout'
git_branch()
{
    if [ -n "$1" ]
    then
      git checkout $1
    else
      git branch -vv
    fi
}

alias ggbr='git_branch'


alias ggh='echo "some git help/reminder - useful git commands
git diff 0dca0..86ad2f NodataService.py | delta 
git log -p -5
git show 0dca0 NodataService.py > NodataService.py.older
git stash, or, git stash push -m "message"
git stash list
git stash pop
"
alias | grep -e "^alias gg" | grep -v grep'


### ripgrep
alias rg='rg -Sp'

rgg_rg()  # ripgrep simplified globbing without the -g param
{
    # $1 comes from alias, $2 $3 come from cmd line
    if [ -z "$3" ] # $3 is the glob pattern
    then
      #glob=""
      rg "$2" "$1" 
    else
      #glob="-g '$2'"
      rg "$2" "$1" -g "$3"
    fi
    #rg $1 ~/work/atom $glob
}
alias rgg='rgg_rg .'  # rgg for current dir
alias rga='rgg_rg ~/work/atom' # rgg for atom dir FIXME from ATOM_ROOT


### lazygit
alias llg='lazygit'                                                              
# start lazygit with a filter to the current dir or to a file/dir in the current dir  
lazygit_filtered()                                                                
{                                                                                
   lazygit -f $(pwd)/"$1"                                                        
}                                                                                
alias llh='lazygit_filtered'                                 

### prompt
PROMPT_COMMAND='PS1_CMD=$(basename $(git rev-parse --show-toplevel 2>/dev/null) 2>/dev/null)@$(git branch --show-current 2>/dev/null)$([[ $(git status --porcelain 2>/dev/null) ]] && echo "*")'; 
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[\033[01;33m\][${PS1_CMD}]\[\033[00m\]\$ ';
#PS1='${PS1_CMD1}'
function parse_git_dirty {
  [[ $(git status --porcelain 2> /dev/null) ]] && echo "*"
}
function parse_git_branch {
  #git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
  repo=$(basename $(git rev-parse --show-toplevel) 2>/dev/null)
  branch=$(git branch --show-current 2>/dev/null)
  #dirty=$(parse_git_dirty)
  dirty=$([[ $(git status --porcelain 2> /dev/null) ]] && echo "*")
  echo [$repo@$branch$dirty]
}

#export PS1="\n\t \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

#########
# MT stuff

alias consolesr='ssh vasarhely1a613@consolesr.t-mobile.intra'

alias mtproxy="\
echo 'curl -x 172.28.18.8:3128  -U res\\vasarhely1a613  info.cern.ch'; 
curl -x 172.28.18.8:3128  -U res\\\\vasarhely1a613  info.cern.ch; 
echo 'curl -x 172.28.18.9:3128  -U res\\vasarhely1a613  info.cern.ch'; 
curl -x 172.28.18.9:3128 -U res\\\\vasarhely1a613  info.cern.ch"

nslookup directproxy.telekom.intra > /dev/null
if [ $? -eq 0 ] ; then # proxy foun, we are in MT environment
    export http_proxy=172.28.18.8:3128 
    export https_proxy=172.28.18.8:3128 
    export no_proxy=svn.nis.t-mobile.intra
else
    unset http_proxy https_proxy no_proxy
fi



###########
# ATOM stuff
#
#login to atom machines with 'atom 2204'
atom() { ssh -t avasarhely@atom"$@".telekom.intra ;}
atomx() { ssh -t avasarhely@atom"$@".telekom.intra 'tmux a' ;}
# misc atom-project related machines 
alias ncsmixtstx='ssh -t avasarhely@ncsmixtst.t-mobile.intra -t "tmux a"'
alias ncsmixtst='ssh -t avasarhely@ncsmixtst.t-mobile.intra'
alias iptrlog6='ssh avasarhely@iptrlog6.net.telekom.intra'
alias iptrlog8='ssh avasarhely@iptrlog8.net.telekom.intra'
alias iptrlog10='ssh avasarhely@iptrlog10.net.telekom.intra'

if [ -d $HOME'/atomdev/atom' ]; then # legacy 2204
    ATOM_ROOT=$HOME'/atomdev/atom'                                                  
elif [ -d $HOME'/work/atom' ]; then # in a dev env
    ATOM_ROOT=$HOME'/work/atom'                                                  
else # default atom machines
    ATOM_ROOT=$HOME'/atom'                                                  
fi

if [ -d $HOME'/atomdev/atom_runtime' ]; then # legacy 2204
    ATOM_RUNTIME=$HOME'/atomdev/atom_runtime'                                                  
elif [ -d $HOME'/work/atom_runtime' ]; then # in a dev env
    ATOM_RUNTIME=$HOME'/work/atom_runtime'                                                  
else # default atom machines
    ATOM_RUNTIME=$HOME'/atom_runtime'                                                  
fi

alias cda='cd $ATOM_ROOT'                                                        
alias fcda='cd $(find $ATOM_ROOT -type d | fzf ); ls -l'                                
alias mca='mc $(find $ATOM_ROOT -type d | fzf )'

alias cdar='cd $ATOM_RUNTIME'                                                        
alias fcdar='cd $(find $ATOM_RUNTIME -type d | fzf ); ls -l'                                
alias mcar='mc $(find $ATOM_RUNTIME -type d | fzf )'

# find the full path of a file wihin the atom project, regardless of your current path  
alias ffa="find $ATOM_ROOT | fzf "                                                
alias ffar="find $ATOM_RUNTIME | fzf "                                                

alias agg="find $ATOM_ROOT | fzf --bind 'enter:execute(lazygit -f {})'"                                                  
#alias llh='get_git_dir | xargs lazygit -f'                                      

###########
# PROJECT MTDES/MOMENTUM/CETIN..
alias mtdes='ssh mt_op@10.5.11.89'
alias mtdestest='ssh mt_op@10.5.11.91'

###########
# PROJECT SMIX
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
alias cdsm7='cd ~/work/svn/sm7smix/trunk/smi-parent'

alias smixa='ssh smix@smixa.telekom.intra'
alias smixb='ssh smix@smixb.t-mobile.intra'
alias smixc='ssh smix@smixc.t-mobile.intra'

alias smixtest='ssh smix@10.117.162.174'
alias smix-tst='ssh smix@smix-tst'

alias smixdev='ssh smix@smixdev.telekom.intra'
alias smixdev2='ssh smix@smixdev2.telekom.intra'
alias smixdev3='ssh smix@smixdev3.telekom.intra'


