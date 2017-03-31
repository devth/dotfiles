# dotfiles

<p align="center">
  <img src="https://twistedsifter.files.wordpress.com/2016/12/miniature-bonsai-forests-5.jpg?w=800&h=554" />
  <br />
  <i>The pristine dotfile zen garden of
    <a href="https://github.com/devth">@devth</a>
  </i>
</p>

## Scope

- Apps
  - CLI apps via Homebrew
  - macOS native apps via:
    - Homebrew Cask
    - `mas` (Mac App Store)
- NeoVim
- Terminal
  - [ ] TODO .zshrc
- tmux
  - .tmux.conf
  - .tmuxline.conf
- git
  - [global ignore](gitignore_global)
- rcm
  - [rcrc](rcrc)
- ctags
  - [ctags](ctags)

## Usage

The install script should be idempotent but that assumption will not be verified
until #26 and #20 are completed.

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
