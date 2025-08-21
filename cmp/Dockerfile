# Dockerfile for cmp image
# Base image
FROM alpine:3.20

ENV HELMFILE_VERSION=1.1.5
ENV HELM_VERSION=3.16.2

# Install essential tools: curl, yq, git, helmfile, helm (arch-aware)
RUN apk add --no-cache \
    curl \
    git \
    yq \
    bash \
    && ARCH=$(uname -m) \
    && if [ "$ARCH" = "x86_64" ]; then ARCH=amd64; elif [ "$ARCH" = "aarch64" ]; then ARCH=arm64; else echo "Unsupported arch: $ARCH" && exit 1; fi \
    && curl -L "https://github.com/helmfile/helmfile/releases/download/v${HELMFILE_VERSION}/helmfile_${HELMFILE_VERSION}_linux_${ARCH}.tar.gz" -o /tmp/helmfile.tar.gz \
    && mkdir -p /tmp/helmfile \
    && tar -xvf /tmp/helmfile.tar.gz -C /tmp/helmfile \
    && mv /tmp/helmfile/helmfile /usr/local/bin/ \
    && rm -rf /tmp/helmfile.tar.gz /tmp/helmfile \
    && chmod +x /usr/local/bin/helmfile \
    && curl -L "https://get.helm.sh/helm-v${HELM_VERSION}-linux-${ARCH}.tar.gz" -o /tmp/helm.tar.gz \
    && mkdir -p /tmp/helm \
    && tar -xvf /tmp/helm.tar.gz -C /tmp/helm \
    && mv /tmp/helm/linux-${ARCH}/helm /usr/local/bin/ \
    && rm -rf /tmp/helm.tar.gz /tmp/helm \
    && chmod +x /usr/local/bin/helm

# Set default shell
CMD ["bash"]
