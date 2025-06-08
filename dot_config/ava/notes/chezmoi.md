#########################################################################
#chezmoi 

             >>> che add >>>                      >>> git add.. >>> 
(target   ) ----------------------- (source) ------------------------ (remote)
(~/..)                          (che ~/.local repo)                 (che at github)
             <<< che apply <<<                    <<< git pull <<< 


## frequent commands
- che add ... - add a new/modified file/dir to the source
- che apply .. - cp from the source to target
- che cd  -- cd to the git repo, there you can use regular git commands
- che diff   -- shows diff between the git workdir and target
- che -v apply -- copies the files from source (che git workdir) to the target
- che edit ~/ava.bashrc -- edits the source state (not the actual ~/ava.bashrc !!)
- che update -v  -- pulls files from remote and applies them

## concepts
~/.local/share/chezmoi    <-- a git repo for chezmoi (workdir, local repo, remote repo)
- target - the original ("runtime")  location of a file/dir, e.g: ~/ava.bashrc
- source - the file/dir corresponding to the target in che workdir, e.g: ~/.local/share/chezmoi/executable_ava.bashrc
- let chezmoi to manage a file or dir for you
chezmoi add ~/.bashr

# install
sh -c "$(curl -fsLS get.chezmoi.io)"
mv bin/chezmoi ../../.local/bin/
chezmoi 

## get github token from an existing github repo's gitconfig
cat .git/config 

## get ava dotfiles from existing github dotfiles repo
chezmoi init https://token_here@github.com/ava0613/dotfiles.git
## rollout
chezmoi apply

