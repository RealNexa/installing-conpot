# Downloading and Installing Conpot 0.6.0

## Prerequisites
This install uses Ubuntu 22.04.3 LTS Jammy Jellyfish (minimal install) 

## 1. Update and Upgrade
`$ sudo apt update`  
`$ sudo apt upgrade`  

## 2. Install Python 3.10.12 (Skip this step if this version is already in use) 
Install `pyenv`
install `python 3.10.12`through pyenv

## 3. Install PIP 
`$ sudo apt isntall python3-pip`

## 4. Create and Activate a Virtual Environment
`$ sudo apt install python3.10-venv`
`$ python3 -m venv <venv name>`
`$ source <venv name>/bin/activate`

## 5. Download Conpot
`$ sudo apt install git `
`$ cd ~/Downlad`
`$ git clone https://github.com/mushorg/conpot.git`

## 6. Install Conpot
`$ cd conpot`
`$ pip install -r requirements.txt`
`$ pip install .`

## 7. Download and Setup Authbind

`$ sudo apt install authbind`
`$ sudo touch /etc/authbind/byport/102`
`$ sudo touch /etc/authbind/byport/161`
`$ sudo touch /etc/authbind/byport/502`
`$ sudo touch /etc/authbind/byport/80`
`$ sudo touch /etc/authbind/byport/8800`

`$ sudo chmod 500 /etc/authbind/byport/102`
`$ sudo chmod 500 /etc/authbind/byport/161`
`$ sudo chmod 500 /etc/authbind/byport/502`
`$ sudo chmod 500 /etc/authbind/byport/80`
`$ sudo chmod 500 /etc/authbind/byport/8800`
	
`$ sudo chown <user> /etc/authbind/byport/102`
`$ sudo chown <user> /etc/authbind/byport/161`
`$ sudo chown <user> /etc/authbind/byport/502`
`$ sudo chown <user> /etc/authbind/byport/80`
`$ sudo chown <user> /etc/authbind/byport/8800`

## Launch Conpot
`$ authbind conpot -f -t <template>`

## Troubleshooting and Tips

### Web Server
By default the web server is hosted ad `0.0.0.0:8800` or `localhost:8800`

### liblibc.a Error on Launch
Create the following symbolic link
`$ cd /usr/lib/x86_64-linux-gnu/`
`$ sudo ln -s -f libc.a liblibc.a`
`$ cd -` 
