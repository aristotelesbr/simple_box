FROM ruby:2.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libsqlite3-dev sqlite3

RUN mkdir /simple_box

WORKDIR /simple_box

ADD Gemfile /simple_box/Gemfile
ADD Gemfile.lock /simple_box/Gemfile.lock

RUN bundle install
ADD . /simple_box