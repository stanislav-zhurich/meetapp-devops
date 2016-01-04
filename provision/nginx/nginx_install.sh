echo installing nginx server
sudo apt-get install nginx -y
sudo chmod -R 777 /usr/share/nginx/
sudo chmod -R 777 /var/log/nginx
sudo chmod -R 777 /etc/nginx

echo copying nginx.conf file to /etc/nginx
cp --backup /vagrant/provision/nginx/conf/nginx.conf /etc/nginx
cp /vagrant/provision/nginx/conf/node.conf /etc/nginx/sites-enabled/
sudo service nginx stop start