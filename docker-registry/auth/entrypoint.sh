#!/bin/sh

# htpasswd dosyasının izinlerini ayarlama
chown nginx:nginx /auth/htpasswd
chmod 640 /auth/htpasswd

# Nginx'i başlatma
nginx -g 'daemon off;'


#chmod +x auth/entrypoint.sh
#docker compose çalışacak makinede bu sh ın çalıştırılabilir olmasını sağla