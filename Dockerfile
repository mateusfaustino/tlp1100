# Usar a imagem oficial do PHP 8.2 com extensões necessárias
FROM php:8.2-fpm

# Definir o diretório de trabalho
WORKDIR /var/www

# Instalar dependências necessárias
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

# Instalar o Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copiar a pasta src para o container
COPY ./src /var/www/src

# Instalar dependências do Laravel
RUN cd /var/www/src && composer install

# Definir as permissões corretas para as pastas storage e bootstrap/cache
RUN chown -R www-data:www-data /var/www/src/storage /var/www/src/bootstrap/cache
RUN chmod -R 775 /var/www/src/storage /var/www/src/bootstrap/cache

# Expor a porta necessária para o Nginx
EXPOSE 9000

# Comando para iniciar o PHP-FPM
CMD ["php-fpm"]
