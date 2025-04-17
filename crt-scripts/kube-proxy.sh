openssl genrsa -out kube-proxy.key 2048
openssl req -new -key kube-proxy.key -out kube-proxy.csr -subj "/CN=system:kube-proxy/O=system:node-proxier"
openssl x509 -req -in kube-proxy.csr -CA ca.crt -CAkey ca.key -extfile kube-proxy.cnf -out kube-proxy.crt