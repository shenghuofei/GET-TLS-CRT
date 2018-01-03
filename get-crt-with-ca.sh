#!/bin/bash

#ssl配置文件:/etc/pki/tls/openssl.cnf

#生成跟证书
cd /etc/pki/CA
touch index.txt serial
echo 01 > serial
openssl genrsa -out private/cakey.pem 2048
openssl req -new -x509 -key private/cakey.pem -out cacert.pem

#私有CA根据请求来签署证书
cd ~
openssl genrsa -out nginx.key 2048
openssl req -new -key nginx.key -out nginx.csr
openssl ca -in nginx.csr -out nginx.crt
#另外在极少数情况下，上面的命令生成的证书不能识别，试试下面的命令：
# openssl x509 -req -in nginx.csr -CA /etc/pki/CA/cacert.pem -CAkey /etc/pki/CA/private/cakey.pem -CAcreateserial -out nginx.crt
