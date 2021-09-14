# dotfiles

<p align="center">
  <img src="https://raw.githubusercontent.com/devth/dotfiles/master/assets/preview.png" />
  <br />
  <i>✨ Behold: init.vim ✨</i>
</p>

## Scope

- Apps
  - CLI apps via Homebrew
  - macOS native apps via:
    - Homebrew Cask
    - `mas` (Mac App Store)
- NeoVim
  - [init.nvim](config/nvim/init.vim)
- Terminal
  - [ ] TODO .zshrc
  - [infra-aliases.sh](infra-aliases.sh)
- tmux
  - [tmux.conf](tmux.conf)
  - [tmuxline.conf](tmuxline.conf)
- git
  - [global ignore](gitignore_global)
  - [gitconfig](gitconfig)
- rcm
  - [rcrc](rcrc)
- ctags
  - [ctags](ctags)

## Usage

The install script should be idempotent but that assumption will not be verified
until #26 and #20 are completed.

Clone this repo to:

```bash
~/.dotfiles
```

Then:

```shell
./install.sh
```

This relies on [rcm](https://github.com/thoughtbot/rcm) to setup all the correct
symlinks. `install.sh` installs it and runs it for you.

Notes:

1. A full run may take up to 3 hours depending on your hardware specs and
   Internet bandwidth.
1. The installer is not yet fully non-interactive. `homebrew` needs sudo at
   least twice.

### Update

After pulling updates via git on this repo, you must always re-run `rcup`:

```bash
rcup -v
```

`-v` instructs it to output what it's doing.

## Vim Profiling

From https://github.com/hyiltiz/vim-plugins-profile

```bash

ruby ./vim-plugins-profile-master/vim-plugins-profile.rb

python ./vim-plugins-profile-master/vim-plugins-profile.py # -p flag plots a bar chart

```

## Inspiration

- [https://github.com/christoomey/dotfiles](https://github.com/christoomey/dotfiles)
- [https://github.com/mhartington/dotfiles](https://github.com/mhartington/dotfiles)
- [https://github.com/mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)


## License

[MIT](LICENSE.md)
