#!/bin/sh

# Executar migrações
php artisan migrate

# Iniciar o PHP-FPM
php-fpm
