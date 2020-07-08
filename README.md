![header](/docs/header.svg)

# carlos' dotfiles

> Config files for Fish, Java, Ruby, Go, Editors, Terminals and more.

![screenshot 1][scrn1]

![screenshot 2][scrn2]

[scrn1]: /docs/screenshot1.png
[scrn2]: /docs/screenshot2.png

## Installation

### Dependencies

First, make sure you have all those things installed:

- `git`: to clone the repo
- `curl`: to download some stuff
- `tar`: to extract downloaded stuff
- `fish`: the shell
- `sudo`: some configs may need that
- `oh-my-fish`: is what we use to manage plugins and etc

### Install

Then, run these steps:

```console
$ curl -sfL https://get.oh-my.fish | fish
$ git clone https://github.com/caarlos0/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ ./script/bootstrap.fish
```

> All changed files will be backed up with a `.backup` suffix.

### Recommended Software

For macOS, I recommend:

- iTerm: a better terminal emulator;

For both Linux and macOS:

- [`diff-so-fancy`](https://github.com/so-fancy/diff-so-fancy) for better git difs (you'll need to run `dot_update` to apply it);
- [`fzf`](https://github.com/junegunn/fzf) for a fuzzy finder, used in `,t` on vim, for example;
- [`kubectx`](https://github.com/ahmetb/kubectx) for better kubernetes context and namespace switch;
- [`grc`](https://github.com/garabik/grc) to colorize command's outputs;
- [`gh`](https://github.com/cli/cli) for more github integration with the terminal;

### macOS defaults

You use it by running:

```console
$DOTFILES/macos/set-defaults.sh
```

And logging out and in again/restart.

### Themes and fonts being used

Theme is **[Dracula](https://draculatheme.com)**, font is **JetBrains Mono** on
editors and **Hack** on terminals.
