FROM php:8.2-fpm

# Установить зависимости
RUN apt-get update && apt-get install -y \
    libicu-dev \
    libpq-dev \
    unzip \
    git \
    libtool \
    autoconf \
    build-essential \
    && docker-php-ext-install \
    intl \
    pdo_mysql \
    opcache \
    && pecl install redis \
    && docker-php-ext-enable redis

# Установить Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Установить Symfony CLI
RUN curl -sS https://get.symfony.com/cli/installer | bash && \
    mv /root/.symfony*/bin/symfony /usr/local/bin/symfony

# Установить рабочую директорию
WORKDIR /var/www/html

# Копировать проект внутрь контейнера
COPY ./src/php/ /var/www/html

# Установить зависимости проекта через Composer
RUN composer update --ignore-platform-reqs

# Установить права для веб-сервера
RUN chown -R www-data:www-data /var/www/html && chmod -R 775 /var/www/html/var

# Открыть порт PHP-FPM
EXPOSE 9000

# Запустить PHP-FPM
CMD ["php-fpm"]
