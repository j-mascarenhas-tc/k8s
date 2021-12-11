# Cluster de monitoramento

### Criando Cluster com Kind

```shell
kind create cluster --name=monitoring
```

### install metalLB

`kubectl create ns metallb-system`

`kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/main/manifests/metallb.yaml`

###### Range IP of kind controlplane put in metallb-config.yaml

`docker inspect lab-control-plane --format '{{.NetworkSettings.Networks.kind.IPAddress}}'`

### apply configmap

`kubectl apply -f metallb-config.yaml`

### Criar o segundo cluster

```shell
kind create cluster --name=dev
```

### Criar o terceiro cluster

```shell
kind create cluster --name=prod
```

### (opcional MINIO local )

docker run -d -p 9000:9000 -p 9001:9001 \
-e MINIO_ROOT_USER=minio -e MINIO_ROOT_PASSWORD=minio123 quay.io/minio/minio server /data --console-address ":9001"

### install Grafana

create a namespace called monitoring

`kubectl create namespace monitoring`

Create PV + PVC for Grafana persistency

### Referencias

https://medium.com/@shacharaj/kubernetes-multi-cluster-monitoring-using-prometheus-thanos-on-eks-using-helm-7279d8b42213

https://itnext.io/monitoring-kubernetes-workloads-with-prometheus-and-thanos-4ddb394b32c

https://medium.com/oracledevs/monitoring-multiple-oke-clusters-with-prometheus-thanos-and-grafana-part-1-df11df7013f1
