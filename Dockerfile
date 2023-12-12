FROM ruby:3.2.2

RUN apt-get update -qq
WORKDIR /app
EXPOSE 3000

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY . /app

CMD ["bundle", "exec", "rails", "server"]