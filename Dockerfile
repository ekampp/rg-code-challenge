FROM ruby:3.0.3

WORKDIR "code-challenge"

COPY . .

RUN bundle install

ENTRYPOINT "bin/test"
