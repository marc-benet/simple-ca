
##
## List of available commands:
## Usage: make [command]
##
## -----------------------------
##
help : Makefile
	@sed -n 's/^##//p' $<

## csr          : Generates a CSR with the provided CN as argument, outputs into {CN}.csr
##              : [EXAMPLE - make csr CN=my.cn.com]
csr:
	./generate_csr.sh ${CN}

## sign         : Signs a CSR & outputs into CRT both as arguments using the defaults
##              : [EXAMPLE - make sign CSR=my.cn.com.csr CRT=my-cert.crt]
sign:
	openssl x509 -req -in ${CSR} -CA myCA.pem -CAkey myCA.key -CAcreateserial -out ${CRT} -days 1825 -sha256

## generate-ca  : Creates a key and root certificate to act as a CA for the other commands
generate-ca:
	openssl genrsa -des3 -out myCA.key 2048
	openssl req -x509 -new -nodes -key myCA.key -sha256 -days 1825 -out myCA.pem

