#!/usr/bin/env bash
set -ex

cd "$(dirname "$0")"

# shellcheck source=ci/env.sh
source ../ci/env.sh

npm install --global docusaurus-init
cd docusaurus/
docusaurus-init

#Launching the server behind a proxy
SET NO_PROXY=localhost
npm run start

# checking the current versiona and updating the docusaurus from the website directory
source website
npm outdated docusaurus
npm update docusaurus


# Build from /src into /build
npm run build

# Publish only from merge commits and release tags
if [[ -n $CI ]]; then
  if [[ -z $CI_PULL_REQUEST ]]; then
    ./publish-docs.sh
  fi
fi
