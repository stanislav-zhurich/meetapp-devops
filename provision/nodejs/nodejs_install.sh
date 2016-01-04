echo installing node.js 5.3
sudo apt-get install git
sudo chmod -R 777 /usr/lib/node_modules
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential
npm install pm2 -g
