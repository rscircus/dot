alias a="exa"                                # list files w/ exa if lsd ain't available
alias cwd='pwd | pbcopy'                     # macosx copy path
alias v="mv"                                 # move files/folders or rename
alias sf="source ~/.config/fish/config.fish" # source fish config
alias rr="rm -rf"
alias md="mkdir"

# TODO: What's this:
alias wgi="watchexec --restart --exts go \"tput reset && go install .\""
alias wg="watchexec --restart --exts go \"tput reset && go run .\""

# cd places
alias d="cd"
alias ds="cd ~/src"
alias dn="cd ~/src/life"
alias dot="cd ~/src/dot"
#alias dt='cd ~/test'

# org
alias _="sudo"

# open
alias yt="yt-dlp -f 'bestvideo[height<=720]+bestaudio/best[height<=720]'"
alias o="xdg-open" # -- how to differentiate between macos/linux
