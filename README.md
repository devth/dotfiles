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

## Inspiration

- [https://github.com/christoomey/dotfiles](https://github.com/christoomey/dotfiles)
- [https://github.com/mhartington/dotfiles](https://github.com/mhartington/dotfiles)

## License

[MIT](LICENSE.md)
