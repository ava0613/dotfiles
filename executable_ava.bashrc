###########
# 
#
export FZF_DEFAULT_OPTS="\
--preview 'bat --style=numbers --color=always --line-range :500 {}' \
--bind ctrl-p:preview-up,ctrl-n:preview-down,\
ctrl-b:preview-page-up,ctrl-f:preview-page-down,\
ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,\
ctrl-h:preview-top,ctrl-e:preview-bottom,\
alt-up:half-page-up,alt-up:half-page-down"


alias cdw='cd ~/work'
alias cdava='cd '$HOME'/work/avadev'

alias che='chezmoi'
alias tmuxo='tmux -f ~/.config/tmux/tmux.conf.outer'
alias tmuxi='tmux -f ~/.config/tmux/tmux.conf.inner'
alias tmux18='tmux -f ~/.config/tmux/tmux18.conf.inner'

fzf_dir() # get the dir of a path selected with fzf, searches only in homedir
{
    path=$(find ~/ | fzf)
    if [ -d "$path" ]; then
        printf $path
    else
        printf $(dirname $path)
    fi
}
alias fcd='cd $(fzf_dir); ls -la'
alias mcd='mc $(fzf_dir)'
alias fvi="fzf --bind 'enter:execute(nvim.appimage {})'"

# git stuff
alias deltav='delta --side-by-side'
alias ggst='git status'
alias ggsu='git status -uno'
alias gglog='git log  --graph --oneline --pretty="%aI %C(green)%h %C(yellow)%an %C(red) %s"'
alias gglp='git log -p'
alias gglpU='git log -p -U99999'
alias gglf='git log --name-only'

alias ggh='echo "some git help/reminder - useful git commands
git diff 0dca0..86ad2f NodataService.py | delta 
git log -p -5
git show 0dca0 NodataService.py

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

if [ -d $HOME'/work/atom' ]; then # in a dev env
    ATOM_ROOT=$HOME'/work/atom'                                                  
else # default atom machines
    ATOM_ROOT=$HOME'/atom'                                                  
fi

alias cda='cd $ATOM_ROOT'                                                        
alias cdaa='cd $(find $ATOM_ROOT -type d | fzf )'                                
# find the full path of a file wihin the atom project, regardless of your current path  
alias aff="find $ATOM_ROOT | fzf "                                                

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


