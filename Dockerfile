FROM php:7.2-cli

LABEL maintainer "arata_takeuchi<arata_takeuchi@scala-com.jp>"

# パッケージ＋PHP拡張モジュールのインストール
RUN apt-get update && apt-get install -y \
        net-tools \
        procps \
        sysstat \
        less \
        vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install pdo_mysql

# php.iniをコピー
COPY php.ini /usr/local/etc/php/

CMD ["php", "-a"]
