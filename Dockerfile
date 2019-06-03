FROM ruby:2.3.7

WORKDIR  /app

COPY . /app

#RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list
RUN apt-get update -qq && apt-get -y upgrade && apt-get -y dist-upgrade && apt-get install -y build-essential

# for a JS runtime
RUN apt-get install -y nodejs

RUN apt-get install -y vim
RUN gem update bundler
RUN bundle install --path vendor/bundle
EXPOSE 3000

