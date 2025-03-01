#!/usr/bin/env bash
# exit on error
set -o errexit

curl -fsSL https://deb.nodesource.com/setup_16.x | bash -  # Installs Node.js
apt-get install -y nodejs
gem install rails -v 8.0.1
bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean

# If you're using a Free instance type, you need to
# perform database migrations in the build command.
# Uncomment the following line:

# bundle exec rails db:migrate