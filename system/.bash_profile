
# -----------------------------------------------------------------------
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export ENV_DEV="base"
export EDITOR='nvim'
# -----------------------------------------------------------------------

alias ..='cd ..'
alias ls='exa'
alias la='exa -a'
alias view='viu'
alias cat="bat"
alias mv='mv -i'
alias rm='rm -i'
alias gs='git status'
alias python="/usr/local/bin/python3"
alias python2="/usr/bin/python2.7"

# -----------------------------------------------------------------------
# Configuration for file serarching
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --exclude: Exclude directories for searching
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
# export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --ignore .git -g ""'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
# export FZF_COMPLETION_TRIGGER='\'
export FZF_TMUX_HEIGHT='80%'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --theme=OneHalfDark --style=grid,header --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
export FZF_PREVIEW_COMMAND='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --theme=OneHalfDark --style=grid,header --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'
# -----------------------------------------------------------------------

