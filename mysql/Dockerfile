# Use uma imagem base oficial do MySQL
FROM mysql:8.0

# Defina variáveis de ambiente para configurar o MySQL
ENV MYSQL_DATABASE=tlp \
    MYSQL_USER=tlp \
    MYSQL_PASSWORD=tlp \
    MYSQL_ROOT_PASSWORD=roottlp

# Copia o script de inicialização para dentro do contêiner
COPY ./init-db.sql /docker-entrypoint-initdb.d/

# O MySQL será iniciado automaticamente com as configurações acima
