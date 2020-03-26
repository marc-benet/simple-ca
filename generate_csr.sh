#!/bin/bash

CN="$@"

openssl req -new -sha256 -nodes -out "${CN}".csr -newkey rsa:2048 -keyout "${CN}.key" -config <(
cat <<-EOF
[req]
default_bits = 2048
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn

[ dn ]
C=ES
ST=Catalunya
L=Barcelona
O=SecretOrg
OU=Unit
CN = "$CN"

[ req_ext ]
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = "$CN"
IP.1 = 0.0.0.0
EOF
)
