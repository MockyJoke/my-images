# Dockerfile for cmp image
# Base image
FROM alpine:3.20

ENV HELMFILE_VERSION=1.1.5

# Install essential tools: curl, yq, git, helmfile (arch-aware)
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
	&& chmod +x /usr/local/bin/helmfile

# Set default shell
CMD ["bash"]
