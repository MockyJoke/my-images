#!/bin/sh
# Usage: ./build-local.sh <image-dir> <tag>
# Example: ./build-local.sh cmp mytag

set -e

if [ $# -lt 1 ]; then
  echo "Usage: $0 <image-dir> [tag]"
  exit 1
fi

IMAGE_DIR="$1"
TAG="${2:-local}"

if [ ! -f "$IMAGE_DIR/Dockerfile" ]; then
  echo "Dockerfile not found in $IMAGE_DIR"
  exit 1
fi

USERNAME="${DOCKERHUB_USERNAME:-your-dockerhub-username}"

# Build the image

podman build -t "$USERNAME/$IMAGE_DIR:$TAG" "$IMAGE_DIR"

echo "Built $USERNAME/$IMAGE_DIR:$TAG"
