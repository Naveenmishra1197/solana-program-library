# |source| this file

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

# To install the Yarn package manager, run:
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn

sudo apt-get install gcc g++ make

# #adding the docusaurus as env variable
# yarn global add docusaurus-init
# #npm install --global docusaurus-init
# docusaurus-init
yarn install

#update the docusaurus file
# yarn upgrade docusaurus --latest
#npm update docusaurus


yarn global add vercel
#npm install --global vercel
