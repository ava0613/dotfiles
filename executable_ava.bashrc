###########
# 
#

export PATH="$HOME/.cargo/bin:$PATH"



# if zoxide is installed, let zoxide handle the cd-s 
if command -v zoxide &>/dev/null; then ZOXIDE_IS_INSTALLED=1; 
    eval "$(zoxide init --cmd j bash)" # j and ji as cd
    alias zz=zoxide
    alias 'cd_cmd=j'; 
  else echo "WARNING: zoxide not found"; alias 'cd_cmd=cd'; fi
if command -v fzf &>/dev/null; then FZF_IS_INSTALLED=1; 
  else echo "WARNING: fzf not found";  fi
if command -v git &>/dev/null; then GIT_IS_INSTALLED=1; 
  else echo "WARNING: git not found";  fi
if command -v rg &>/dev/null; then RG_IS_INSTALLED=1; 
  else RG_IS_INSTALLED=0; echo "WARNING: rg not found";  fi


function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}


_fzf_preview_command() {
    local item="$1" # The highlighted fzf item is passed as the first argument

    # Check if the item is a directory
    if [ -d "$item" ]; then
        # If it's a directory, show 'ls -l' of its contents
        # Adding --color=always is good for readability
        ls -l --color=always "$item"
    else
        # If it's a file, show its content using bat or fall back to cat
        if command -v bat &>/dev/null; then
            # Use bat with colors and line numbers
            bat --color=always --style=numbers "$item"
        else
            # Fallback to cat if bat is not found
            cat "$item"
        fi
    fi
}
export -f _fzf_preview_command

export FZF_DEFAULT_OPTS="\
--cycle
--preview-window=hidden \
--preview='_fzf_preview_command {}' \
--bind 'ctrl-e:execute(vi {})' \
--bind ctrl-v:toggle-preview,\
ctrl-i:preview-up,ctrl-k:preview-down,\
ctrl-p:preview-page-up,\;:preview-page-down,\
ctrl-j:preview-half-page-up,ctrl-l:preview-half-page-down,\
ctrl-u:preview-top,ctrl-o:preview-bottom,\
alt-up:half-page-up,alt-up:half-page-down \
"
#--bind 'ctrl-m:execute(mc {})' \
#--wrap --wrap-sign '>> ' \
#--bind 'ctrl-m:execute(mc \"$(dirname {})\")' \

alias jjava='$cd_cmd '$HOME'/work/avadev'

alias che='chezmoi'
alias jjche='cd_cmd ~/.local/share/chezmoi'
alias tmuxo='tmux -f ~/.config/tmux/tmux.conf.outer'
alias tmuxi='tmux -f ~/.config/tmux/tmux.conf.inner'
alias tmux18='tmux -f ~/.config/tmux/tmux18.conf.inner'


fzf_dir_from_path() # get the dir of a path selected with fzf, searches only in homedir
{
    if [ -n "$1" ]; then
      input_path=$1
    else
      input_path="."
    fi
    if [[ $RG_IS_INSTALLED -eq 1 ]]; then
        # rg respects gitignore, it is faster, etc
        path=$(rg --files --color never $input_path | fzf --cycle)
    else
        path=$(find $input_path | fzf --cycle)
    fi
    if [ -d "$path" ]; then
        printf $path
    elif [ -n "$path" ]; then
        printf $(dirname $path)
    fi
}
fzf_dir() # get the dir of a path selected with fzf, searches only in homedir
{
    if [ -n "$1" ]
    then
      input_path=$1
    else
      input_path="."
    fi
    path=$(find $input_path -type d | grep -v ".git" | fzf --cycle)
    #path=$(rg --files --color never $input_path | fzf --cycle)
    printf $path
}

cd_into() # cd into dir, but but guard against empty "cd" (which would take into home)
{
    if [ -n "$1" ]; then
      echo $1
      cd_cmd "$1"
      ls -la
    fi
}

#fzf_cd()
#{
#    cd_into $(fzf_dir_from_path $1)
#}
#alias fcd=fzf_cd

#fzf_mc)
#{
#   #mc $(fzf_dir_from_path $1)
#   mc $(dirname $1)
#}
##alias mcd=fzf_mc

cd_project() # select a project with fzf then cd into it
{
   dir="$HOME/work/$({ ls ~/work | sort -r ; echo '.'; }  | fzf --cycle --no-sort --tiebreak=index)"
   cd_into $dir
}

# select a project with fzf, then further fzf it, and cd into the selected path's dir
cd_pproject()
{
   project=$(ls ~/work | fzf --cycle)
   if [ -n "$project" ]; then
      cd_into $(fzf_dir_from_path ~/work/$project)
   fi
}


# scp some of the dot files to a remote machine
#public_cmd dot_scp <remote_host> -- quick move some dotconfig files to a remote machine
dot_scp() { 
  local remote_host=$1
  #scp $HOME/ava.bashrc $1:~/ava.bashrc
  #scp $HOME/.vimrc $1:~/.vimrc
  #scp $HOME/.config/mc/ini $1:~/.config/mc/ini
  #sftp -q -P "$REMOTE_PORT" "$REMOTE_ALIAS" <<EOF_SFTP_COMMANDS
  # use sftp iinstead of scp so that password would be asked only once
  sftp -q "$1" <<EOF_SFTP_COMMANDS
  cd
  lcd
  put ava.bashrc ava.bashrc
  #put .vimrc .vimrc
  mkdir .vim
  put -r .vim/
  put .config/mc/ini .config/mc/ini
  bye
EOF_SFTP_COMMANDS
}


#alias fvi="fzf --bind 'enter:execute(nvim.appimage {})'"
alias fvi="fzf --bind 'enter:execute(vi {})'"
alias fzz="fzf --bind 'enter:execute(cat {})'"

#fzf_cd_git()
#{
#    dir="$(fzf_dir_from_path $(git rev-parse --show-toplevel))"
#    cd_into $dir
#}
#alias xcdg=fzf_cd_git



# fzf history search and execute
fhist() {
    if [[ -n "$1" ]]; then
        history | grep $1 | fzf --tac --no-sort | sed 's/ *[0-9]* *//' | xargs -r bash -c
    else
        #cmd="history | fzf --tac  | sed 's/ *[0-9]* *//'op" 
        cmd="history | fzf --tac  | sed 's/ *[0-9]* *//'" 
        cmd_to_inject=$(eval "$cmd")
    fi
    echo "$cmd_to_inject"
    READLINE_LINE="$cmd_to_inject"
    READLINE_POINT="${#READLINE_LINE}"
}

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

# Replace 'your_pattern' with what you want to search for.
# You can put this in a shell alias or function for easier use.
rg_fzf() {
  rg --vimgrep $@ | fzf \
    --ansi \
    --preview-window=right:50% \
    --preview 'IFS=: read -r file line col <<< {} ; \
           bat --color=always --style=numbers --highlight-line="$line" --line-range "$((line>25?line-25:0)):$((line+25))" "$file" '  \
    --bind 'enter:execute(IFS=: read -r file line col <<< {} ; vim +"$line" "$file")' \
    --bind "ctrl-y:execute-silent(echo {1} | xclip -selection clipboard)+abort" # Copy selected line to clipboard

           #less -R -j"$(( $(tput lines) / 2 ))" +"$line" ' \
    #--bind "enter:execute(vim {1})" \
           #bat --color=always --style=numbers --highlight-line="$line" "$file" 2>/dev/null | \
           #less -R -j"$line" +d"$line" ' \
               #bat --color=always --style=numbers --highlight-line="$line" --line-range "$((line-15)):$((line+15))" "$file" || \
               #(head -n "$((line+15))" "$file" | tail -n 31 | sed "1s/^/--- Preview of $file:$line ---\n/")' \
}
alias rgf='rg_fzf'

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


# kubernetes
alias k='kubectl'

get_pod() {
    n_opt="" 
    # get namesace if specified
    if [[ "$@" =~ (-n [^[:space:]]+) ]]; then
        n_opt="${BASH_REMATCH[1]}"
    fi
    # get and return the mathinc pod ...
    POD_NAME=$(kubectl get pods $n_opt | grep $2 | awk '{print $1}' )
    # ... but make sure there is only one matching pod
    pod_count=$(printf "%s" "$POD_NAME" | wc -w)
    if (( pod_count > 1 )); then
       echo "ERROR: Multiple pods match, rephrase"
       echo "$POD_NAME"
       exit 1
       return 1
    fi
    echo "$POD_NAME"
}
get_kube_resource() {
    local resource_type=$1
    local resource_name_pattern=$2
    local command_line_options=${@:3}
    # get namesace if specified
    local namespace=""
    if [[ $command_line_options =~ (-n [^[:space:]]+) ]]; then
        namespace="${BASH_REMATCH[1]}"
    fi
    # get and return the matching pod ...
    resource_name=$(kubectl get $resource_type $namespace | grep "$resource_name_pattern" | awk '{print $1}' )
    count=$(printf "%s" "$resource_name" | wc -w)
    if (( count > 1 )); then
       echo "ERROR: Multiple $resource_type match, rephrase"
       echo "$resource_name"
       #exit 1
       return 1
    fi
    echo "$resource_name"
}
get_pods() {
    n_opt="" 
    if [[ "$@" =~ (-n [^[:space:]]+) ]]; then
        n_opt="${BASH_REMATCH[1]}"
    fi
    POD_NAME=$(kubectl get pods $n_opt | grep $2 | awk '{print $1}' )
    pod_count=$(printf "%s" "$POD_NAME" | wc -w)
    echo "$POD_NAME"
}

build_cmd_help() {
    # assume our commands in the script are commented with 
    # something like "...#cmd_group cmd"
    # we grep the our script for lines containing 
    # the #cmd_group lines, collect the last words, and returns them
    # in "cmd1|cmd2|cmd3" format
    output=$(awk -v cmd_pattern="#$1" '
      BEGIN {ret=""}
      $0 ~ cmd_pattern {ret=ret $NF "|"}
      END {print substr(ret, 1, length(ret)-1)}
    ' "$HOME/ava.bashrc")
    echo "$output"
}

#public_cmd ku -- customized kube shortcuts, type ku for more help
ku() { 
  # common command syntax
  if [[ -n "$3" && "$3" != -* ]]; then
    echo "with res"
    local resource_type=$2
    local name_pattern=$3
    local cmd_options=${@:4}
  else
    echo "wo res"
    local resource_type="pod"
    local name_pattern=$2
    local cmd_options=${@:3}
  fi

  if [[ "$1" == "cfg" ]]; then #ku_cmd cfg
    # switch kube config if a config was specified
    if [ -n "$2" ]; then
      kube_config='config.'$2
      backup_cmd="cp ~/.kube/config ~/.kube/config.bak"
      echo ">> "$backup_cmd
      eval $backup_cmd
      set_cmd="cp ~/.kube/$kube_config ~/.kube/config"
      echo ">> "$set_cmd
      eval $set_cmd
    fi
    # either way, list context
    echo 
    cmd="ls -l ~/.kube/"
    echo ">> "$cmd
    eval $cmd
    cmd="kubectl config get-contexts"
    echo ">> "$cmd
    eval $cmd
  elif [[ "$1" == "ctx" ]]; then #ku_cmd ctx
    # switch context if a context was specified
    if [ -n "$2" ]; then
      cmd="kubectl config use-context "$2
      echo ">> "$cmd
      eval $cmd
    fi
    # either way, list context
    cmd="kubectl config get-contexts"
    echo ">> "$cmd
    eval $cmd
  elif [[ "$1" == "log" ]]; then #ku_cmd log
    resource_name="$(get_kube_resource $resource_type $name_pattern $cmd_options)"
    if [[ $resource_name =~ "ERROR"  ]]; then
       echo "$resource_name"
       return 1
    fi
    cmd="kubectl logs $resource_name $cmd_options"
    echo ">> "$cmd
    eval $cmd
    echo "<< "$cmd
  elif [[ "$1" == "logf" ]]; then #ku_cmd logf
    resource_name="$(get_kube_resource $resource_type $name_pattern $cmd_options)"
    if [[ $resource_name =~ "ERROR"  ]]; then
       echo "$resource_name"
       return 1
    fi
    cmd="kubectl logs $resource_name -f --tail=10 $cmd_options"
    echo ">> "$cmd
    eval $cmd
  elif [[ "$1" == "logx" ]]; then #ku_cmd logx
    PODS=$(get_pods "$@")
    for pod in $PODS; do
       cmd="kubectl logs $pod --tail=10  ${@:3} "
       echo ">> "$cmd
       eval $cmd
       echo "<< "$cmd
       echo
    done
  elif [[ "$1" == "exec" ]]; then #ku_cmd exec
    resource_name="$(get_kube_resource $resource_type $name_pattern $cmd_options)"
    if [[ $resource_name =~ "ERROR"  ]]; then
       echo "$resource_name"
       return 1
    fi
    cmd="kubectl exec $resource_name $cmd_options"
    echo ">> "$cmd
    eval $cmd
  elif [[ "$1" == "bash" ]]; then #ku_cmd bash
    resource_name="$(get_kube_resource $resource_type $name_pattern $cmd_options)"
    if [[ $resource_name =~ "ERROR"  ]]; then
       echo "$resource_name"
       return 1
    fi
    cmd="kubectl exec -it $resource_name $cmd_options -- bash"
    echo ">> "$cmd
    eval $cmd
  elif [[ "$1" == "desc" ]]; then #ku_cmd desc
    resource_name="$(get_kube_resource $resource_type $name_pattern $cmd_options)"
    if [[ $resource_name =~ "ERROR"  ]]; then
       echo "$resource_name"
       return 1
    fi
    cmd="kubectl describe $resource_type $resource_name $cmd_options"
    echo ">> "$cmd
    eval $cmd
    echo "<< "$cmd
  elif [[ "$1" == "yaml" ]]; then #ku_cmd desc
    resource_name="$(get_kube_resource $resource_type $name_pattern $cmd_options)"
    if [[ $resource_name =~ "ERROR"  ]]; then
       echo "$resource_name"
       return 1
    fi
    cmd="kubectl get $resource_type $resource_name $cmd_options -o yaml"
    echo ">> "$cmd
    eval $cmd
    echo "<< "$cmd
  elif [[ "$1" == "pods" ]]; then #ku_cmd pods
    NS_NAME=$(kubectl get ns | grep $2 | awk '{print $1}' )
    ns_count=$(printf "%s" "$NS_NAME" | wc -w)
    if (( ns_count > 1 )); then
       echo "ERROR: Multiple namespaces match, rephrase"
       echo "$NS_NAME"
       return 1
    elif (( ns_count == 0 )); then
       cmd="kubectl get pod ${@:3} -o wide"
    else
       cmd="kubectl get pod -n $NS_NAME ${@:3} -o wide"
    fi
    echo ">> "$cmd
    eval $cmd
    echo "<< "$cmd
  else 
    echo 'Usage: ku '$(build_cmd_help "ku_cmd")
  fi

}

alias kex='ku exec'
alias klog='ku log'
alias klogf='ku logf'
alias kdesc='ku desc'

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

if [ -d $HOME'/work/atom-helm' ]; then # in a dev env
    ATOM_HELM=$HOME'/work/atom-helm'                                                  
else # default atom machines
    ATOM_HELM=$HOME'/atom-helm'                                                  
fi


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

## CD shortcuts
# concept:
#   jjx --- plain cd into some x dir
#   ddx --- fzf on the recursive dirs/subdirs of x, then cd into the selection
#   ffx --- fzf on the recursive files of x, then cd into the selected file's dir

# >> generic CD shortcuts  #cd_shortcut
alias jjw='cd_cmd $HOME/work' 
alias fd="cd_into \$(fzf_dir $1)" # fzf_cd on a dir
alias ff="cd_into \$(fzf_dir_from_path $1)" # fzf_cd on specified path
alias jjg='cd_cmd $(git rev-parse --show-toplevel)' # cd into project root by git
alias ddg="cd_into \$(fzf_dir \$(git rev-parse --show-toplevel))" # fzf_cd from project root (on dirs)
alias ffg="cd_into \$(fzf_dir_from_path \$(git rev-parse --show-toplevel))" # fzf_cd from project root (on files)
alias ddp=cd_project # fzf_cd on projects in ~/work
alias ddpp=cd_pproject # fzf_cd on projects, then find files in the selected one

# >> jjx shortcuts for projects #cd_shortcut
alias jja='cd_into $ATOM_ROOT'                                                        
alias jjab='cd_into $ATOM_ROOT/build'                                                        
alias jjas='cd_into $ATOM_ROOT/sources'                                                        
alias jjap='cd_into $ATOM_ROOT/sources/projects'
alias jjar='cd_into $ATOM_RUNTIME'                                                        
alias jjars='cd_into $ATOM_RUNTIME/deploy/stage'
alias jjarp='cd_into $ATOM_RUNTIME/deploy/prod'
alias jjah='cd_into $ATOM_HELM'
# >> ddx shortcuts for projects   #cd_shortcut
alias dda='cd_into $(fzf_dir $ATOM_ROOT)'
alias ddab='cd_into $(fzf_dir $ATOM_ROOT/build)'
alias ddas='cd_into $(fzf_dir $ATOM_ROOT/sources)'
alias ddap='cd_into $(fzf_dir $ATOM_ROOT/sources/projects)'
alias ddar='cd_into $(fzf_dir $ATOM_RUNTIME)'
alias ddars='cd_into $(fzf_dir $ATOM_RUNTIME/deploy/stage)'
alias ddarp='cd_into $(fzf_dir $ATOM_RUNTIME/deploy/prod)'
alias ddah='cd_into $(fzf_dir $ATOM_HELM)'
# >> ffx shortcuts for projects   #cd_shortcut
alias ffa='cd_into $(fzf_dir_from_path $ATOM_ROOT)'
alias ffab='cd_into $(fzf_dir_from_path $ATOM_ROOT/build)'
alias ffas='cd_into $(fzf_dir_from_path $ATOM_ROOT/sources)'
alias ffap='cd_into $(fzf_dir_from_path $ATOM_ROOT/sources/projects)'
alias ffar='cd_into $(fzf_dir_from_path $ATOM_RUNTIME)'
alias ffars='cd_into $(fzf_dir_from_path $ATOM_RUNTIME/deploy/stage)'
alias ffarp='cd_into $(fzf_dir_from_path $ATOM_RUNTIME/deploy/prod)'
alias ffah='cd_into $(fzf_dir_from_path $ATOM_HELM)'

## some help to keep thing in my human buffer
ava_help() {
###
  if [[ "$1" == "alias" ]]; then #ava_cmd alias
    #grep ^alias $HOME/ava.bashrc
    alias | grep alias
###
  elif [[ "$1" == "git" ]]; then #ava_cmd git
    echo "#
# some git help/reminder - useful git commands
git diff 0dca0..86ad2f NodataService.py | delta 
git log -p -5
git show 0dca0 NodataService.py > NodataService.py.older
git stash, or, git stash push -m "message"
git stash list
git stash pop
"
    alias | grep -e "^alias gg" | grep -v grep
###
  elif [[ "$1" == "cd" ]]; then #ava_cmd cd
    egrep "^alias|cd_shortcut" $HOME/ava.bashrc | grep cd 
    #alias | grep cd
    echo "#
# concept:
#   jjx --- plain cd into some x dir
#   ddx --- fzf on the recursive dirs/subdirs of x, then cd into the selection
#   ffx --- fzf on the recursive files of x, then cd into the selected file's dir
"
  elif [[ "$1" == "notes" ]]; then #ava_cmd notes
    cd_into $(fzf_dir_from_path $HOME/.config/ava/notes)
  else
    echo 'Get targeted help with: ava '$(build_cmd_help "ava_cmd")
    echo
    echo 'Also, these are the public commands from ava.bashrc'
    grep -oP "#public_cmd \K(.*)" $HOME/ava.bashrc | grep -v 'grep -oP "public_cmd"'
    echo
  fi
}
alias ava=ava_help

