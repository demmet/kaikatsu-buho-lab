FROM elixir:1.9.4
MAINTAINER demmet

RUN apt-get update && apt-get install --yes postgresql-client

RUN mix archive.install --force \
  https://github.com/phoenixframework/archives/raw/master/phx_new.ez
RUN mix local.hex --force
RUN mix local.rebar --force

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y -q nodejs
RUN apt-get install -y -q inotify-tools

ENV MIX_ENV dev
RUN mix deps.get

RUN mkdir -p /kaikatsu
COPY . /kaikatsu
WORKDIR /kaikatsu

EXPOSE 4033
