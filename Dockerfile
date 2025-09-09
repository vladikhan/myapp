FROM ruby:3.1.4

# Устанавливаем системные пакеты, PostgreSQL клиент и Git
RUN apt-get update -qq && apt-get install -y \
    curl \
    build-essential \
    libpq-dev \
    postgresql-client \
    git \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем Node.js 20.x
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

# Включаем Corepack и активируем стабильную версию Yarn 1.x
RUN corepack enable \
    && corepack prepare yarn@1.22.22 --activate

# Устанавливаем bundler
RUN gem install bundler -v 2.6.9

# Создаём рабочую директорию
WORKDIR /myapp

# Копируем Gemfile и устанавливаем Ruby зависимости
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Копируем весь проект
COPY . .

# Настройка переменной окружения для Node/OpenSSL (нужно для некоторых сборок Webpacker)
ENV NODE_OPTIONS=--openssl-legacy-provider

# Открываем порт 3000
EXPOSE 3000

# Запуск сервера Rails
CMD ["bin/rails", "server", "-b", "0.0.0.0"]