echo "Applying macOS settings"
./.macos.sh

echo "Installing CLI apps"
./.apps.sh

echo "Installing macOS App Store Apps"
./.macapps.sh

echo "Installing gems"
./.gems.sh

echo "Installing Golang deps"
./.golang.sh

echo "Installing Node.js deps"
./.nodejs.sh

echo "Setting up symlinks with rcup"
rcup

echo "Importing gpg keys from Keybase"
./gpg_setup.sh
