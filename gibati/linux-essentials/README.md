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

- Deixa a autenticação do usuário por chave
```console
mkdir /home/<seu_usuario>/.ssh/
mv /tmp/<chave>.pub /home/<seu_usuario>/.ssh/
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

- Meus primeiros comandos
```console
man     - an interface to the on-line reference manuals
cd      - access a directory
rm      - remove files or directories
mv      - move (rename) files
ls      - list directory contents
who     - show who is logged on
mkdir   - make directories
head    - output the first part of files
more    - file perusal filter for crt viewing
uptime  - tell how long the system has been running.
whoami  - print effective userid
df -kh  - report file system disk space usage
top     - display Linux processes
ps      - report a snapshot of the current processes.
kill    - send a signal to a process
free    - Display amount of free and used memory in the system
dmidecode - DMI table decoder
apt     - package management system
grep, egrep, fgrep, rgrep - print lines matching a pattern
```
