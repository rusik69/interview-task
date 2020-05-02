#!/usr/bin/env bash
set -xe
cd terraform
./terraform init
./terraform apply -auto-approve
cd ../ansible
ansible-playbook -i inventory.gcp.yml ./wordpress.yml --vault-pass ./vault_pass  -e 'ansible_python_interpreter=/usr/bin/python3'
ansible-playbook -i inventory.gcp.yml ./blue.yml -e 'ansible_python_interpreter=/usr/bin/python3'
ansible-playbook -i inventory.gcp.yml ./blue.yml -e 'blue_replicas=3' -e 'ansible_python_interpreter=/usr/bin/python3'
ansible-playbook -i inventory.gcp.yml ./blue.yml -e 'blue_replicas=3' -e 'blue_index=index-green.html' -e 'ansible_python_interpreter=/usr/bin/python3'
cd ..