#!/bin/bash

set -eu

su - ruby <<'EOF'
git clone https://github.com/sstephenson/rbenv.git /home/ruby/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/ruby/.bashrc
echo 'eval "$(rbenv init -)"' >> /home/ruby/.bashrc
git clone https://github.com/sstephenson/ruby-build.git /home/ruby/.rbenv/plugins/ruby-build
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
rbenv install 2.1.4
rbenv global 2.1.4
gem install bundler --no-ri --no-rdoc
rbenv rehash
EOF
