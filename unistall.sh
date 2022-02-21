copy_path="/etc/systemd/system"


rm -r /home/$USER/crypto_station

sudo rm -r $copy_path/.generated_key
sudo rm -r $copy_path/generate.py 

sudo rm -r $copy_path/crypt.py
sudo rm -r $copy_path/decrypt.py

sudo rm -r /etc/systemd/system/bash_scrypt

#sudo rm -r $copy_path/bash_script/crypt.sh
#sudo rm -r $copy_path/bash_script/decrypt.sh

sudo systemctl stop crypt.service
sudo systemctl stop decrypt.service

sudo systemctl disable crypt.service
sudo systemctl disable decrypt.service

sudo rm -r $copy_path/crypt.service
sudo rm -r $copy_path/decrypt.service

sudo systemctl daemon-reload
