FROM ogazitt/dex-test:latest

COPY config.tpl /etc/dex/config.tpl

# HTTP
EXPOSE 5556

# gRPC
EXPOSE 5557

# Telemetry
EXPOSE 5558

# Environment variables

# +=======================|=====================================+
# | Variable              |  Default Value                      |
# |=======================|=====================================|
# | DEX_LOG_LEVEL         | info                                |
# |-----------------------|-------------------------------------|
# | CITADEL_ISSUER        | https://citadel.demo.aserto.com/dex |
# |-----------------------|-------------------------------------|
# | CITADEL_CLIENT_ID     | citadel-app                         |
# |-----------------------|-------------------------------------|
# | CITADEL_CLIENT_NAME   | citadel idp                         |
# |-----------------------|-------------------------------------|
# | CITADEL_CLIENT_SECRET | <random alpha-numeric string>       |
# |-----------------------|-------------------------------------|
# | CITADEL_REDIRECT_URIS | <none>                              |
# +-----------------------|-------------------------------------+

# CITADEL_REDIRECT_URIS is a JSON array. For example:
#   CITADEL_REDIRECT_URIS='["https://*.my-domain.com", "https://citadel.example.com"]'

ENTRYPOINT ["/entrypoint.sh"]
CMD ["dex", "serve", "/etc/dex/config.tpl"]
