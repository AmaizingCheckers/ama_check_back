FROM alpine:3.4

ENV RUNTIME_PACKAGES="ruby ruby-irb ruby-json ruby-rake ruby-bigdecimal ruby-io-console ruby-dev libxml2-dev libxslt-dev libstdc++ tzdata mariadb-client-libs nodejs ca-certificates imagemagick-dev graphviz"\
    DEV_PACKAGES="build-base mysql-dev"

RUN apk add --update --no-cache $RUNTIME_PACKAGES && \
    mkdir /ama_check_back

WORKDIR /ama_check_back

COPY Gemfile /ama_check_back/Gemfile
COPY Gemfile.lock /ama_check_back/Gemfile.lock

RUN apk add --update\
    --virtual build-dependencies\
    --no-cache\
    $DEV_PACKAGES && \
    gem install bundler --no-document && \
    bundle install && \
    apk del build-dependencies
