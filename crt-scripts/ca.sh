# generate a key for ca
openssl genrsa -out ca.key 2048

# create a certificate signing request
openssl req -new -key ca.key -subj "/CN=KUBERNETES-CA" -out ca.csr

# Sign certificates
openssl x509 -req -in ca.csr -signkey ca.key -out ca.crt