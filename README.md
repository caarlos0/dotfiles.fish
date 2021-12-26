<p align="center">
  <img alt="header image" src="https://raw.githubusercontent.com/mavogel/dotfiles.fish/master/docs/header.svg" height="350" />
  <h2 align="center">manuel's dotfiles</h2>
  <p align="center">Config files for Fish, Java, Ruby, Go, Editors, Terminals and more.</p>
</p>

---

[![Go Status](https://github.com/mavogel/dotfiles.fish/workflows/test/badge.svg)](https://github.com/mavogel/dotfiles.fish/actions)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/mavogel/dotfiles.fish/blob/main/LICENSE)  

The main reasons for the switching from zsh to fish are:

- a lot of things I have out of the box on Fish needed plugins on zsh
- Fish autocompletion is awesome
- Fish syntax is easier to use
- Fish is more modern.

## Installation
I wanted to ensure I can run the install script always on a fresh Mac. Therefore I added a CI pipeline for GitHub actions.

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
$ bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
$ brew install fish grc
$ git clone https://github.com/mavogel/dotfiles.fish.git ~/.dotfiles
$ cd ~/.dotfiles
$ ./script/bootstrap.fish
```

> All changed files will be backed up with a `.backup` suffix.

#### After install
- add you keys to the [GPGTools](https://gpgtools.org/) and add the key as global [git signing key](https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key)
```sh
# list them fist
gpg --list-secret-keys --keyid-format=long
/Users/hubot/.gnupg/secring.gpg
------------------------------------
sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
uid                          Hubot 
ssb   4096R/42B317FD4BA89E7A 2016-03-10
# add it
git config --global user.signingkey 3AA5C34371567BD2
```

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

or you can also take a look at the [brewfile](brewfile) for all software I have installed.

## macOS defaults

You use it by running:

```console
~/.dotfiles/macos/set-defaults.sh
```

And logging out and in again or restart.

## Themes and fonts being used

Theme is **[Dracula](https://draculatheme.com)** and font is **Inconsolata**
Nerd Font.

If you use [vscode](https://code.visualstudio.com/) then you need to fix the font for terminal:
`Terminal > Integrated: Font Family`: `Inconsolata Nerd Font Mono`
![vscode-terminal-font][vsctfont]

## Screenshots

![screenshot 1][scrn1]

![screenshot 2][scrn2]

[scrn1]: /docs/screenshot1.png
[scrn2]: /docs/screenshot2.png
[vsctfont]: /docs/vscode-terminal-font.png

## Release Process

There is a `release` target within the Makefile that wraps up the steps to
release a new version.

> NOTE: Pass the `VERSION` variable when running the command to properly set
> the tag version for the release.

```bash
$ VERSION=vX.Y.Z make release
# EXAMPLE:
$ VERSION=v0.11.3 make release
```

Once the `tag` has been pushed, the `goreleaser` github action will take care
of the rest.