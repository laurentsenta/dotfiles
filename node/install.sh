curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

nvm install v18 v20 v22

if test ! $(which spoof)
then
  if test $(which npm)
  then
    echo skip;
    # sudo npm install spoof -g
  fi
fi

