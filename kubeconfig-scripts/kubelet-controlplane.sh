for host in controlplane; do
	# add the cluster information
	# you need to supply name, ca crt and server address
  kubectl config set-cluster bootstrapped-cluster \
    --certificate-authority=ca.crt \
    --embed-certs=true \
    --server=https://controlplane.kubernetes.local:6443 \
    --kubeconfig=${host}.kubeconfig

	# add credentials
  kubectl config set-credentials system:node:${host} \
    --client-certificate=${host}.crt \
    --client-key=${host}.key \
    --embed-certs=true \
    --kubeconfig=${host}.kubeconfig

	# create default context: supply cluster and user
  kubectl config set-context default \
    --cluster=bootstrapped-cluster \
    --user=system:node:${host} \
    --kubeconfig=${host}.kubeconfig

	# make the config file use the default context
  kubectl config use-context default \
    --kubeconfig=${host}.kubeconfig
done