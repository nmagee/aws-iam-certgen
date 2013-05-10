!#/bin/sh

tput clear
echo -e "\r\nEnter a convenient name of the user you are creating a signing certificate for [use no spaces]:"
read user

echo -e "\r\nHow many days would you like this upload certificate to be valid? [Default is 90]:"
read age

echo -e "\r\nEnter the full path to your certificate home [i.e. /home/username/.certs/]:"
read path

echo -e "\r\nFirst I will make a key and then generate a certificate using it. During the cert creation in"
echo -e "the next step, you may leave all fields blank. [ENTER]"
read blah


if [ -z ${path} ]
then
  cd ./
else
  cd ${path}
fi

if [ -z ${age} ]
then
  age=90
fi

if [ -z ${user} ]
then
  user=signingcert
fi

openssl genrsa 1024 > ${user}-key.pem
openssl req -new -x509 -nodes -sha1 -subj "/C=US/ST=Ohio/L=Springfield/O=Dis/CN=www.example.com" -days ${age} -key ${user}-key.pem -outform PEM > ${user}-cert.pem
openssl pkcs8 -topk8 -in ${user}-key.pem -nocrypt > ${user}-key2.pem
mv ${user}-key2.pem ${user}-key.pem 

echo -e "\r\n"
echo -e "The ${user} key and signing certificate have been created and converted into PEM format. You should now"
echo -e "copy the certificate below to paste (or upload directly) into your AWS account security credentials:"
echo -e "\r\n\r\n"
cat ${user}-cert.pem
echo -e "\r\n\r\n"
