#!/usr/bin/env bash

set -ex

if [[ -d .vercel ]]; then
  rm -r .vercel
fi

CONFIG_FILE=vercel.json
PROJECT_NAME=spl-solana-com

PRODUCTION=
if [[ -n "$CI" ]]; then
  PRODUCTION=--prod
fi

cat > "$CONFIG_FILE" <<EOF
{
  "name": "$PROJECT_NAME",
  "scope": "z7B4LtYffgV7XCfyxInOxXF9"
}
EOF

VERCEL_TOKEN=4HNlwSeLbkZCdHh9c9vp7FBv

[[ -n $VERCEL_TOKEN ]] || {
  echo "VERCEL_TOKEN is undefined.  Needed for Vercel authentication."
   exit 1
}

vercel deploy . --local-config="$CONFIG_FILE" --confirm --token "$VERCEL_TOKEN" "$PRODUCTION"
