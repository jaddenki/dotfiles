# dotfiles

macos dotfiles managed with gnu stow. the full `Brewfile` is for my personal machine; `Brewfile.work` only installs the command-line tools needed for the shared setup. it does not install apps, language runtimes, or personal services.

## work laptop

install [homebrew](https://brew.sh) if your workplace permits it, then:

```sh
git clone https://github.com/jaddenki/dotfiles.git ~/dotfiles
cd ~/dotfiles
brew bundle --file=Brewfile.work
stow -n -t "$HOME" bat ghostty git lazygit mise starship yazi zed zsh
stow -t "$HOME" bat ghostty git lazygit mise starship yazi zed zsh
```

the dry run (`stow -n`) shows conflicts before anything is linked. back up or move conflicting files yourself, then rerun the stow command. install zed and ghostty separately if your work machine allows them; their custom jamms themes are included here. zed uses aeonik and jetbrains mono when available, so install those fonts separately or change the font settings.

set your work git identity in `~/.gitconfig.local` (included by the shared git config), and put machine-specific shell settings in `~/.zshrc.local` using `zsh-local.example` as a guide. do not commit credentials or work-specific settings.

zed's built-in agent prompts before tool use and runs terminal commands in its sandbox by default. this does not control external agents such as opencode, cursor, or claude; configure their permissions separately before using them on work projects.

## personal machine

use `brew bundle --file=Brewfile` instead of the work brewfile if you want the full personal package list. stow whichever packages you use.
