FROM ruby:3.1.4

# Устанавливаем системные пакеты и PostgreSQL клиент
RUN apt-get update -qq && apt-get install -y \
    curl \
    build-essential \
    libpq-dev \
    postgresql-client \
    git \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем Node 20.x
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

# Включаем Corepack и активируем стабильную версию Yarn 1.x
RUN corepack enable \
    && corepack prepare yarn@1.22.22 --activate

# Устанавливаем bundler
RUN gem install bundler -v 2.6.9

# Устанавливаем рабочую директорию
WORKDIR /myapp

# Копируем Gemfile и устанавливаем зависимости
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Копируем весь проект
COPY . .

# Настраиваем переменную окружения для Node/OpenSSL
ENV NODE_OPTIONS=--openssl-legacy-provider

# Открываем порт
EXPOSE 3000

# Старт приложения
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
