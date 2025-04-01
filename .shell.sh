
brew install fish
sudo sh -c "echo $(which fish) >> /etc/shells"
sudo chsh -s `which fish`
