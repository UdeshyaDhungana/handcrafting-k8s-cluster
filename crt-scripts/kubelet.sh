openssl genrsa -out node-00.key
openssl req -new -key node-00.key -subj "/CN=system:node:node-00/O=system:nodes" -out node-00.csr
# Configuration file given below
openssl x509 -req -in node-00.csr -CA ca.crt -CAkey ca.key -out node-00.crt -extfile node-00.cnf