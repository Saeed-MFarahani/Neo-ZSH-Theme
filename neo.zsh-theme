# Inspired by the ‌Bira theme
# Written by Saeed M Farahani

local PR_USER PR_HOST USER_SYMBOL

if [[ $UID -ne 0 ]]; then
  PR_USER='%B%F{green}%n%f'
  USER_SYMBOL='%B%F{green}%(!.#.$)%f'
else
  PR_USER='%B%F{red}%n%f'
  USER_SYMBOL='%B%F{red}%(!.#.$)%f'
fi

if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%B%F{red}%M%f'
  USER_SYMBOL='%B%F{red}%(!.#.$)%f'
else
  PR_HOST='%B%F{green}%M%f'
fi

local e001="%(1?.(!) GENERAL ERROR%f ↵."
local e002="%(2?.(!) MISUSE OF SHELL BUILTINS%f ↵."
local e126="%(126?.(!) COMMAND INVOKED CANNOT EXECUTE%f ↵."
local e127="%(127?.(!) COMMAND NOT FOUND%f ↵."
local e128="%(128?.(!) INVALID ARGUMENT TO EXIT%f ↵."
local e130="%(130?.(!) TERMINATED BY USER%f ↵."
local e255="%(255?.(!) EXIT STATUS OUT OF RANGE%f ↵."


local return_code="%F{red}${e001}${e002}${e126}${e127}${e128}${e130}${e255}%(?..%?%f ↵)"
local user_host="[${PR_USER}%B%F{blue}@${PR_HOST}%b%f]"
local current_dir="%B%{$fg[blue]%}%~ %b%f"
local current_time=" %B%F{red}‹%F{yellow}%D{%L:%M:%S}%F{red}›%f%b "

local vcs_branch='$(git_prompt_info)$(hg_prompt_info)'
local rvm_ruby='$(ruby_prompt_info)'
local venv_prompt='$(virtualenv_prompt_info)'

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"

PROMPT="╭─${user_host}${current_time}${current_dir}${rvm_ruby}${vcs_branch}${venv_prompt}
╰─ %B${USER_SYMBOL}%b "
RPROMPT="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}⌥ "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ☢ %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[yellow]%}"

ZSH_THEME_HG_PROMPT_PREFIX="$ZSH_THEME_GIT_PROMPT_PREFIX"
ZSH_THEME_HG_PROMPT_SUFFIX="$ZSH_THEME_GIT_PROMPT_SUFFIX"
ZSH_THEME_HG_PROMPT_DIRTY="$ZSH_THEME_GIT_PROMPT_DIRTY"
ZSH_THEME_HG_PROMPT_CLEAN="$ZSH_THEME_GIT_PROMPT_CLEAN"

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$fg[green]%}‹"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="› %{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX="$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX"
ZSH_THEME_VIRTUALENV_SUFFIX="$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX"

TMOUT=1
TRAPALRM() {
    zle reset-prompt
}
