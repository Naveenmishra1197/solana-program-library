#!/usr/bin/env bash
set -ex

cd "$(dirname "$0")"

# shellcheck source=ci/env.sh
source ../ci/env.sh

yarn global add docusaurus-init 
ls
#npm install --global docusaurus-init
cd docusaurus/
ls
docusaurus-init

ls
#mv docs-examples-from-docusaurus docs

#cd ./website
#yarn start

#Launching the server behind a proxy
#SET NO_PROXY=localhost
#npm run start
ls ../
ls ../../
# checking the current versiona and updating the docusaurus from the website directory
cd ./website
ls

cd ../../
yarn outdated docusaurus
#npm outdated docusaurus
yarn upgrade docusaurus --latest
#npm update docusaurus
ls

yarn install
# Build from /src into /build
yarn build
#npm run build
ls

# Publish only from merge commits and release tags
if [[ -n $CI ]]; then
  echo "cheking the CI is not null or not"
  if [[ -z $CI_PULL_REQUEST ]]; then
    echo "checking the CI_PULL_REQUEST value is zero or not"
    publish-docs.sh
  fi
fi
