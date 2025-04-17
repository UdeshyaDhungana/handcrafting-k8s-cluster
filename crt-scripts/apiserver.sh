openssl genrsa -out kube-apiserver.key 2048
openssl req -new -key kube-apiserver.key -subj "/CN=kubernetes" -out kube-apiserver.csr
# You will need to create a temporary configuration file for openssl 
# to issue alternative names
# API server goes by different names, so you should configure the CSR to hold
# alternative names as well
# Alternative names include
# 1. kubernetes
# 2. kubernetes.default
# 3. kubernetes.default.svc
# 4. kubernetes.default.svc.cluster.local, etc
openssl x509 -req -in kube-apiserver.csr -CA ca.crt -CAkey ca.key -extfile kube-apiserver.cnf -out kube-apiserver.crt