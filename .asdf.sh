set -xe

# pythong
asdf plugin add python
asdf install python 3.13.2
asdf set python 3.13.2 --home

# javascript (TODO stop using yarn)
# asdf plugin add yarn
# asdf list all yarn
# asdf install yarn 1.22

# rust (needed by some neovim plugins)
asdf plugin add rust
asdf install rust latest
asdf set rust latest --home

# ruby
asdf plugin add ruby
asdf install ruby 3.3.6
asdf set ruby 3.3.6 --home

# post asdf-setup:
## python stuff
pip3 install neovim --upgrade

## node stuff
