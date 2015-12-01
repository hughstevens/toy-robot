FROM ruby:2.3.0-slim
MAINTAINER Hugh Stevens

WORKDIR /toy-robot-ruby

COPY Gemfile* ./

RUN bundle install

ADD . .

CMD ["bin/toy-robot"]
