#!/bin/bash

echo "Installing Elixir..."
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update -y
sudo apt-get install esl-erlang=1:19.0 -y
sudo apt-get install elixir=1.4.2-1 -y

echo "Installing nginx and git..."
sudo apt-get install nginx git -y

echo "Installing gatling..."
mix archive.install https://github.com/hashrocket/gatling_archives/raw/master/gatling.ez -y

echo "Installing hex and rebar..."
mix local.hex -y
mix local.rebar -y

echo "Locking versions..."
sudo apt-mark hold esl_erlang elixir
