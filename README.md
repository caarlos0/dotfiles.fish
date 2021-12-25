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

### Prerequisites
- add your `ssh` to the agent: `eval $(ssh-agent)` + `ssh-add ~/.ssh/id_rsa`
- install the xcode tools `xcode-select --install`
- set your git user
```console
$ git config --global user.name "test"
$ git config --global user.email "test@example.com"
```
- install [Theine](https://apps.apple.com/de/app/theine/id955848755?mt=12) to avoid sleep mode during the install, while still locking the screen.
### Install

Simply, run these steps:
- which first will install [brew](https://brew.sh), the package manager and the dependencies
- `fish`: the shell
- [`grc`](https://github.com/garabik/grc) to colorize command's outputs

```console
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install fish grc
git clone --branch feat-auto-install https://github.com/mavogel/dotfiles.fish.git ~/.dotfiles
cd ~/.dotfiles
./script/bootstrap.fish
```

> All changed files will be backed up with a `.backup` suffix.

#### After install
- add you gpg keys to the keychain

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

- [`delta`](https://github.com/dandavison/delta) for better git diffs;
- [`fd`](https://github.com/sharkdp/fd) a simple, fast and user-friendly alternative to `find`;
- [`fzf`](https://github.com/junegunn/fzf) for a fuzzy-finder, used in `,t` on vim, for example;
- [`gh`](https://github.com/cli/cli) for more GitHub integration with the terminal;
- [`starship.rs`](https://starship.rs) the shell we are using;
- [`kubectx`](https://github.com/ahmetb/kubectx) for better Kubernetes context and namespace switch;
- [`zoxide`](https://github.com/ajeetdsouza/zoxide) a smarter `cd` command;

To install them all with `brew`:

```console
$ brew install fish git-delta fzf gh grc kubectx starship zoxide
```

## macOS defaults

You use it by running:

```console
~/.dotfiles/macos/set-defaults.sh
```

And logging out and in again or restart.

## Themes and fonts being used

Theme is **[Dracula](https://draculatheme.com)** and font is **Inconsolata**
Nerd Font.

## Screenshots

![screenshot 1][scrn1]

![screenshot 2][scrn2]

[scrn1]: /docs/screenshot1.png
[scrn2]: /docs/screenshot2.png
