#!/bin/bash
cd

# Install Ruby
rbenv install -v 2.1.0  # it's better to put this inside the .pp manifest to ensure it's installed
rbenv global 2.1.0
echo "gem: --no-document" > ~/.gemrc
# install Rails
gem install bundler
gem install rails -v 4.2.6   # may freeze for some reasons
rbenv rehash