[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  setopt promptsubst
PROMPT='%F{cyan}${_prompt_josh_pwd}%f${git_info:+${(e)git_info[prompt]}}%(!. %B%F{red}#%f%b.)${editor_info[keymap]} '
RPROMPT='${editor_info[overwrite]}${VIM:+" %B%F{green}V%f%b"}${git_info[rprompt]}'
SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '
#ource Prezeto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

fbr() {
  git fetch
  local branches branch
  branches=$(git branch -a) &&
    branch=$(echo "$branches" | fzf +s +m -e) &&
    git checkout $(echo "$branch" | sed "s:.* remotes/origin/::" | sed "s:.* ::")

}

# Customize to your needs...
#for config_file ($HOME/.yadr/zsh/*.zsh) source $config_file
#OWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time dir vcs)
POWERLEVEL9K_TIME_FORMAT="%D{}"
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status rbenv)
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
# key bindings
bindkey "e[1~" beginning-of-line
bindkey "e[4~" end-of-line
bindkey "e[5~" beginning-of-history
bindkey "e[6~" end-of-history
bindkey "e[3~" delete-char
bindkey "e[2~" quoted-insert
bindkey "e[5C" forward-word
bindkey "eOc" emacs-forward-word
bindkey "e[5D" backward-word
bindkey "eOd" emacs-backward-word
bindkey "ee[C" forward-word
bindkey "ee[D" backward-word
bindkey "^H" backward-delete-word
# for rxvt
bindkey "e[8~" end-of-line
bindkey "e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "eOH" beginning-of-line
bindkey "eOF" end-of-line
# for freebsd console
bindkey "e[H" beginning-of-line
bindkey "e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix
# alt f and b for moving right and left
export PATH="/Users/manoj/anaconda3/bin:$PATH"


alias prodpl='heroku run rails c --app pl-finiata-admin-prod'
alias stagingpl='heroku run rails c --app pl-finiata-admin-staging'
alias devpl='heroku run rails c --app pl-finiata-admin-backend-dev'
alias prodde='heroku run rails c --app de-finiata-admin-prod'
alias stagingde='heroku run rails c --app de-finiata-admin-staging'
alias devde='heroku run rails c --app de-finiata-admin-backend-dev'
alias stagingmigrationde='heroku run rails c --app de-finiata-admin-migration'

alias resetdb=bundle exec rake db:drop && rake db:setup && rake
alias adminapplication='APP_MODE=admin_application rails s'
alias partnerapi='APP_MODE=partner_api rails s'
alias userapi='APP_MODE=user_api rails s'
alias skrails='sk $(lsof -i tcp:3000 -t)'
alias sql-server='sudo /usr/local/Cellar/mysql/5.7.19/support-files/mysql.server start'

alias ts="tmux switch -t"
alias zshconfig="vim ~/.zshrc"
alias sourcezsh="source ~/.zshrc"
alias vimconfig="cd ~/.vim_runtime/vimrcs"
alias tmuxconfig="vim ~/.tmux.conf"
alias sourcetmux="tmux source-file ~/.tmux.conf"
alias sk='sudo kill -9'
alias psgrep='ps aux | grep'
alias updatetags='ripper-tags -R --exclude=vendor'

#rails
alias spec="bundle exec rspec"
alias sqdev='bundle exec sidekiq -e development -C config/sidekiq.yml'
alias bi='bundle install'
alias rc='rails c'
alias rb='rubocop'

#ssh
alias stagingry='ssh root@134.209.250.124'
alias prodry='ssh root@167.71.34.181'
alias sshvfr='ssh -i rahul_key.pem ubuntu@ec2-54-146-199-110.compute-1.amazonaws.com'


#git
alias gau='git add -u'
alias gpushupstream='git push --set-upstream origin'
alias gl="git log"
alias glv='git log --graph --oneline --decorate --all'
alias gf="git diff HEAD"
alias gca="git commit --amend -C HEAD"
alias gaa="git add ."
alias gpo="git push origin"
alias gpr="git pull --rebase origin"
alias gfh='git fetch --verbose --prune' # verbose gives you more information about what was fetched; prune removes any remote tracking branches which have been removed from the remote
alias gmg='git merge' # use when you can fast-forward anyway or when you're actually merging 2 different branches together
alias grb='git rebase --verbose' # use when you're pulling down changes from a remote or when pulling in changes to a local-only branch from the branch it branched off of (like from master into a feature branch)
alias gcb='git checkout -b' # need to give it a new branch name, creates the new branch and switches to it
alias gcln='git clean -df'
alias gco='git checkout'
alias gcm='git commit -m' # commits everything (except brand new files and removed files), even unstaged changes
alias gbu='git branch --set-upstream-to' # needs the name of an upstream branch, sets up remote tracking for the local branch (really useful with `gcb` above
alias gap='git add --patch' # goes through each section of diffs and lets you add, skip, edit, split (and more) the lines changed
alias gsh='git stash' # stashes all changes so that your local repo is clean and ready for a merge or rebase
alias gsp='git stash pop' # attempts to pop the most recent stash off the stash stack and apply it to your current local repo; if it fails (due to conflicts) it doesn't remove the stash from the stack
alias gsd='git stash drop' # so in those cases you might need to do this after manually fixing the conflicts :)
alias gst='git status'
alias gb='git branch'

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Shortcuts
alias dl="cd ~/Downloads"
alias dsk="cd ~/Desktop"
alias fibe="cd ~/debitech/finiata-core-mvp-2"
alias core="cd ~/project/bookingsaround/bookingsaround-core"
alias wibe="cd ~/project/bookingsaround/bookingsaround-core-mvp"
alias wife="cd ~/project/bookingsaround/bookingaround-app"
alias rybe="cd ~/project/rentvans/rydeu-backend-mvp/"
alias ryfe="cd ~/project/rentvans/rentvans-app/"
alias h="history"
alias v="vim"
alias s="sublime ."
alias o="open"
alias oo="open ."

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

# List all files colorized in long format
alias l="ls -l ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -la ${colorflag}"

# List only directories
alias lsd='ls -l ${colorflag} | grep "^d"'

# Always use color output for `ls`
alias ls="command ls ${colorflag}"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Enable aliases to be sudo’ed

# Gzip-enabled `curl`
alias gurl="curl --compressed"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

# PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
alias plistbuddy="/usr/libexec/PlistBuddy"

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
    alias "$method"="lwp-request -m '$method'"
done

#========================================================================================
autoload -U promptinit; promptinit
prompt pure
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# zsh autosuggestion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^n' autosuggest-accept

#Git autocompletion on bash
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
alias macdotfiles='/usr/bin/git --git-dir=/Users/manoj/.macdotfiles/ --work-tree=/Users/manoj'
export PATH="/usr/local/opt/curl/bin:$PATH"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
alias config='/usr/bin/git --git-dir=/Users/manoj/.cfg/ --work-tree=/Users/manoj'
