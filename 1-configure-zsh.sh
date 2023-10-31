#!/usr/bin/zsh

git clone --recursive https://github.com/ekenalt/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB

ZSHRC_PATH="${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zshrc
SOURCE_ZSH_WSL_SED_ARGUMENT='s|#SOURCE_ZSH_WSL||g'

if test -f /proc/sys/fs/binfmt_misc/WSLInterop
then
  SOURCE_ZSH_WSL_SED_ARGUMENT='s|#SOURCE_ZSH_WSL|. ~/.zsh_wsl|g'
else
  \rm -f "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zsh_wsl
fi

sed -e "${SOURCE_ZSH_WSL_SED_ARGUMENT}" "${ZSHRC_PATH}" | tee "${ZSHRC_PATH}.new"
mv -f "${ZSHRC_PATH}.new" "${ZSHRC_PATH}"

for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /bin/zsh
