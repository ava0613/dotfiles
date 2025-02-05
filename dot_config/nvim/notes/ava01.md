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

##vert
C-v, select rows, S-i, do the edit, esc
note: during edit only the first row is changed, at esc will be applied


#########################################################################
#chezmoi 

## install
sh -c "$(curl -fsLS get.chezmoi.io)"
mv bin/chezmoi ../../.local/bin/
chezmoi 

# get github token from an existing github repo's gitconfig
cat .git/config 

# get ava dotfiles from existing github dotfiles repo
chezmoi init https://token_here@github.com/ava0613/dotfiles.git
# rollout
chezmoi apply

#########################################################################
#tunnel 

tunnels is made

