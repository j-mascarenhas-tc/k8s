# Create local Cluster with Kind and MetalLB

### Install Kind

*need docker run*

`curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64`
`chmod +x ./kind`
`mv ./kind /usr/local/bin/`

### Create Cluster

`kind create cluster --name=lab --config cluster.yaml`
OR
`kind create cluster --name=lab`

### install metalLB

`kubectl create ns metallb-system`
`kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/main/manifests/metallb.yaml`

###### Range IP of kind controlplane  put in metallb-config.yaml

`docker inspect lab-control-plane --format '{{.NetworkSettings.Networks.kind.IPAddress}}'`

### apply configmap

`kubectl apply -f metallb-config.yaml`

### Load image from local

`kind load docker-image --name lab <image-name:latest>`

###### ~~install kind with contour (OPTIONAL)~~

https://projectcontour.io/kindly-running-contour/

