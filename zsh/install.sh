brew install zsh autojump ack zsh-syntax-highlighting zsh-autosuggestions fd tree fzf htop

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

chsh -s $(which zsh)

echo "remember to update your completion scripts"

echo "initially: https://raw.githubusercontent.com/docker/cli/a4b6fe16ae7fe9260ee1960be6da2e050e493e98/contrib/completion/zsh/_docker"
echo "initially: https://raw.githubusercontent.com/docker/compose/1.29.2/contrib/completion/zsh/_docker-compose"
