#!/bin/bash

REGISTRY=${REGISTRY:-gcr.io}
PROJECT=${PROJECT:-authzen-457117}
IMAGE=${IMAGE:-authzen-dex}
VERSION=${VERSION:-latest}

# submit the build to google cloud build and tag the image with the version
gcloud builds submit --tag $REGISTRY/$PROJECT/$IMAGE:$VERSION
