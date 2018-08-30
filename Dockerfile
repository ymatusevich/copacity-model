FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs cmake vim curl
RUN apt-get install -y mysql-client  mysql-server
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN apt-get install nodejs

RUN mkdir /copacity-model
RUN gem install bundler
