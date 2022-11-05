cd /home/ubuntu/kubernetes-starterkit
echo $(pwd)
git pull
sudo systemctl restart $1
