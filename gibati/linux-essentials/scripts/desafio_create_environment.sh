#!/bin/bash
# Gilberto A Lima- gilberto.lima@gibati.com.br
#
# create environment for learning exercises

dir_desafio="/opt/desafio/1"

# Cria arquivo gigante
dd if=/dev/zero of=/arquivo_gigante.log bs=1M count=5000

# Cria arquivo oculto
if [ -d $dir_desafio ]; then
  echo "Me achou, pode remover" > /opt/desafio/1/.ME-ACHOU.log
else
  echo "Diretorio $dir_desafio não criado na máquina"
fi