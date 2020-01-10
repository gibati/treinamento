#!/bin/bash
# Gilberto A Lima- gilberto.lima@gibati.com.br
#
# create ec2 instances by aws api

image_id="ami-02c8813f1ea04d4ab" #default AMI LinuxUbuntu
instance_type="t2.micro"
key_name="treinamento_linux"
count="$1"
security_group_ids="$2"
subnet_id="$3"

aws ec2 run-instances \
  --image-id "$image_id" \
  --count "$count" \
  --instance-type "$instance_type" \
  --key-name "$key_name" \
  --security-group-ids "$security_group_ids" \
  --subnet-id "$subnet_id" \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=treinamento}]'