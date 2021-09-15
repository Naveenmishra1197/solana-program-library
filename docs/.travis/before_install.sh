# |source| this file

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install gcc g++ make

npm install --global docusaurus-init
docusaurus-init
yarn install
yarn upgrade docusaurus --latest

npm install --global vercel
