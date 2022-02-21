from Crypto.PublicKey import RSA
from Crypto.Cipher import PKCS1_OAEP
import zlib
import base64
import sys

def remove_prefix(text, prefix):
    return text[len(prefix):] if text.startswith(prefix) else text

#Our Encryption Function
def encrypt_blob(blob, public_key):
    #Import the Public Key and use for encryption using PKCS1_OAEP
    rsa_key = RSA.importKey(public_key)
    rsa_key = PKCS1_OAEP.new(rsa_key)

    #compress the data first
    blob = zlib.compress(blob)

    #In determining the chunk size, determine the private key length used in bytes
    #and subtract 42 bytes (when using PKCS1_OAEP). The data will be in encrypted
    #in chunks
    chunk_size = 470
    offset = 0
    end_loop = False
    encrypted =  bytearray()

    while not end_loop:
        #The chunk
        chunk = blob[offset:offset + chunk_size]

        #If the data chunk is less then the chunk size, then we need to add
        #padding with " ". This indicates the we reached the end of the file
        #so we end loop here
        if len(chunk) % chunk_size != 0:
            end_loop = True
            #chunk += " " * (chunk_size - len(chunk))
            chunk += bytes(chunk_size - len(chunk))

        #Append the encrypted chunk to the overall encrypted file
        encrypted += rsa_key.encrypt(chunk)

        #Increase the offset by chunk size
        offset += chunk_size

    #Base 64 encode the encrypted file
    return base64.b64encode(encrypted)

#Use the public key for encryption
fd = open("/bin/py_file/.generated_key/public_key.pem", "rb")
public_key = fd.read()
fd.close()

#Our candidate file to be encrypted

user=sys.argv[2]

src_file = remove_prefix(sys.argv[1],"/home/"+user+"/crypto_station/toCrypt/") #source file
#print (src_file)
#print (sys.argv[1])
print("starting crypting file")
print("/home/"+user+"/crypto_station/toCrypt/"+src_file)



fd = open("/home/"+user+"/crypto_station/toCrypt/"+src_file, "rb")
unencrypted_blob = fd.read()
fd.close()

encrypted_blob = encrypt_blob(unencrypted_blob, public_key)

#Write the encrypted contents to a file
fd = open("/home/"+user+"/crypto_station/Crypted/crypted_"+src_file, "wb")
fd.write(encrypted_blob)
fd.close()

fd = open("/home/"+user+"/crypto_station/toDecrypt/"+src_file, "wb")
fd.write(encrypted_blob)
fd.close()


