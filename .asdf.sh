set -xe

asdf plugin add python

asdf install python 3.13.2

asdf set python 3.13.2 --home

# post asdf-setup:
## python stuff
pip3 install neovim --upgrade

## node stuff
