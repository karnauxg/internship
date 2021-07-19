#!/bin/bash

which apt-get >/dev/null && { echo Debian based;  }

echo '-----Install rvm-----'
apt-get update && \ 
    apt-get install -y software-properties-common apt-add-repository ppa:rael-gc/rvm
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
apt-get update && \
    apt-get install -y rvm 
usermod -a -G rvm $USER
#ls -la $(which rvm)

echo '-----Install ruby 2.7.2-----'
#/usr/share/rvm/bin/rvm
rvm install 2.7.2
#/usr/share/rvm/rubies/ruby-2.7.2/bin/gem

echo '-----Install bundler-----'
apt-get install -y bundler

echo '-----Install rails 5.2-----'
gem install rails --version=5.2.6

# echo '------Build Redmine---------'
# bundle install --without development test
