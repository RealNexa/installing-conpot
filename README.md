# Downloading and Installing Conpot 0.6.0

# Automatic install
`$ git clone https://github.com/RealNexa/installing-conpot.git`  
Move the `conpot_install.sh` to folder which virtual environment should be created  
`$ sudo chmod +x conpot_install.sh`  
`$ source conpot_install.sh`  

# Manual Install
## Prerequisites
This install uses Ubuntu 22.04.3 LTS Jammy Jellyfish (minimal install) 

## 1. Update and Upgrade
`$ sudo apt update`<br>
`$ sudo apt upgrade`<br>

## 2. Install Python 3.10.12 (Skip this step if this version is already in use) 
Install `pyenv`<br>
install `python 3.10.12`through pyenv<br>

## 3. Install PIP 
`$ sudo apt install python3-pip`<br>

## 4. Create and Activate a Virtual Environment
`$ sudo apt install python3.10-venv`<br>
`$ python3 -m venv <venv name>`<br>
`$ source <venv name>/bin/activate`<br>

## 5. Download Conpot
`$ sudo apt install git `<br>
`$ cd ~/Download`<br>
`$ git clone https://github.com/mushorg/conpot.git`<br>

## 6. Install Conpot
`$ cd conpot`<br>
`$ pip install -r requirements.txt`<br>
`$ pip install .`<br>

## 7. Download and Setup Authbind

`$ sudo apt install authbind`<br>
`$ sudo touch /etc/authbind/byport/102`<br>
`$ sudo touch /etc/authbind/byport/161`<br>
`$ sudo touch /etc/authbind/byport/502`<br>
`$ sudo touch /etc/authbind/byport/80`<br>
`$ sudo touch /etc/authbind/byport/8800`<br>

`$ sudo chmod 500 /etc/authbind/byport/102`<br>
`$ sudo chmod 500 /etc/authbind/byport/161`<br>
`$ sudo chmod 500 /etc/authbind/byport/502`<br>
`$ sudo chmod 500 /etc/authbind/byport/80`<br>
`$ sudo chmod 500 /etc/authbind/byport/8800`<br>
	
`$ sudo chown <user> /etc/authbind/byport/102`<br>
`$ sudo chown <user> /etc/authbind/byport/161`<br>
`$ sudo chown <user> /etc/authbind/byport/502`<br>
`$ sudo chown <user> /etc/authbind/byport/80`<br>
`$ sudo chown <user> /etc/authbind/byport/8800`<br>

## Launch Conpot
`$ authbind conpot -f -t <template>`<br>

## Troubleshooting and Tips

### Web Server
By default the web server is hosted and `0.0.0.0:8800` or `localhost:8800`<br>

### liblibc.a Error on Launch
Create the following symbolic link<br>
`$ cd /usr/lib/x86_64-linux-gnu/`<br>
`$ sudo ln -s -f libc.a liblibc.a`<br>
`$ cd -` 
