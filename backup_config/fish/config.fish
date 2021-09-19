
# set -g fish_prompt_pwd_dir_length 0


# Set Propmt ------------------------------------------------------------------------------------
# https://gist.github.com/davidmh/721241c7c34f841eed07

# Use Fishline from https://github.com/0rax/fishline
# function fish_prompt
#     fishline -s $status
# end

# # Simple prompt message
# function fish_prompt -d "Write out the prompt"
# 	printf '%s %s ~%s%s> ' (basename $PWD) (whoami) (set_color $fish_color_cwd) (set_color normal)
# end

# # Prompt message with git status
# set fish_git_dirty_color cyan
# set fish_git_not_dirty_color green
# 
# function parse_git_branch
#   set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
#   set -l git_status (git status -s)
# 
#   if test -n "$git_status"
#     echo (set_color $fish_git_dirty_color)$branch(set_color normal)
#   else
#     echo (set_color $fish_git_not_dirty_color)$branch(set_color normal)
#   end
# end
# 
# function fish_prompt -d "Write out the prompt"
#   set -l git_dir (git rev-parse --git-dir 2> /dev/null)
#   if test -n "$git_dir"
#   	printf '%s %s%s %s~> ' (basename $PWD) (set_color normal) (parse_git_branch) (set_color grey)
#   else
#     printf '%s %s~> ' (basename $PWD) (set_color normal)
#   end
# end
# ---------------------------------------------------------------------------------------------


# source ~/.bash_profile
# set -g fish_user_paths "/usr/local/opt/gettext/bin" $fish_user_paths

# Config for starship https://github.com/starship/starship
# eval (starship init fish)


# chips
if [ -e ~/.config/chips/build.fish ] ; . ~/.config/chips/build.fish ; end


# ----------------------------------------------------------------------------------
# REUSE ALIASES FROM ~/.bash_profile
egrep "^alias " ~/.bash_profile | while read e
        set var (echo $e | sed -E "s/^alias ([A-Za-z0-9_-]+)=(.*)\$/\1/")
        set value (echo $e | sed -E "s/^alias ([A-Za-z0-9_-]+)=(.*)\$/\2/")

        # remove surrounding quotes if existing
        set value (echo $value | sed -E "s/^\"(.*)\"\$/\1/")

    # evaluate variables. we can use eval because we most likely just used "$var"
        set value (eval echo $value)

    # set an alias
    alias $var="$value"
end

# REUSE ENVIRONMENT VARIABLES FROM ~/.bash_profile
egrep "^export " ~/.bash_profile | while read e
    set var (echo $e | sed -E "s/^export ([A-Z0-9_]+)=(.*)\$/\1/")
    set value (echo $e | sed -E "s/^export ([A-Z0-9_]+)=(.*)\$/\2/")

    # remove surrounding quotes if existing
    set value (echo $value | sed -E "s/^\"(.*)\"\$/\1/")

    if test $var = "PATH"
        # replace ":" by spaces. this is how PATH looks for Fish
        set value (echo $value | sed -E "s/:/ /g")

        # use eval because we need to expand the value
        eval set -xg $var $value

        continue
    end

    # evaluate variables. we can use eval because we most likely just used "$var"
    set value (eval echo $value)

    #echo "set -xg '$var' '$value' (via '$e')"

    switch $value
            case '`*`';
            # executable
            set NO_QUOTES (echo $value | sed -E "s/^\`(.*)\`\$/\1/")
            set -x $var (eval $NO_QUOTES)
        case '*'
            # default
            set -xg $var $value
        end
end
# ----------------------------------------------------------------------------------

