# Consul

#### Conectar no consul

```shell
export CONSUL_HTTP_ADDR=172.16.0.52:80
```

```shell
export CONSUL_HTTP_TOKEN=xxxxxxxxxyyyyyyyy
```

#### Criar ACL

```shell
cd acl/
```

```shell
consul acl policy create -name "pocteste-read" \
  -description "This is an policy for pocteste to access consul" \
  -rules @pocteste.hcl
```

#### Criar Role

```shell
consul acl role create -name "pocteste" -policy-name="pocteste-read" -policy-name="servers-read"
```

#### Criar Token

```shell
consul acl token create -description "pocteste token" \
  -policy-name "pocteste-read" \
  -role-name "pocteste"
```

#### Criando Chave/Valor, exportar valor

```shell
consul kv put microservices/pocteste @config.json
```

