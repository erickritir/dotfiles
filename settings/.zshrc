export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"


plugins=(git
        z
        zsh-syntax-highlighting
        zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh


SPACESHIP_PROMPT_ORDER=(
  user # Username section
  dir # Current directory section
  host # Hostname section
  git # Git section (git_branch + git_status)
  venv # virtualenv
  hg # Mercurial section (hg_branch + hg_status)
  exec_time # Execution time
  line_sep # Line break
  jobs # Background jobs indicator
  exit_code # Exit code section
  char # Prompt character
)

SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "

# aliases
source "${HOME}/.aliases"

. "$HOME/.local/bin/env"

eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
