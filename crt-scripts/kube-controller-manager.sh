openssl genrsa -out kube-controller-manager.key 2048
openssl req -new -key kube-controller-manager.key -out kube-controller-manager.csr -subj "/CN=system:kube-controller-manager/O=system:kube-controller-manager"
openssl x509 -req -in kube-controller-manager.csr -CA ca.crt -CAkey ca.key -extfile kube-controller-manager.cnf -out kube-controller-manager.crt