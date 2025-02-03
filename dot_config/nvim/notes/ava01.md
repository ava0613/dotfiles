These are my notes

#########################################################################
#vi

##vimdiff 
:vert diffsplit <filename>
:diffsplit <filename>
]c, [c               - next/prev diff
diffget, diffput     - 
Ctrl + w Ctrl + w    # switch between diff windows

##macros
qa - start registering macro named a
q - end resitering macro
@a - replay macro
@@ - replay last macro

#########################################################################
#chezmoi 

## frequent commands
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
chezmoi add ~/.bashrc 


## install
sh -c "$(curl -fsLS get.chezmoi.io)"
mv bin/chezmoi ../../.local/bin/
chezmoi 

# get github token from an existing github repo's gitconfig
cat .git/config 

# get ava dotfiles
chezmoi init https://token_here@github.com/ava0613/dotfiles.git
# roll the out
chezmoi apply

#########################################################################
#tunnel 

tunnels is made

