#!/usr/bin/env bash

case "$(uname -s)" in
	Darwin)
		brew install gnu-sed
		;;
	Linux)
		# sudo apt install -y y
		;;
	*)
		echo "Unsupported OS"
		exit 1
		;;
esac
