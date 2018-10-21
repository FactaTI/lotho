FROM ruby:2.5.1

# installs nodejs and yarn
RUN apt-get --quiet update --yes && \
    apt-get --quiet install --yes git curl build-essential
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn

WORKDIR /tmp

ADD Gemfile .
ADD Gemfile.lock .

RUN bundle install

RUN mkdir /lotho
WORKDIR /lotho

ADD . /lotho

# RUN bundle exec rails webpacker:install
