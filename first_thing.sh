/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nvm install v13.12.0
sudo chown -R $(whoami)  /usr/local/share/zsh /usr/local/share/zsh/site-functions
compaudit | xargs chmod g-w,o-w
upgrade_oh_my_zsh