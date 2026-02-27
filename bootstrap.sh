#!/usr/bin/env bash
set -e

# oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# snap packages
SNAP_PACKAGES=(
  glow
)
for pkg in "${SNAP_PACKAGES[@]}"; do
  if ! snap list "$pkg" &>/dev/null; then
    sudo snap install "$pkg"
  fi
done

echo "Done. Run: source ~/.zshrc"
