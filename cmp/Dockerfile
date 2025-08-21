# Dockerfile for cmp image
# Base image
FROM alpine:3.20


# Install essential tools: curl, yq, git, helmfile (arch-aware)
RUN apk add --no-cache \
	curl \
	git \
	yq \
	bash \
	&& ARCH=$(uname -m) \
	&& if [ "$ARCH" = "x86_64" ]; then ARCH=amd64; elif [ "$ARCH" = "aarch64" ]; then ARCH=arm64; else echo "Unsupported arch: $ARCH" && exit 1; fi \
	&& curl -L "https://github.com/helmfile/helmfile/releases/latest/download/helmfile_linux_${ARCH}" -o /usr/local/bin/helmfile \
	&& chmod +x /usr/local/bin/helmfile

# Set default shell
SHELL ["/bin/bash", "-c"]

CMD ["bash"]
