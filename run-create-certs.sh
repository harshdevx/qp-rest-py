#!/bin/bash
openssl req -x509 -nodes -days 365 -subj /C=CA/ST=ON/O=qietpeaks/CN=localhost -addext subjectAltName=DNS:localhost -newkey rsa:2048 -keyout ./key.pem -out ./cert.pem;
echo -n "name the file for private public key? "
read FILE_NAME
openssl genrsa -out $PWD/$FILE_NAME-private.pem 4096
openssl rsa -in $PWD/$FILE_NAME-private.pem -pubout -out $PWD/$FILE_NAME-public.pem
find $PWD -iname "*.pem"