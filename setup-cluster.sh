#!/usr/bin/env bash

# This script has been tested from within a Cloud Shell CLI.

export PROJECT_ID=`gcloud config get-value project` && \
export M_TYPE="e2-standard-2" && \
export ZONE=us-central1-c && \
export CLUSTER_NAME=${PROJECT_ID}-${RANDOM} && \
gcloud services enable container.googleapis.com && \
gcloud container clusters create $CLUSTER_NAME \
  --cluster-version latest \
  --machine-type=$M_TYPE \
  --num-nodes 3 \
  --zone $ZONE --node-locations $ZONE \
  --project $PROJECT_ID \
  --no-enable-basic-auth \
  --cluster-version "1.20.6-gke.1400" \
  --release-channel "rapid" \
  --disk-type "pd-standard" --disk-size "100" \
  --metadata disable-legacy-endpoints=true \
  --enable-stackdriver-kubernetes --enable-ip-alias \
  --enable-dataplane-v2 \
  --addons HorizontalPodAutoscaling,HttpLoadBalancing,GcePersistentDiskCsiDriver \
  --enable-autoupgrade --enable-autorepair --max-surge-upgrade 1 --max-unavailable-upgrade 0 \
  --workload-pool "${PROJECT_ID}.svc.id.goog" \
  --enable-shielded-nodes \
  --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append"
