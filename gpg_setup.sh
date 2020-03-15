
# Import the public key
keybase pgp export | gpg --import

# Import the private key
keybase pgp export -s | gpg --allow-secret-key-import --import
