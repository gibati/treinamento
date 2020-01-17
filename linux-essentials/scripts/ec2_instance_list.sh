#!/bin/bash
# Gilberto A Lima- gilberto.lima@gibati.com.br
#
# List ec2 instances IP using instance tag as a filter.

ec2_tag_filter="treinamento"

for i in \
  $(aws ec2 describe-instances --filters "Name=tag:Name,Values=$ec2_tag_filter" | jq -r '.Reservations[].Instances[].PrivateIpAddress'); do
  echo "Ec2 IpAddress: "$i"";
done
