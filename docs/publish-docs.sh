#!/usr/bin/env bash

set -ex

if [[ -d .vercel ]]; then
  rm -r .vercel
fi

# ls
# pwd
# ls ../
# pwd 
# ls ../../

CONFIG_FILE=vercel.json

# cat "vercel.json"
# cat vercel.json
# cat > vercel.json
# cat > vercel.json <<EOF

PROJECT_NAME=solana-program-library

PRODUCTION=
if [[ -n "$CI" ]]; then
  PRODUCTION=--prod
fi

cat > "$CONFIG_FILE" <<EOF
{
  "name": "$PROJECT_NAME",
  "scope": "naveenmishra1197"
}
EOF

# touch .env.production
# echo VERCEL_TOKEN = "$VERCEL_TOKEN" > .env.production
 VERCEL_TOKEN="2bwWlTgeTGvo63xZViVa2XhI"

[[ -n $VERCEL_TOKEN ]] || {
  echo "VERCEL_TOKEN is undefined.  Needed for Vercel authentication."
  exit 1
}
vercel deploy . --local-config="$CONFIG_FILE" --confirm --token "$VERCEL_TOKEN" "$PRODUCTION"
