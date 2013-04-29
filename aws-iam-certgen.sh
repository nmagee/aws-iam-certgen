!#/bin/sh

echo -e "Enter the name of the user you are creating an IAM key/cert for:"
read user

echo -e "Enter the full path to your certificate home [i.e. /home/username/certs/]:"
read path

echo -e "First I will make a key and then generate a certificate using it. During the cert creation in the next step, you may leave all fields blank. [ENTER]"
read blah

cd $path

openssl genrsa 1024 > ${user}-key.pem
openssl req -new -x509 -nodes -sha1 -days 365 -key ${user}-key.pem -outform PEM > ${user}-cert.pem
openssl pkcs8 -topk8 -in ${user}-key.pem -nocrypt > ${user}-key2.pem
mv ${user}-key2.pem ${user}-key.pem 

echo -e "The ${user} key and certificate have been created."


