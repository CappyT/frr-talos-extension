FROM scratch

# Copy the manifest
COPY manifest.yaml /

# Create the rootfs
WORKDIR /rootfs

# Copy FRR binaries from the official image
COPY --from=quay.io/frrouting/frr:10.4.1 /usr/lib/frr/fabricd usr/lib/frr/
COPY --from=quay.io/frrouting/frr:10.4.1 /usr/lib/frr/watchfrr usr/lib/frr/

# Copy FRR configuration
COPY daemons etc/frr/
COPY frr.conf etc/frr/
