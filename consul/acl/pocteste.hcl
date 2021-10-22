# agent-policy.hcl contains the following:

key_prefix "microservices/pocteste" {
  policy = "read"
}

key_prefix "nats/pocteste/" {
  policy = "read"
}