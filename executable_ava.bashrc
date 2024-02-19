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

alias fff="fzf --bind 'enter:execute(nvim.appimage {})'"

alias cdava='cd '$HOME'/work/avadev'
alias che='chezmoi'
alias tmuxo='tmux -f ~/.config/tmux/tmux.conf.outer'
alias tmuxi='tmux -f ~/.config/tmux/tmux.conf.inner'
alias tmux18='tmux -f ~/.config/tmux/tmux18.conf.inner'

### lazygit
alias llg='lazygit'                                                              
# start lazygit with a filter to the current dir or to a file/dir in the current dir  
lazygit_filtered()                                                                
{                                                                                
   lazygit -f $(pwd)/"$1"                                                        
}                                                                                
alias llh='lazygit_filtered'                                 

alias cdw='cd ~/work'


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


