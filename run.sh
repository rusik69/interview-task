#!/bin/sh
set -xe
cd terraform
./terraform init
./terraform apply -auto-approve
cd ../ansible
./ansible-playbook ./wordpress.yml -i inventory.gcp.yml --vault-pass ./vault_pass
./ansible-playbook ./blue.yml -i inventory.gcp.yml
./ansible-playbook ./blue.yml -i inventory.gcp.yml -e 'blue_replicas=3'
./ansible-playbook ./blue.yml -i inventory.gcp.yml -e 'blue_replicas=3' -e 'blue_index=index-green.html'
cd ..