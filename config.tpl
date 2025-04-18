---
logger:
  level: {{ getenv "DEX_LOG_LEVEL" "info" }}

issuer: {{ getenv "CITADEL_ISSUER" "https://citadel.demo.aserto.com/dex" }}

storage:
  type: sqlite3
  config:
    file: /var/dex/dex.db

web:
  http: 0.0.0.0:5556
  allowedOrigins: ["*"]

grpc:
  addr: 0.0.0.0:5557

telemetry:
  http: 0.0.0.0:5558

oauth2:
  skipApprovalScreen: true
  passwordConnector: local
  responseTypes:
    - code
    - token
    - id_token

enablePasswordDB: true
staticPasswords:
  - email: rick@the-citadel.com
    hash: $2a$10$6rEO1VdZY/rOYUEupQUzde3UGwZ4z6BgYuLP8qe1ukAMjrwA5.7rm
    userID: fd0614d3-c39a-4781-b7bd-8b96f5a5100d
    username: rick
  - email: morty@the-citadel.com
    hash: $2a$10$dzoH5ZGxYMCZJVNAIfH9xOc6Pqc7Ep2poAn6C1HXolX6jBzcxWkS.
    userID: fd1614d3-c39a-4781-b7bd-8b96f5a5100d
    username: morty
  - email: summer@the-smiths.com
    hash: $2a$10$S5uOrRc3R/MVRb/ygaHA9evNrw7T7aBa3sGG90LxtvEw58wXuJRre
    userID: fd2614d3-c39a-4781-b7bd-8b96f5a5100d
    username: summer
  - email: beth@the-smiths.com
    hash: $2a$10$Y0YNNDZlPK4DA1XshWYt5.R1jlHTNiD0xsoGIeLyrTvVPAPI6pPNe
    userID: fd3614d3-c39a-4781-b7bd-8b96f5a5100d
    username: beth
  - email: jerry@the-smiths.com
    hash: $2a$10$dWPBVIlzP/WLH4lrl7X07.5JwQqckcz.1yN6f5NSMzzs3wKu8Bu6u
    userID: fd4614d3-c39a-4781-b7bd-8b96f5a5100d
    username: jerry

staticClients:
  - id: {{ getenv "CITADEL_CLIENT_ID" "citadel-app" }}
    name: {{ getenv "CITADEL_CLIENT_NAME" "citadel idp" }}
    secret: {{ getenv "CITADEL_CLIENT_SECRET" (random.AlphaNum 15) }}
    redirectURIs:
      - https://0.0.0.0:5555/callback
      - http://127.0.0.1:3000/callback
      - http://127.0.0.1:3000/api/auth/callback/citadel
      - http://127.0.0.1:3000
      - http://127.0.0.1:5555/callback
      - http://localhost:3000
      - http://localhost:3000/callback
      - http://localhost:3000/api/auth/callback/citadel
      - https://*.netlify.app
      - https://*.netlify.app/callback
      - https://*.netlify.app/api/auth/callback/citadel
      - https://todo.demo.aserto.com
      - https://todo.demo.aserto.com/callback
      - https://todo.demo.aserto.com/api/auth/callback/citadel
      - https://*.authzen-interop.net
{{- if getenv "CITADEL_REDIRECT_URIS" }}
{{ getenv "CITADEL_REDIRECT_URIS" | jsonArray | toYAML | indent 6 }}
{{- end }}
