
brew install fish
sudo sh -c "echo $(which fish) >> /etc/shells"
sudo chsh -s `which fish`

set -U fish_user_paths /opt/homebrew/bin $fish_user_paths
