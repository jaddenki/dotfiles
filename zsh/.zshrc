export PATH="$HOME/.local/bin:$PATH"

# bun completions
[ -s "/Users/jaja/.bun/_bun" ] && source "/Users/jaja/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# opencode
export PATH=/Users/jaja/.opencode/bin:$PATH

# Prefer Homebrew python3 over Apple's deprecated /usr/bin/python3
export PATH="/opt/homebrew/bin:$PATH"

# Unity CLI
. "/Users/jaja/.unity/env"

# yarn spinner ysc
export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"
export DOTNET_ROLL_FORWARD=Major
export PATH="$PATH:$HOME/.dotnet/tools"

# --- Terminal tools ---
if command -v fzf >/dev/null; then
  source <(fzf --zsh)
fi
if command -v zoxide >/dev/null; then
  eval "$(zoxide init zsh)"
fi
if command -v mise >/dev/null; then
  eval "$(mise activate zsh)"
fi
if command -v starship >/dev/null; then
  eval "$(starship init zsh)"
fi


# dev
alias lg='lazygit'
alias c='clear'
alias coding='cd ~/Documents/coding'
alias school='cd ~/Documents/coding/school'
alias jamms='cd ~/Documents/coding/jamms'

# git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

# docker
alias d='docker'
alias dc='docker compose'


function y() {
  local tmp
  tmp="$(mktemp -t yazi-cwd)" || return

  yazi "$@" --cwd-file="$tmp"
  local status=$?

  if [[ -s "$tmp" ]]; then
    local cwd
    cwd="$(cat "$tmp")"
    if [[ -d "$cwd" ]]; then
      builtin cd -- "$cwd"
    fi
  fi

  rm -f "$tmp"
  return "$status"
}
