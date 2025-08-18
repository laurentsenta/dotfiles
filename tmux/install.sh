#!/usr/bin/env bash

case "$(uname -s)" in
	Darwin)
		brew install tmux reattach-to-user-namespace
		;;
	Linux)
		sudo apt install -y tmux
		;;
	*)
		echo "Unsupported OS"
		exit 1
		;;
esac
