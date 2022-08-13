<p align="center">
  <img alt="header image" src="https://raw.githubusercontent.com/caarlos0/dotfiles.fish/master/docs/header.svg" height="350" />
  <h2 align="center">carlos' dotfiles</h2>
  <p align="center">Config files for Fish, Go, Editors, Terminals and more.</p>
</p>

---

Forked from my [ZSH dotfiles](https://github.com/caarlos0/dotfiles), these are
my Fish Shell config files, together with editor, macOS configs and other
goodies.

## Installation

### Dependencies

First, make sure you have all those things installed:

- `git`: to clone the repo
- `curl`: to download some stuff
- `tar`: to extract downloaded stuff
- `fish`: the shell
- `sudo`: some configs may need that

### Install

Then, run these steps:

```console
$ git clone https://github.com/caarlos0/dotfiles.fish.git ~/.dotfiles
$ cd ~/.dotfiles
$ ./script/bootstrap.fish
```

> All changed files will be backed up with a `.backup` suffix.

#### Update

To update, you just need to `git pull` and run the bootstrap script again:

```console
$ cd ~/.dotfiles
$ git pull origin master
$ ./script/bootstrap.fish
```

## Revert

Reverting is not totally automated, but it pretty much consists in removing
the fish config and dotfiles folder, as well as moving back some config files.

```console
$ rm -rf ~/.dotfiles $__fish_config_dir
```

The bootstrap script would have created a bunch of symlinks that will now be broken.
You will have to investigate those manually.
In cases a file already existed, the boostrap script should have created a `.backup` file with the same name.

## Recommended Software

- [`alacritty`](https://github.com/alacritty/alacritty) a cross-platform, OpenGL terminal emulator;
- [`bat`](https://github.com/sharkdp/bat) a cat(1) clone with wings;
- [`delta`](https://github.com/dandavison/delta) for better git diffs;
- [`fd`](https://github.com/sharkdp/fd) a simple, fast and user-friendly alternative to `find`;
- [`fzf`](https://github.com/junegunn/fzf) for a fuzzy-finder;
- [`gum`](https://github.com/charmbracelet/gum) A tool for glamorous shell scripts;
- [`gh`](https://github.com/cli/cli) for more GitHub integration with the terminal;
- [`grc`](https://github.com/garabik/grc) to colorize command's outputs;
- [`kitty`](https://github.com/kovidgoyal/kitty) a cross-platform, fast, feature-rich, GPU based terminal;
- [`kubectx`](https://github.com/ahmetb/kubectx) for better Kubernetes context and namespace switch;
- [`neovim`](https://neovim.io) hyperextensible Vim-based text editor;
- [`starship.rs`](https://starship.rs) the shell we are using;

To install them all with `brew`:

```console
$ brew install fish git-delta fzf gh grc kubectx starship zoxide fd exa bat alacritty kitty neovim
```

On Ubuntu:

```console
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
sudo apt install fish grc fzf zoxide fd-find exa bat alacritty kitty neovim
# TODO: install delta, kubectx
```

## macOS defaults

You use it by running:

```console
~/.dotfiles/macos/set-defaults.sh
```

And logging out and in again or restart.

## Themes and fonts being used

Gruvbox-material dark and MonoLisa Font.

## Screenshots

###### neovim with LSP, git signs, etc
![CleanShot 2022-08-12 at 23 17 57@2x](https://user-images.githubusercontent.com/245435/184464863-b5c6468f-e064-4f53-bbd8-2961f4163bd0.png)

###### neovim telescope
![CleanShot 2022-08-12 at 23 18 07@2x](https://user-images.githubusercontent.com/245435/184464868-f9f22aea-3333-42a3-b110-0c8a90d90c1b.png)

###### tmux-sessionizer and tmux tabs with icons
![CleanShot 2022-08-12 at 23 18 13@2x](https://user-images.githubusercontent.com/245435/184464869-835bdad2-5ca6-4998-b550-3622bb05c82c.png)
