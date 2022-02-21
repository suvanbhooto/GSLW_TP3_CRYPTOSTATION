copy_path="/etc/systemd/system"


mkdir /home/$USER/crypto_station
mkdir /home/$USER/crypto_station/toCrypt
mkdir /home/$USER/crypto_station/toDecrypt
mkdir /home/$USER/crypto_station/Crypted
mkdir /home/$USER/crypto_station/Decrypted 

sudo mkdir $copy_path/.generated_key

sudo cp python_file/generate.py $copy_path/

sudo python3 $copy_path/generate.py $




sudo cp python_file/crypt.py $copy_path
sudo cp python_file/decrypt.py $copy_path

sudo mkdir $copy_path/bash_scrypt
sudo cp crypt.sh $copy_path/bash_scrypt
sudo cp decrypt.sh $copy_path/bash_scrypt

sudo chmod +x crypt.sh
sudo chmod +x decrypt.sh



sudo cp crypt.service $copy_path
sudo cp decrypt.service $copy_path


sudo systemctl enable decrypt.service
sudo systemctl enable crypt.service
sudo systemctl start decrypt.service crypt.service





