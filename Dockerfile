FROM ruby:3.1.4

# -------------------------
# Системные пакеты
# -------------------------
# Устанавливаем Chromium и Chromedriver
RUN apt-get update && apt-get install -y \
    chromium \
    chromium-driver \
    && rm -rf /var/lib/apt/lists/*

# -------------------------
# Node.js 20.x и Yarn
# -------------------------
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

RUN corepack enable \
    && corepack prepare yarn@1.22.22 --activate

# -------------------------
# Установка bundler
# -------------------------
RUN gem install bundler -v 2.6.9

# -------------------------
# Рабочая директория
# -------------------------
WORKDIR /myapp

# -------------------------
# Ruby зависимости
# -------------------------
COPY Gemfile* ./
RUN bundle install

# -------------------------
# Копируем проект
# -------------------------
COPY . .

RUN chmod +x /myapp/entrypoint.sh

ENTRYPOINT ["/myapp/entrypoint.sh"]

# -------------------------
# Переменные окружения
# -------------------------
ENV NODE_OPTIONS=--openssl-legacy-provider
ENV BROWSER=chromium-browser
ENV CHROMEDRIVER_PATH=/usr/lib/chromium-browser/chromedriver

# -------------------------
# Порт и запуск
# -------------------------
EXPOSE 3000
CMD ["bin/rails", "server", "-b", "0.0.0.0"]