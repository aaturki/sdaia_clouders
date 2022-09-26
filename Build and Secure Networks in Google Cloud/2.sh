#!/bin/bash
# gcloud auth revoke --all

# while [[ -z "$(gcloud config get-value core/account)" ]]; 
# do echo "waiting login" && sleep 2; 
# done

# while [[ -z "$(gcloud config get-value project)" ]]; 
# do echo "waiting project" && sleep 2; 
# done


gcloud compute firewall-rules create "allow-ssh-from-iap" --network=acme-vpc --target-tags=bastion --allow=tcp:22 --source-ranges="35.235.240.0/20" --description="Narrowing SSH traffic"

gcloud compute firewall-rules create "allow-http-juice-shop" --network=acme-vpc --target-tags=juice-shop --allow=tcp:80 --source-ranges="0.0.0.0/0" --description="Narrowing HTTP traffic"

gcloud compute firewall-rules create "allow-ssh-mgmt-subnet" --network=acme-vpc --target-tags=juice-shop --allow=tcp:22 --source-ranges="192.168.10.0/24" --description="Narrowing SSH traffic"
