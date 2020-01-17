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
touch   - change file timestamps
head    - output the first part of files
more    - file perusal filter for crt viewing
uptime  - tell how long the system has been running.
whoami  - print effective userid
df -kh  - report file system disk space usage
ps      - report a snapshot of the current processes.
kill    - send a signal to a process
grep, egrep, fgrep, rgrep - print lines matching a pattern
```

- Corrigindo o horário do servidor
```console
ln      - make links between files
tzdata  - time zone and daylight-saving time data
date    - date - print or set the system date and time
--
ls -l /etc/localtime
ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
```

- Principais logs do sistema
```console
ls -lrt /var/log
tail -f  /var/log/syslog
tail -200f  /var/log/auth.log
dmesg
```

- Visualizando recursos dos servidores
```console
vmstat  - Report virtual memory statistics
free    - Display amount of free and used memory in the system
top     - display Linux processes
dmidecode - DMI table decoder
du      - estimate file space usage
--
vmstat 1 10
free -m
top 1
dmidecode | more

```

- Gerenciando pacotes do sistema
```console
apt     - package management system
dpkg    - package manager for Debian
--
apt list
apt update
apt search ipcalc

apt install ipcalc -y
apt remove ipcalc -y

apt-get install ipcalc -y
apt-get remove ipcalc -y

dpkg --list | grep -i ipcalc
```

- Criando diretórios e arquivos
```console
mkdir -p /opt/treinamento/
rm -vfr /opt/treinamento/
ls -la /opt/treinamento/
touch /opt/treinamento/.meu_primeiro_arquivo_oculto.txt
echo "teste 123" > /opt/treinamento/meu_arquivo_teste.txt
cat /proc/cpuinfo > /opt/treinamento/hw_cpu.conf
cat /proc/meminfo | tee /tmp/hw_mem.conf
```

- Entendendo permissões de arquivos
```console
Comando	Número	Permissão	Status
chmod	000	---------	Nenhuma
chmod	400	r--------	Leitura apenas para o dono
chmod	444	r--r--r--	Leitura para o dono, grupo e outros
chmod	600	rw-------	Leitura e gravação apenas para o dono
chmod	620	-rw--w----	Leitura e gravação para o dono, gravação para o grupo
chmod	640	-rw-r-----	Leitura e gravação para o dono, e leitura para o grupo
chmod	644	rw-r--r--	Leitura e execução para o dono, leitura para o grupo e leitura para outros
chmod	645	-rw-r--r-x	Leitura e gravação para o dono, leitura para o grupo e leitura e execução para outros
chmod	646	-rw-r--rw-	Leitura e gravação para o dono, leitura para o grupo e leitura e gravação para outros
chmod	650	-rw-r-x---	Leitura e gravação para o dono e leitura e execução para o grupo
chmod	660	-rw-rw----	Leitura e gravação para o dono e leitura e gravação para o grupo
chmod	661	-rw-rw---x	Leitura e gravação para o dono, leitura e gravação para o grupo e execução para outros
chmod	662	-rw-rw--w-	Leitura e gravação para o dono, leitura e gravação para o grupo e gravação para outros
chmod	663	-rw-rw--w-x	Leitura e gravação para o dono, leitura e gravação para o grupo e leitura e execução para outros
chmod	664	-rw-rw-r--	Leitura e gravação para o dono, leitura e gravação para o grupo e leitura para outros
chmod	700	-rwx------	Leitura gravação e execução para o dono e nada para os demais
chmod	770	-rwxrwx---	Leitura e gravação e execução para o dono, leitura gravação e execução para o grupo e nada para outros
chmod	777	-rwxrwxrwx	Permissão total para dono, grupo e outros
```

- Ajustando permissoes de arquivos
```console
chmod - change file mode bits
chown - change file owner and group
--
touch 'meu_arquivo' /opt/treinamento/meu_arquivo.txt
chmod 400 /opt/treinamento/meu_arquivo.txt
ls -l /opt/treinamento/meu_arquivo.txt

chown root:root /opt/treinamento/meu_arquivo.txt
chown ubuntu:root /treinamento/meu_arquivo.txt
ls -l /opt/treinamento/meu_arquivo.txt
```

- Localizando um arquivo
```console
updatedb  - update a database for mlocate
find      - search for files in a directory hierarchy
locate    - find files by name
-- exemplos
locate meu_arquivo.txt
find  /opt/treinamento/
find . -type f -name "*.txt"

ref: https://www.tecmint.com/35-practical-examples-of-linux-find-command/
```

- Manipulador de arquivos
```console
vim   - Vi IMproved, a programmer's text editor
nano  - Nano's ANOther editor, an enhanced free Pico clone
gedit - text editor for the GNOME Desktop
```
