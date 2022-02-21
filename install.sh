copy_path="/etc/systemd/system"
bin_path="/bin"

mkdir /home/$USER/crypto_station
mkdir /home/$USER/crypto_station/toCrypt
mkdir /home/$USER/crypto_station/toDecrypt
mkdir /home/$USER/crypto_station/Crypted
mkdir /home/$USER/crypto_station/Decrypted 

sudo mkdir $bin_path/py_file
sudo mkdir $bin_path/py_file/.generated_key

sudo cp python_file/generate.py $bin_path/py_file

sudo python3 $bin_path/py_file/generate.py $




sudo cp python_file/crypt.py $bin_path/py_file
sudo cp python_file/decrypt.py $bin_path/py_file

sudo mkdir $bin_path/bash_scrypt
sudo cp crypt.sh $bin_path/bash_scrypt
sudo cp decrypt.sh $bin_path/bash_scrypt

sudo chmod +x $bin_path/bash_scrypt/crypt.sh
sudo chmod +x $bin_path/bash_scrypt/decrypt.sh



sudo cp crypt.service $copy_path
sudo cp decrypt.service $copy_path


sudo systemctl enable decrypt.service
sudo systemctl enable crypt.service
sudo systemctl start decrypt.service crypt.service





