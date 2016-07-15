#!/bin/bash
cd

# set up rbenv
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL
rbenv install -v 2.1.0  # better to put this inside the .pp manifest to ensure it's installed
rbenv global 2.1.0
echo "gem: --no-document" > ~/.gemrc
# install Rails
gem install bundler
gem install rails -v 4.2.6   # may freeze for some reasons
rbenv rehash