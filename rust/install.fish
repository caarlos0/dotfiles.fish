#!/usr/bin/env fish
set -Ua fish_user_paths $HOME/.cargo/bin

curl -sL https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz |
	gunzip -c - >/tmp/rust-analyzer
chmod +x /tmp/rust-analyzer
mv -f /tmp/rust-analyzer $HOME/.cargo/bin/rust-analyzer
