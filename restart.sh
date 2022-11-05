cd /home/ubuntu/kubernetes-starterkit
echo $(pwd) >> $GITHUB_OUTPUT
sudo git pull
sudo systemctl restart $1
