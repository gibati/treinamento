# Treinamento Linux Essentials
## Exemplo de comandos

- Acessar a máquina pela primeira vez. 
```console
ssh  -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i /opt/chaves/AWS_Keypairs/treinamento_linux.pem ubuntu@<ip> -C "uptime"
```

