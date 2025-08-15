якшо не відкриті порти 
sudo ufw allow 7100/tcp
sudo ufw allow 7101/tcp

перед запуком в папці де докер компоуз
mkdir -p ./data
chmod +x init.sh
docker compose up -d


бекап
sudo docker compose stop mssql
sudo mkdir -p backups
sudo tar -czf backups/mssql-volume_$(date +%Y%m%d_%H%M%S).tar.gz -C ./data .
sudo docker compose start mssql

рестор
sudo docker compose stop mssql
sudo rm -rf ./data/*
sudo tar -xzf backups/mssql-volume_YYYYmmdd_HHMMSS.tar.gz -C ./data
sudo chown -R 10001:0 ./data
sudo chmod -R 770 ./data
sudo docker compose start mssql

