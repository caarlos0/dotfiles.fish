<p align="center">
  <img alt="header image" src="https://raw.githubusercontent.com/caarlos0/dotfiles.fish/master/docs/header.svg" height="350" />
  <h2 align="center">carlos' dotfiles</h2>
  <p align="center">Config files for Fish, Java, Ruby, Go, Editors, Terminals and more.</p>
</p>

---

Forked from my [ZSH dotfiles](https://github.com/caarlos0/dotfiles), those are
my Fish Shell config files, together with editor, macOS configs and other
goodies.

The main reasons for the fork are:

- a lot of things I have out of the box on Fish needed plugins on zsh
- Fish autocompletion is awesome
- Fish syntax is easier to use
- Fish is more modern.

This is an attempt to make the same things I had on my ZSH dotfiles on Fish.
For the user, it should look pretty much the same, although under the hood
there are a lot of changes.

Config files are still topical, and even though aliases are not a thing on Fish,
files are named like that still (and hold both functions and abbreviations).

The auto-update feature was removed, as it was hacky on ZSH and I didn't want to
do it. Instead, now the bootstrap script is better and can be run multiple times
without any issues, so, to update, `git pull` and run the `bootstrap.fish`
script.

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

**Remove the folders:**

```console
$ rm -rf ~/.dotfiles ~/.config/fish
```

**Some config files were changed, you can find them using `fd`:**

```console
$ fd -e backup -e local -H -E Library -d 3 .
```

And then manually inspect/revert them.

## Recommended Software

For macOS, I recommend:

- iTerm: a better terminal emulator;

For both Linux and macOS:

- [`bat`](https://github.com/sharkdp/bat) a `cat` with wings;
- [`delta`](https://github.com/dandavison/delta) for better git diffs;
- [`dog`](https://dns.lookup.dog) the command-line DNS client;
- [`exa`](https://the.exa.website) a modern replacement for `ls`;
- [`fd`](https://github.com/sharkdp/fd) a simple, fast and user-friendly alternative to `find`;
- [`fzf`](https://github.com/junegunn/fzf) for a fuzzy-finder, used in `,t` on vim, for example;
- [`gh`](https://github.com/cli/cli) for more GitHub integration with the terminal;
- [`grc`](https://github.com/garabik/grc) to colorize command's outputs;
- [`kubectx`](https://github.com/ahmetb/kubectx) for better Kubernetes context and namespace switch;
- [`ripgrep`](https://github.com/BurntSushi/ripgrep) a faster `grep`;

To install them all with `brew`:

```console
$ brew install bat git-delta dog exa fd fzf gh grc kubectx ripgrep
```

## macOS defaults

You use it by running:

```console
~/.dotfiles/macos/set-defaults.sh
```

And logging out and in again or restart.

## Themes and fonts being used

Theme is **[Dracula](https://draculatheme.com)** and font is **Inconsolata**.

## Screenshots

![screenshot 1][scrn1]

![screenshot 2][scrn2]

[scrn1]: /docs/screenshot1.png
[scrn2]: /docs/screenshot2.png
