FROM elixir:1.9.4
MAINTAINER demmet

RUN apt-get update && apt-get install --yes libpq-dev

RUN curl -o phx_new.ez https://github.com/phoenixframework/archives/raw/master/phx_new.ez
RUN mix archive.install --force phx_new.ez
RUN mix local.hex --force
RUN mix local.rebar --force

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y -q nodejs
RUN apt-get install -y -q inotify-tools

RUN mkdir -p /kakatsu
COPY . /kakatsu
WORKDIR /kakatsu

ENV MIX_ENV dev

RUN mix deps.get

EXPOSE 4033
