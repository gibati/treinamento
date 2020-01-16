#!/bin/bash
# Gilberto A Lima- gilberto.lima@gibati.com.br
#
# Validate learning exercises

cod_fail="\033[05;31m [FAIL] \033[00;37m"
cod_ok="\033[05;32m [OK]  \033[00;37m"
dir_desafio="/opt/desafio/1"
user1="maria"
user2="jose"
file_1="user1.conf"
file_2="user2.conf"
file_3="tux.html"

# Exercicio1
if [ -d $dir_desafio ]; then
  echo -e "Exercício 1-$cod_ok"
else
  echo -e "Exercício 1-$cod_fail"
fi 

# Exercicio2
if [ -e $dir_desafio/$file_1 ] && [ -e $dir_desafio/$file_2 ]; then
    echo -e "Exercício 2-$cod_ok"
else
  echo -e "Exercício 2-$cod_fail"
fi 

# Exercicio3
if [ $(grep $user1 $dir_desafio/$file_1 2>/dev/null) ] && [ $(grep $user2 $dir_desafio/$file_2 2>/dev/null) ]; then
  echo -e "Exercício 3-$cod_ok"
else
  echo -e "Exercício 3-$cod_fail"
fi

# Exercicio4
id $user1 >/dev/null 2>&1
return_1=$(echo $?)
id $user2 >/dev/null 2>&1
return_2=$(echo $?)
if [ $return_1 = 0 ] && [ $return_2 = 0 ]; then
  return_permission_1=$(find $dir_desafio -user $user1 -name $file_1 | wc -l)
  return_permission_2=$(find $dir_desafio -user $user2 -name $file_2 | wc -l)
  if [ $return_permission_1 = 1 ] && [ $return_permission_2 = 1 ]; then
    echo -e "Exercício 4-$cod_ok"
  else
    echo -e "Exercício 4-$cod_fail"
  fi
else
  echo -e "Exercício aqui4-$cod_fail"
fi

# Exercicio5
ip_fqdn_1="$(host $user1.desafio1.com.br | head -1| awk '{print $4}')"
ip_fqdn_2="$(host $user2.desafio1.com.br | head -1| awk '{print $4}')"

if [ "$ip_fqdn_1" = '8.8.8.8' ] && [ "$ip_fqdn_2" = '8.8.4.4' ]; then
  echo -e "Exercício 5-$cod_ok"
else
  echo -e "Exercício 5-$cod_fail"
fi

# Exercicio6
if [ -e /usr/games/cowsay ] && [ -s $dir_desafio/$file_3 ]; then
  echo -e "Exercício 6-$cod_ok"
else
  echo -e "Exercício 6-$cod_fail"
fi

# Exercicio7
return_file_permission=$(find $dir_desafio -type f -perm 0765 -name "*.conf" -print | wc -l)
if [ $return_file_permission = '2' ];then
  echo -e "Exercício 7-$cod_ok"
else
  echo -e "Exercício 7-$cod_fail"
fi
