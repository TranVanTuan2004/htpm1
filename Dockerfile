# Sử dụng PHP 8.1 với Apache
FROM php:8.1-apache

# Cài đặt MySQLi và các extension cần thiết
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Cài đặt các phần mềm hỗ trợ khác nếu cần (ví dụ: curl, zip, v.v.)
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd

# Copy mã nguồn vào container (nếu cần)
COPY . /var/www/html

# Kích hoạt mod_rewrite (nếu cần cho Laravel hoặc các ứng dụng PHP)
RUN a2enmod rewrite