#!/usr/bin/env fish
#
# generate command script for debian/ubuntu packages

set WORKING_DIR (dirname (status -f))
echo sudo apt install -y (cat $WORKING_DIR/install.deb.packages.txt | tr '\n' ' ')

# others
echo "curl -sS https://webinstall.dev/zoxide | bash"
echo "curl -sS https://starship.rs/install.sh | sh"
echo "curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh"
