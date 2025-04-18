#!/bin/bash

REGISTRY=${REGISTRY:-gcr.io}
PROJECT=${PROJECT:-authzen-457117}
IMAGE=${IMAGE:-authzen-dex}
SERVICE=${SERVICE:-authzen-dex}
VERSION=${VERSION:-latest}

gcloud run deploy $SERVICE \
  --image $REGISTRY/$PROJECT/$IMAGE:$VERSION \
  --platform managed --allow-unauthenticated \
  --region us-central1