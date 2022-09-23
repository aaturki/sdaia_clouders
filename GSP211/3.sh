#!/bin/bash

# while [[ -z "$(gcloud config get-value core/account)" ]]; 
# do echo "waiting login" && sleep 2; 
# done

# while [[ -z "$(gcloud config get-value project)" ]]; 
# do echo "waiting project" && sleep 2; 
# done

gcloud beta compute instances create managementnet-us-vm --zone=us-central1-c --machine-type=f1-micro --subnet=managementsubnet-us --network-tier=PREMIUM --maintenance-policy=MIGRATE  --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --image=debian-9-stretch-v20191210 --image-project=debian-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=managementnet-us-vm --reservation-affinity=any

gcloud compute instances create privatenet-us-vm --zone=us-central1-c --machine-type=n1-standard-1 --subnet=privatesubnet-us

gcloud beta compute instances create vm-appliance --zone=us-east1-c --machine-type=e2-standard-4 --network-interface subnet=privatesubnet-us --network-interface subnet=managementsubnet-us --network-interface subnet=mynetwork 

