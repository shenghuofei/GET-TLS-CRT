#!/bin/bash

my_domain="my-domain.com"

#C:国家,中国CN,美国US
#ST:省份
#L:城市
#O:公司
#OU:部门
#CN:域名
SUBJECT="/C=CN/ST=Beijing/L=Beijing/O=yfd/OU=devops/CN=${my_domain}"

openssl genrsa -out ${my_domain}.key 2048 #get key
openssl req -new -subj $SUBJECT -key ${my_domain}.key -out ${my_domain}.csr #get crt req
openssl x509 -req -days 3650 -in ${my_domain}.csr -signkey ${my_domain}.key -out ${my_domain}.crt #get crt
