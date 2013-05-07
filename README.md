aws-x509-certgen
===============
A simple bash script that will generate an x.509 key and signing certificate for you. This allows you to securely use the various AWS API tools [http://aws.amazon.com/developertools]. 

Currently, IAM doesn't have an API action to create signing certificates, so you must use a third-party tool such as OpenSSL to create the certificate first. AWS recommends you create an RSA key that is either 1024-bit or 2048-bit in length. The certificate can be self-signed, and the key and certificate must be in PEM format.

There is often confusion for users of Amazon Web Services about how to correctly create and install a signing certificate so that they can use the API command-line tools. This script will create key and certificate files in the proper size and formatting for upload into your AWS accouont. This is especially useful for administrators of IAM, where many users need to be supported and given API access.

Note that, generally, users cannot have more than two certificates associated with their accounts. It is recommended that you use a 365-day expiration (also part of this script) so that your keys will expire on a healthy schedule.


usage
=====
Run the script from the command-line, i.e. "./aws-x509-certgen/certgen.sh" and answer the prompts to name the key and certificate and a path in which to store them. Since this certificate is self-signed, you do not need to fill out any details of your organization or address (they are ignored by AWS). 

After running the script, your certificate will be displayed on the screen. If you are using IAM for user authentication into your AWS account, you can then paste the text of the certificate into the signing certificates section of a user account (IAM --> Users --> <your user> --> Security Credentials tab --> Signing Certificates). If you are using a standalone AWS account, go to Security Credentials --> Access Credentials --> X.509 Certificates and upload your own certificate.


system requirements
===================
- bash
- OpenSSL

This was written in MacOSX (10.8.3) but works just fine in Ubuntu, Debian, and Redhat.

license
=======
Released under the MIT License. See the included LICENSE.txt file for details.
