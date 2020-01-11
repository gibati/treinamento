# Treinamento Linux Essentials
## Exemplo de comandos

- Acessar a máquina pela primeira vez. 
```console
ssh  -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i /opt/chaves/AWS_Keypairs/treinamento_linux.pem ubuntu@<ip> -C "uptime"
```

- Gerar chave de acesso
```console
ssh-keygen -t rsa -b 4096 -f /tmp/<seu_nome>-key -P "senha" -C "Chave de acesso do fulano"
```

- Cria uma conta de usuário
```console
useradd -m -d /home/<seu_usuario> -s /bin/bash -c "Treinamento - Linux" -U <seu_usuario>
```

-Incluir no sudoers para ter acesso root sem password
```console
vim /etc/sudoers.d/90-cloud-init-users
```

- Resolução
```console
chmod 400 <treinamento.pem>
echo "<seu_usuario> ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-cloud-init-users

```