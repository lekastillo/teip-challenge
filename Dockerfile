# 3.1.2-alpine
# ruby:3.1.2-alpine
FROM ruby:3.1.2-alpine

ENV BUNDLER_VERSION=3.1.2

# Install apt based dependencies required to run Rails as
# well as RubyGems. As the Ruby image itself is based on a
# Debian image, we use apt-get to install those.
RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \ 
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      tzdata \
      ruby-nokogiri \
      yarn \
      patch


RUN gem install bundler -v 2.4.3
RUN gem uninstall nokogiri
RUN gem install nokogiri --platform=ruby -- --use-system-libraries
# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
RUN mkdir -p /app
WORKDIR /app
# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
COPY Gemfile Gemfile.lock ./
RUN bundle lock --add-platform x86_64-linux
# RUN bundle config build.nokogiri --use-system-libraries//
RUN gem install bundler && bundle install --jobs 20 --retry 5
# Copy the main application.

COPY . ./
# Expose port 3000 to the Docker host, so we can access it
# from the outside.
EXPOSE 3000
# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
# default.
# CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]