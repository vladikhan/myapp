FROM ruby:3.1.4

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

RUN gem install bundler -v 2.6.9

WORKDIR /myapp

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0"]
