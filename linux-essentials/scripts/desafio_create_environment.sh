#!/bin/bash
# Gilberto A Lima- gilberto.lima@gibati.com.br
#
# create environment for learning exercises

ec2_tag_filter="treinamento"
aws_credentials="/opt/chaves/AWS_Keypairs/treinamento_linux.pem"
ssh_parametros="-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
for ips in \
  $(aws ec2 describe-instances --filters "Name=tag:Name,Values=$ec2_tag_filter" | jq -r '.Reservations[].Instances[].PrivateIpAddress'); do
  echo "Ec2 IpAddress: "$ips"";
  for i in $ips; do
    ssh -i $aws_credentials $ssh_parametros ubuntu@$i -C "sudo dd if=/dev/zero of=/arquivo_gigante.log bs=1M count=3500 & " 2>/dev/null
    ssh -i $aws_credentials $ssh_parametros ubuntu@$i -C "sudo mkdir -p /opt/desafio/1" 2>/dev/null
    ssh -i $aws_credentials $ssh_parametros ubuntu@$i -C "sudo touch /opt/desafio/1/.ME-ACHOU.log" 2>/dev/null
    echo "----------------------------"
  done
done