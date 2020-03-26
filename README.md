# SIMPLE CA

**SIMPLE CA** is meant to offer several commands to act as a simple Certificate Authority from your localhost. The `csr` and `sign` commands are dependant on the defaults generated in `generate-ca` command.

For more information & usage details, run `make help`

## Dependencies
- make
- openssl

## Usage examples
### Setup your issuer key and root certificate
```sh
make generate-ca
```
### Create a CSR based on the `generate_csr.sh` executable file
```sh
make csr CN=my.commoname.com
```
### Sign a certificate based on the provided CSR and output it in CRT
```sh
make sign CSR=my.commoname.com.csr CRT=commoname.crt
```
