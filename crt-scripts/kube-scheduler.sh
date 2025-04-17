openssl genrsa -out kube-scheduler.key 2048
openssl req -new -key kube-scheduler.key -out kube-scheduler.csr -subj "/CN=system:kube-scheduler/O=system:system:kube-scheduler"
openssl x509 -req -in kube-scheduler.csr -CA ca.crt -CAkey ca.key -extfile kube-scheduler.cnf -out kube-scheduler.crt