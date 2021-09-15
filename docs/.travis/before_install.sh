# |source| this file

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install gcc g++ make

#adding the docusaurus as env variable
yarn global add docusaurus-init
#npm install --global docusaurus-init
docusaurus-init
yarn install

#update the docusaurus file
yarn upgrade docusaurus --latest
#npm update docusaurus


yarn global add vercel
#npm install --global vercel
