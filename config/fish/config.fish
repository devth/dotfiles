# disable fish's friendly greeting message
set -g fish_greeting ""
# english por favor
set -x LANG en_US.UTF-8
# fish 🤝 homebrew
set -x PATH /opt/homebrew/bin $PATH
# fish_add_path /opt/homebrew/bin
# setup zoxide (autojump replacement)
zoxide init --cmd j fish | source
# iced clojure support
fish_add_path ~/.local/share/nvim/lazy/vim-iced/bin
fish_add_path "/Users/devth/.bun/bin"

# always use neovim
alias vim=nvim
alias vi=nvim

set EDITOR nvim

# direnv to load .env files
eval (direnv hook fish)

# fish prompt
# function fish_prompt
#   # interactive user name @ host name, date/time in YYYY-mm-dd format and path
#   echo (date '+%Y-%m-%d %H:%M:%S') (pwd)
#   echo "❯ "
# end

set -x JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
set -x ANDROID_HOME $HOME/Library/Android/sdk
set -x PATH $PATH $ANDROID_HOME/emulator
set -x PATH $PATH $ANDROID_HOME/platform-tools

set -xg HEVY_API_KEY "39999315-894e-46c0-a8f7-a2edb0494f99"

function stripe_key
    if test -z "$STRIPE_API_KEY"
        set -xg STRIPE_API_KEY (op read "op://Personal/u5v6jgvkobauhpnxxrtg66s2ke/devth-read-rlm-fundraiser-2025")
    end
    echo $STRIPE_API_KEY
end


function fish_prompt
    # must capture immediately
    set -l last_status $status
    set -l cyan (set_color cyan)
    set -l yellow (set_color yellow)
    set -l green (set_color green)
    set -l blue (set_color blue)
    set -l normal (set_color normal)
    set -l red (set_color red)
    set -l magenta (set_color magenta)
    set -l bold (set_color --bold)

    echo
    echo $cyan$bold(whoami)$normal' at '$yellow(date '+%m/%d %H:%M:%S')$normal' in '$cyan(prompt_pwd)
    if type -q kubectx && type -q kubens
        echo '☸ '$blue(kubectx -c)'/'(kubens -c)$normal
    else
        echo
    end

    # Display the captured status here
    set -l status_display ''
    if test $last_status -eq 0
        # don't show status if zero exit code
        # set status_display (set_color normal)$last_status
    else
        set status_display (set_color --bold red)'✖ ['$last_status']'$normal' '
    end

    # git branch
    set -l git_branch ''
    if git rev-parse --git-dir > /dev/null 2>&1
        set git_branch $magenta(git branch --show-current)$normal' '
    end

    echo -n $status_display$git_branch'❯ '
end

# git helpers
function fzf-git-branch
    git rev-parse HEAD >/dev/null 2>&1 || return
    git branch --color=always --all --sort=-committerdate |
        grep -v HEAD |
        fzf --height 50% --ansi --no-multi --preview-window right:65% \
            --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" (echo {} | sed "s/.* //")' |
        sed "s/.* //"
end

function fzf-git-checkout
    git rev-parse HEAD >/dev/null 2>&1 || return
    set branch (fzf-git-branch)
    if test -z "$branch"
        echo "No branch selected."
        return
    end
    if string match -q 'remotes/*' "$branch"
        git checkout --track $branch
    else
        git checkout $branch
    end
end


# git aliases
alias gs="git status"
alias gb="git branch"
alias gd="git diff"
alias gdc="git diff --cached"
alias gca="git commit -a -m"
alias gp="git push"
alias g="git"
alias gpr='git pull --rebase && git --no-pager hist @{1}.. && echo'
alias gpc='git push -u origin (git rev-parse --abbrev-ref HEAD)'
# git checkout master (or default branch)
alias gcm 'git checkout (git rev-parse --abbrev-ref origin/HEAD | cut -d/ -f2)'
alias gtrigger "g co -b redeploy && git ci --allow-empty -m 'Trigger' && gpc && gh pr create --fill && gh pr merge -s -d --admin"
alias gco='fzf-git-checkout'
# githu cli
alias ghprv="gh pr view --web"

# k8s aliases
alias kx="kubectx"
alias kn="kubens"
alias k="kubectl"
function ksecret
    kubectl get secret $argv[1] -o json | jq -r '.data | map_values(@base64d)'
end

function oc
    opencode --port $argv 2>/dev/null
end

# function poc
#   export GOOGLE_APPLICATION_CREDENTIALS=/Users/devth/pronto/google-cloud/pronto-expo-ce3ba228be87.json
#   export GOOGLE_CLOUD_PROJECT=pronto-expo
#   export VERTEX_LOCATION=global
#   oc
# end

alias sb="supabase"

