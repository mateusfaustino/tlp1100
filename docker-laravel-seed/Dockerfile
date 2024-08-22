# Use a imagem oficial do PHP 8.2
FROM php:8.2-cli

# Defina o diretório de trabalho
WORKDIR /var/www

# Instale dependências necessárias
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Instale o Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Use o Composer para criar um novo projeto Laravel na pasta src
CMD ["composer", "create-project", "--prefer-dist", "laravel/laravel", "src"]