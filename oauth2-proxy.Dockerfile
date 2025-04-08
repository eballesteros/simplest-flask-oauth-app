FROM quay.io/oauth2-proxy/oauth2-proxy:v7.5.1

# Default command - will be overridden by environment variables
ENTRYPOINT ["/bin/oauth2-proxy"]
CMD ["--http-address=0.0.0.0:10000"]