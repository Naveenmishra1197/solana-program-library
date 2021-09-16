#!/usr/bin/env bash
set -ex

cd "$(dirname "$0")"

# shellcheck source=ci/env.sh
source ../ci/env.sh

yarn global add docusaurus-init
#npm install --global docusaurus-init
cd docusaurus/
docusaurus-init

ls
mv docs-examples-from-docusaurus docs

#cd ./website
#yarn start

#Launching the server behind a proxy
#SET NO_PROXY=localhost
#npm run start

# checking the current versiona and updating the docusaurus from the website directory
cd ../../website/
yarn outdated docusaurus
#npm outdated docusaurus
yarn upgrade docusaurus --latest
#npm update docusaurus

yarn install
# Build from /src into /build
yarn build
#npm run build

# Publish only from merge commits and release tags
if [[ -n $CI ]]; then
  if [[ -z $CI_PULL_REQUEST ]]; then
    ../publish-docs.sh
  fi
fi
