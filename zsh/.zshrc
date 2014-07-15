#{{{Colors definition
#Color table from: http://www.understudy.net/custom.html
fg_black=%{$'\e[0;30m'%}
fg_red=%{$'\e[0;31m'%}
fg_green=%{$'\e[0;32m'%}
fg_brown=%{$'\e[0;33m'%}
fg_blue=%{$'\e[0;34m'%}
fg_purple=%{$'\e[0;35m'%}
fg_cyan=%{$'\e[0;36m'%}
fg_lgray=%{$'\e[0;37m'%}
fg_dgray=%{$'\e[1;30m'%}
fg_lred=%{$'\e[1;31m'%}
fg_lgreen=%{$'\e[1;32m'%}
fg_yellow=%{$'\e[1;33m'%}
fg_lblue=%{$'\e[1;34m'%}
fg_pink=%{$'\e[1;35m'%}
fg_lcyan=%{$'\e[1;36m'%}
fg_white=%{$'\e[1;37m'%}
#Text Background Colors
bg_red=%{$'\e[0;41m'%}
bg_green=%{$'\e[0;42m'%}
bg_brown=%{$'\e[0;43m'%}
bg_blue=%{$'\e[0;44m'%}
bg_purple=%{$'\e[0;45m'%}
bg_cyan=%{$'\e[0;46m'%}
bg_gray=%{$'\e[0;47m'%}
#Attributes
at_normal=%{$'\e[0m'%}
at_bold=%{$'\e[1m'%}
at_italics=%{$'\e[3m'%}
at_underl=%{$'\e[4m'%}
at_blink=%{$'\e[5m'%}
at_outline=%{$'\e[6m'%}
at_reverse=%{$'\e[7m'%}
at_nondisp=%{$'\e[8m'%}
at_strike=%{$'\e[9m'%}
at_boldoff=%{$'\e[22m'%}
at_italicsoff=%{$'\e[23m'%}
at_underloff=%{$'\e[24m'%}
at_blinkoff=%{$'\e[25m'%}
at_reverseoff=%{$'\e[27m'%}
at_strikeoff=%{$'\e[29m'%}
#}}}
#{{{Config 
autoload -U colors zsh-mime-setup select-word-style
# colors
colors          
# run everything as if it's an executable
zsh-mime-setup  
# ctrl+w on words
select-word-style bash 
#}}}
#{{{Prompt
# allow funky stuff in prompt
setopt PROMPT_SUBST
prompt="${fg_green}${at_bold}%n [${fg_white}${at_italics}${at_boldoff} %~ ${at_italicsoff}${fg_green}${at_bold}]$ ${fg_white}${at_boldoff}"
RPROMPT='${vim_mode} ${vcs_info_msg_0_}'
#}}}
# {{{Key bindings
# Lookup in /etc/termcap or /etc/terminfo else, you can get the right keycode
# by typing ^v and then type the key or key combination you want to use.
# "man zshzle" for the list of available actions
#bindkey -e                      # emacs keybindings
#bindkey '\e[1;5C' forward-word            # C-Right
#bindkey '\e[1;5D' backward-word           # C-Left
#bindkey '\e[2~'   overwrite-mode          # Insert
#bindkey '\e[5~'   history-search-backward # PgUp
#bindkey '\e[6~'   history-search-forward  # PgDn
#bindkey '^D'      delete-char             # Del
#bindkey '^R'      history-incremental-pattern-search-backward
bindkey '\e[3~'   delete-char             # Del
bindkey '^A'      beginning-of-line       # Home
bindkey '^E'      end-of-line             # End
#}}}
#{{{Completion
autoload -U compinit
compinit
zmodload -i zsh/complist
zstyle ':completion:*' use-perl on
zstyle ':completion:*' menu select=2
# insert all expansions for expand completer
zstyle ':completion:*:expand:*' keep-prefix true tag-order all-expansions
# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format "- ${fg_cyan}%d%${fg_white} -"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-separator '#'
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*:prefix:*' add-space true
# Make the nice with git completion and others
zstyle ':completion::*:(git|less|rm|emacs)' ignore-line true
# SSH Completion
zstyle ':completion:*:scp:*' tag-order files 'hosts:-domain:domain'
zstyle ':completion:*:scp:*' group-order files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order 'hosts:-domain:domain'
zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr
# highlight parameters with uncommon names
zstyle ':completion:*:parameters' list-colors "=[^a-zA-Z]*=$color[white]"
# highlight aliases
zstyle ':completion:*:aliases' list-colors "=*=$color[white]"
# highlight the original input.
zstyle ':completion:*:original' list-colors "=*=$color[white]"
# highlight words like 'esac' or 'end'
zstyle ':completion:*:reserved-words' list-colors "=*=$color[white]"
# colorize hostname completion
zstyle ':completion:*:*:*:*:hosts' list-colors "=*=$color[white];$color[white]"
# Disable completion of usernames
zstyle ':completion:*' users off
# add colors to processes for kill completion
zstyle ':completion:*:*:kill:*' verbose yes
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#) #([^ ]#)*=$color[cyan]=$color[yellow]=$color[green]"
# With commands like `rm' it's annoying if one gets offered the same filename
# again even if it is already on the command line. To avoid that:
zstyle ':completion:*:rm:*' ignore-line yes
# Manpages, ho!
zstyle ':completion:*:manuals'       separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections   true
# Cache
zstyle ':completion:*' use-cache off
#}}}
#{{{Pushd
setopt auto_pushd               # make cd push old dir in dir stack
setopt pushd_ignore_dups        # no duplicates in dir stack
setopt pushd_silent             # no dir stack after pushd or popd
setopt pushd_to_home            # `pushd` = `pushd $HOME`
#}}}
# {{{History
HISTFILE=~/.zshhist             # where to store zsh config
HISTSIZE=5000                   # big history
SAVEHIST=5000                   # big history
setopt append_history           # append
setopt hist_ignore_all_dups     # no duplicate
unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify              # show before executing history commands
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit 
setopt share_history            # share hist between sessions
setopt bang_hist                # !keyword
#}}}
# {{{Various
setopt auto_cd                  # if command is a path, cd into it
setopt auto_remove_slash        # self explicit
setopt chase_links              # resolve symlinks
setopt correct                  # try to correct spelling of commands
setopt extended_glob            # activate complex pattern globbing
setopt glob_dots                # include dotfiles in globbing
setopt print_exit_value         # print return value if non-zero
unsetopt beep                   # no bell on error
unsetopt bg_nice                # no lower prio for background jobs
unsetopt clobber                # must use >| to truncate existing files
unsetopt hist_beep              # no bell on error in history
unsetopt hup                    # no hup signal at shell exit
unsetopt ignore_eof             # do not exit on end-of-file
unsetopt list_beep              # no bell on ambiguous completion
unsetopt rm_star_silent         # ask for confirmation for `rm *' or `rm path/*'
#setxkbmap -option compose:ralt  # compose-key
print -Pn "\e]0; %n@%M: %~\a"   # terminal title
#}}}
# {{{External sourcing
source $HOME/.alias             # alias
source $HOME/.envars            # env vars
source $HOME/.funcs             # functions
#}}}
