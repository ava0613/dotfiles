These are my notes

#########################################################################
#vi

##vimdiff 

#########################################################################
#chezmoi 

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

