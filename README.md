aws-iam-certgen
===============

A simple bash script that will generate an x.509 key and certificate for you. This allows you to securely use the various AWS API tools [http://aws.amazon.com/developertools]. 

There is often confusion for users of Amazon Web Services about how to correctly create and install a key/cert pair so that they can use the API command-line tools. This script will create key and certificate files in the proper size and formatting for upload into your AWS accouont. This is especially useful for administrators of IAM, where many users need to be supported and given API access.

Note that, generally, users cannot have more than two certificates associated with their accounts. It is recommended that you use a 365-day expiration (also part of this script) so that your keys will expire on a healthy schedule.



System Requirements
===================
- You will need a fairly current version of BASH on your system.
- OpenSSL is required.

This was written in MacOSX (10.8.3) but works just fine in Ubuntu, Debian, and RedHhat.
