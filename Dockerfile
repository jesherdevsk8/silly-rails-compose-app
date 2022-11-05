FROM ruby:3.1.2-slim

ENV LANG C.UTF-8
ENV TZ=America/Sao_Paulo
ENV APP_PATH /app

RUN apt-get update -qq && apt-get upgrade -y \
    && apt-get install -y \
    build-essential \
    default-libmysqlclient-dev \
    git \
    ssh \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN gem install bundler

WORKDIR $APP_PATH
COPY . $APP_PATH
COPY Gemfile Gemfile.lock ./

RUN bundle install

EXPOSE  3000

ENTRYPOINT ["bundle", "exec"]

CMD ["rails", "server", "-b", "0.0.0.0"]
