# Install go on windows bash

I wanted to run some go tools in bash -- so i needed to install go.

I used this tutorial:

## [Go installer for Bash on Windows](https://stefanprodan.com/2016/golang-bash-on-windows-installer/)

Wherein you basically do this:

	cd $HOME
	curl -s -L https://gist.githubusercontent.com/stefanprodan/29d738c3049a8714297a9bdd8353f31c/raw/1f3ae2cf97cb2faff52a8a3d98f0b6415d86c810/win10-bash-go-install.sh | sudo bash

(I actually downloaded it into a file and ran the file with `sudo bash installgo.sh`)

Then I had to **restart bash** before `which go` would admit that go was installed.

## External references

* [Go installer for Bash on Windows](https://stefanprodan.com/2016/golang-bash-on-windows-installer/)