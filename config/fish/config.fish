# disable fish's friendly greeting message
set -g fish_greeting ""
# english por favor
set -x LANG en_US.UTF-8
# fish 🤝 homebrew
fish_add_path /opt/homebrew/bin
# setup zoxide (autojump replacement)
zoxide init fish | source

# always use neovim
alias vim=nvim

# ASDF configuration code
if test -z $ASDF_DATA_DIR
  set _asdf_shims "$HOME/.asdf/shims"
else
  set _asdf_shims "$ASDF_DATA_DIR/shims"
end
# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
  set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims
# ASDF shell completions
asdf completion fish > ~/.config/fish/completions/asdf.fish

# git aliases
alias gs="git status"
alias gd="git diff"
alias gca="git commit -a"
