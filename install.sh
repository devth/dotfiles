
echo "Applying macOS settings"
.macos.sh

echo "Installing CLI apps"
.apps.sh

echo "Installing macOS App Store Apps"
.macapps.sh

echo "Installing gems"
.gems.sh

echo "Setting up symlinks with rcup"
rcup
