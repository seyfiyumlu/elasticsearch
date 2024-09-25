* Kurulum adımları:

1. **Network oluşturulacak.**

    `docker network create elasticsearch-net --scope external`

    bu adım her node da çalışacak.

2. **docker compose up -d**

    her makinede app01,app02 gibi uygun klasördeki docker compose dosyası çalıştır.

    `docker compose up -d`

