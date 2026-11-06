# Demo workload image for the live CI job (.github/workflows/live.yml). busybox = shell + nc + httpd.
FROM busybox:1.38.0@sha256:a46257e06c82ad85242d0d38077d0a52d9896389ca60a1a59d3463db586e5fa4
ARG REVISION=unknown
# per-run nonce: every live run gets its own digest, so each run reads its own Fulcio certificate
ARG NONCE=none
ARG DESCRIPTION="STRATUM live-CI demo workload (lab only)"
LABEL org.opencontainers.image.source="https://github.com/rakshit-737/stratum-cloud-security" \
      org.opencontainers.image.revision="${REVISION}" \
      org.opencontainers.image.version="${NONCE}" \
      org.opencontainers.image.description="${DESCRIPTION}"
USER 65534:65534
CMD ["sleep", "infinity"]
