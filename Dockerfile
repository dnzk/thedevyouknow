FROM ubuntu:20.04

RUN apt-get update
RUN apt-get upgrade
RUN apt install -y wget
RUN apt install -y gnupg
RUN apt install -y inotify-tools
RUN apt-get install -y build-essential
RUN apt-get install -y locales
RUN locale-gen en_US.UTF-8

RUN wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && dpkg -i erlang-solutions_2.0_all.deb
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y esl-erlang
RUN apt-get -y install elixir

RUN mix local.hex --force && \
  mix local.rebar --force

WORKDIR /app
COPY mix.exs mix.lock /app/
RUN mix deps.get

COPY assets assets
COPY config config
COPY priv priv
COPY test test
COPY lib lib
