FROM ruby:2.3.7

WORKDIR  /app

COPY . /app

RUN apt-get update -qq && apt-get -y upgrade && apt-get -y dist-upgrade && apt-get install -y build-essential

# for a JS runtime
RUN apt-get install -y nodejs

RUN apt-get install -y vim
RUN gem update bundler
RUN bundle install --path vendor/bundle
EXPOSE 3000

