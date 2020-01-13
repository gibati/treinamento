#!/bin/bash
# Gilberto A Lima- gilberto.lima@gibati.com.br
#
# Terminate ec2 instances using instance tag as a filter.

ec2_tag_filter="treinamento"

for i in \
  $(aws ec2 describe-instances --filters "Name=tag:Name,Values=$ec2_tag_filter" | jq -r '.Reservations[].Instances[].InstanceId'); do
  echo "Terminate instanceID: "$i"";
  aws ec2 terminate-instances --instance-ids "$i"
done
