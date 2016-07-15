#!/bin/sh
cd

echo "gem: --no-document" > ~/.gemrc
# Install Ruby
rbenv install -v 2.1.0  # it's better to put this inside the .pp manifest to ensure it's installed
rbenv global 2.1.0
# install Rails
gem install bundler
gem install rails -v 4.2.6   # may freeze for some reasons
rbenv rehash