#!/bin/bash
# Gilberto A Lima- gilberto.lima@gibati.com.br
#
# Real-time follow-up exercises

ec2_tag_filter="treinamento"
aws_credentials="/opt/chaves/AWS_Keypairs/treinamento_linux.pem"
ssh_parametros="-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
for ips in \
  $(aws ec2 describe-instances --filters "Name=tag:Name,Values=$ec2_tag_filter" | jq -r '.Reservations[].Instances[].PrivateIpAddress'); do
  echo "Ec2 IpAddress: "$ips"";
  for i in $ips; do
    ssh -i $aws_credentials $ssh_parametros ubuntu@$i -C "mkdir -p /tmp/scripts" 2>/dev/null
    scp -i $aws_credentials $ssh_parametros desafio_validate_environment.sh ubuntu@$i:/tmp/scripts/ >/dev/null 2>/dev/null
    ssh -i $aws_credentials $ssh_parametros ubuntu@$i -C "/tmp/scripts/desafio_validate_environment.sh" 2>/dev/null
    echo "----------------------------"
  done
done
