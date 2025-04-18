# AuthZEN-dex

This is the IDP that the AuthZEN todo app (todo.authzen-interop.net) uses to log in users.

## Building image on Google Cloud Build

./build-gcp.sh

## Deploying on Google Cloud Run

./deploy-gcp.sh

## Required environment variables

CITADEL_ISSUER=https://citadel.authzen-interop.net/dex	
CITADEL_CLIENT_ID=citadel-app	
CITADEL_CLIENT_NAME=citadel idp	
CITADEL_CLIENT_SECRET=<redacted>
CITADEL_REDIRECT_URIS=[ "https://*.authzen-interop.net", "https://*.netlify.app", "https://*.netlify.app/callback", "https://*.netlify.app/api/auth/callback/citadel", "http://localhost:3000", "http://localhost:3000/callback", "http://localhost:3000/api/auth/callback/citadel" ]
