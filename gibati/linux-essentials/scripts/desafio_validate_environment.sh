#!/bin/bash
# Gilberto A Lima- gilberto.lima@gibati.com.br
#
# Validate learning exercises

cod_fail="\033[05;31m [FAIL] \033[00;37m"
cod_ok="\033[05;32m [OK]  \033[00;37m"
dir_desafio="/opt/desafio/1"
file_1="user1.conf"
file_2="user2.conf"

# Exercicio1
if [ -d $dir_desafio ]; then
  echo -e "Exercício 1-$cod_ok"
else
  echo -e "Exercício 1-$cod_fail"
fi 

# Exercicio2
if [ -e $file_1 ] && [ -e $file_2 ]; then
    echo -e "Exercício 2-$cod_ok"
else
  echo -e "Exercício 2-$cod_fail"
fi 

# Exercicio3
if [ $(grep maria $dir_desafio/$file_1 >/dev/null) ] && [ $(grep jose $dir_desafio/$file_2 >/dev/null) ]; then
  echo -e "Exercício 3-$cod_ok"
else
  echo -e "Exercício 3-$cod_fail"
fi