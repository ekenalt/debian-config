#!/usr/bin/zsh

mkdir -p "$HOME/.config"
mkdir -p "$HOME/.cache"
mkdir -p "$HOME/.local/share"
mkdir -p "$HOME/.local/state"
mkdir -p "$HOME/.local/bin"

git clone --recursive https://github.com/ekenalt/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB

ZSHRC_PATH="${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zshrc
SOURCE_ZSH_WSL_SED_ARGUMENT='s|# Source .zsh_wsl||g'

if grep -iq "microsoft" /proc/version
then
  SOURCE_ZSH_WSL_SED_ARGUMENT='s|# Source .zsh_wsl|# Source .zsh_wsl\nif [[ -s "${ZDOTDIR:-$HOME}/.zsh_wsl" ]]; then\n  source "${ZDOTDIR:-$HOME}/.zsh_wsl"\nfi|g'
else
  \rm -f "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zsh_wsl
fi

sed -e "${SOURCE_ZSH_WSL_SED_ARGUMENT}" "${ZSHRC_PATH}" | cat -s | tee "${ZSHRC_PATH}.new"
mv -f "${ZSHRC_PATH}.new" "${ZSHRC_PATH}"

for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /bin/zsh
