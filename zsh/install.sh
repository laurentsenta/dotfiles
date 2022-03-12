brew install zsh autojump ack zsh-syntax-highlighting zsh-autosuggestions fd tree fzf htop

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

chsh -s $(which zsh)
