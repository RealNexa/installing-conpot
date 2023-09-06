#!/bin/bash



install_pyenv() {
	echo installing pyenv deps
	sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
		libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
		libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev \
		liblzma-dev python3-openssl git

	echo downloading pyenv
	curl https://pyenv.run | bash


	echo installing pyenv
	echo 'export PYENV_ROOT="$HOME/.pyenv"
	command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init -)"' >> ~/.bashrc

	source ~/.bashrc

	echo Downloading and building Python 3.10.12 from source \(This will take some time depending on system\)
	pyenv install 3.10.12
	pyenv global 3.10.12

}

setup_virtual_environment() {
	echo Setting up virtual environment \(.venv\) at ~/Documents
	cd ~/Documents
	python -m venv .venv
	source .venv/bin/activate
}

install_conpot() {
	git clone https://github.com/mushorg/conpot.git ~/Download/conpot

	pip install -r ~/Download/conpot/requirements.txt
	pip install ~/Download/conpot
}

liblib_fix() {
	sudo ln -s -f /usr/lib/x86_64-linux-gnu/libc.a /usr/lib/x86_64-linux-gnu/liblibc.a
}

install_configure_authbind() {
	sudo apt install authbind
	

	sudo touch /etc/authbind/byport/102
	sudo touch /etc/authbind/byport/161
	sudo touch /etc/authbind/byport/502
	sudo touch /etc/authbind/byport/80
	sudo touch /etc/authbind/byport/80
	sudo touch /etc/authbind/byport/8800

	sudo chmod 500 /etc/authbind/byport/102
	sudo chmod 500 /etc/authbind/byport/161
	sudo chmod 500 /etc/authbind/byport/502
	sudo chmod 500 /etc/authbind/byport/80
	sudo chmod 500 /etc/authbind/byport/8800

	sudo chown $USER /etc/authbind/byport/102
	sudo chown $USER /etc/authbind/byport/161
	sudo chown $USER /etc/authbind/byport/502
	sudo chown $USER /etc/authbind/byport/80
	sudo chown $USER /etc/authbind/byport/8800
}

echo Upgrading and updating system...
sudo apt update -y &>/dev/null
sudo apt upgrade -y &>/dev/null

echo Checking python version...

install_pyenv
setup_virtual_environment
install_conpot
install_configure_authbind
liblib_fix

echo 
echo 
echo --------------------------------------------------------------------------
echo Conpot has now been installed. \(Hopefully\)
echo type authbind conpot -f -t \<template_name\> to launch conpot with a custom template

