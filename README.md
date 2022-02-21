#CRYPTO STATION by Suvan Bhooto

Crypto station is used to encrypt and decrypt files.


***

###Install and Unistall


###Install

when installing, the program will create a folder **crypto_station** in home with four sub folder in it. 

>toCrypt
>toDecrypt
>Crypted
>Decrypted


###Unistall

When unistalling, the program will delete **crypto_station** along with all folders and file in it.



***

##The use of each folder

**toCrypt** place all files you want to encrypt here.

**crypted** All encrypted files are stored here as *crypted_text.txt*

**toDecrypt** The encrypted files will automatically go to this folder

**Decrypt** All the decrypted files will be stored with same name as the original name of the files. 



##how to use Crypto Station

Open **crypto_station** in home.
 
Copy and paste the text files that you want to encrypt in **toCrypt** folder.

The program will automatically encrypt the files in the **toCrypt** and save them in **Crypted** folder as **crypted_text.txt**.

The program will then send encrypted file to **toDecrypt** folder and will automatically save in **Decrypted** folder as **text_txt**. 


***




##Installation

Make a git clone of the git repository

```
git clone https://github.com/suvanbhooto/GSLW_TP3_CRYPTOSTATION.git

#or

git clone git@github.com:suvanbhooto/GSLW_TP3_CRYPTOSTATION.git
```


***

Open in terminal the folder that you just clone.

Install the crypto package

```bash
sudo apt get install python3-crypto
```


***

To install crypto station

```bash
#we need to give the script install.sh the right to execute

sudo chmod +x install.sh 

#Then run the script

./install.sh
```



***

##Uninstallation 

To unistall crypto station
Open in terminal the cloned folder.

```bash
#we need to give the script unistall.sh the right to execute

sudo chmod +x unistall.sh  

#Then run the script

./unistall.sh 
```





