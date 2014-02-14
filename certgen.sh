!#/bin/sh
# Created by: Neal Magee <nmagee@gmail.com>
# Script home: https://github.com/nmagee/aws-x509-certgen
##############################################################################################################

# Clear the screen and run the user through prompts
tput clear
echo -e "\r\nEnter a convenient name of the user you are creating a signing certificate for. [Use no spaces]:"
read user

echo -e "\r\nHow many days would you like this upload certificate to be valid? [Default is 90]:"
read age

echo -e "\r\nEnter the full path to your certificate home [i.e. /home/username/.certs/ - leave blank for current directory. [ENTER]:"
read path

echo -e "\r\nI will now create a key and then generate a signing certificate using it. [ENTER]"
read blah

# Handle blank PATH values
if [ -z ${path} ]
then
  cd ./
else
  mkdir -p ${path}
  cd ${path}
fi

# Handle blank AGE values
if [ -z ${age} ]
then
  age=90
fi

# Handle blank USER values
if [ -z ${user} ]
then
  user=signingcert
fi

openssl genrsa 2048 > ${user}-key.pem
openssl req -new -x509 -nodes -sha1 -subj "/C=US/ST=Ohio/L=Springfield/O=Dis/CN=www.example.com" -days ${age} -key ${user}-key.pem -outform PEM > ${user}-cert.pem
openssl pkcs8 -topk8 -in ${user}-key.pem -nocrypt > ${user}-key2.pem
mv ${user}-key2.pem ${user}-key.pem 

# Echo things back to the user
echo -e "\r\n"
echo -e "The ${user} key and signing certificate have been created and converted into PEM format. You should now"
echo -e "copy the certificate below to paste (or upload directly) into your AWS account security credentials."
echo -e "Keep the private key in a secure location and do not share it with anyone else."
echo -e "\r\n\r\n"
cat ${user}-cert.pem
echo -e "\r\n\r\n"
