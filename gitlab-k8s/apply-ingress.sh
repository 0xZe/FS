#!/bin/bash

MAX_RETRIES=30
RETRY_INTERVAL=20
INGRESS_NAMES=("php-ingress" "flask-ingress")

# Loop to apply the Ingress resources and wait for their creation
for ((i=1; i<=MAX_RETRIES; i++)); do
    # Apply the Ingress resources using kubectl apply
    kubectl apply -f php-ingress.yml
    kubectl apply -f flask-ingress.yml
    
    # Wait for the specified interval before checking Ingress existence
    sleep $RETRY_INTERVAL

    # Check if all Ingress resources exist
    all_ingresses_exist=true
    for ingress_name in "${INGRESS_NAMES[@]}"; do
        kubectl get ingress $ingress_name >/dev/null 2>&1 || all_ingresses_exist=false
    done
    
    # Break out of the loop if all Ingress resources exist
    $all_ingresses_exist && break
done
