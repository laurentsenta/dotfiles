curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

# nvm install v12

if test ! $(which spoof)
then
  if test $(which npm)
  then
    # sudo npm install spoof -g
  fi
fi

