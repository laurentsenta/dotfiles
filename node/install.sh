curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

nvm install v12 v14 v16

if test ! $(which spoof)
then
  if test $(which npm)
  then
    echo skip;
    # sudo npm install spoof -g
  fi
fi

