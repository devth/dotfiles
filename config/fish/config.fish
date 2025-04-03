# disable fish's friendly greeting message
set -g fish_greeting ""
# english por favor
set -x LANG en_US.UTF-8
# fish 🤝 homebrew
fish_add_path /opt/homebrew/bin
# setup zoxide (autojump replacement)
zoxide init fish | source

# always use neovim
alias vim=nvim

# ASDF configuration code
if test -z $ASDF_DATA_DIR
  set _asdf_shims "$HOME/.asdf/shims"
else
  set _asdf_shims "$ASDF_DATA_DIR/shims"
end
# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
  set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims
# ASDF shell completions
asdf completion fish > ~/.config/fish/completions/asdf.fish



# fish prompt
# function fish_prompt
#   # interactive user name @ host name, date/time in YYYY-mm-dd format and path
#   echo (date '+%Y-%m-%d %H:%M:%S') (pwd)
#   echo "❯ "
# end

function fish_prompt
    set -l cyan (set_color brcyan)
    set -l yellow (set_color yellow)
    set -l green (set_color green)
    set -l blue (set_color blue)
    set -l normal (set_color normal)
    set -l red (set_color red)
    set -l magenta (set_color magenta)

    echo
    echo $cyan(whoami)$normal' at '$yellow(date '+%m/%d %H:%M:%S')$normal' in '$cyan(prompt_pwd)
    if type -q kubectx && type -q kubens
        echo '☸ '$blue(kubectx -c)'/'(kubens -c)$normal
    else
        echo
    end
    set -l git_branch ''
    if git rev-parse --git-dir > /dev/null 2>&1
        set git_branch $magenta(git branch --show-current)$normal' '
    end
    echo -n $git_branch'❯ '
end


# git aliases
alias gs="git status"
alias gb="git branch"
alias gd="git diff"
alias gca="git commit -a -m"
alias gp="git push"
alias g="git"
alias gpr='git pull --rebase && git --no-pager hist @{1}.. && echo'
alias gpc='git push -u origin (git rev-parse --abbrev-ref HEAD)'
# git checkout master (or default branch)
alias gcm 'git checkout (git rev-parse --abbrev-ref origin/HEAD | cut -d/ -f2)'
alias gtrigger "g co -b redeploy && git ci --allow-empty -m 'Trigger' && gpc && gh pr create --fill && gh pr merge -s -d --admin"

# k8s aliases
alias kx="kubectx"
alias kn="kubens"
alias k="kubectl"

