#!/bin/bash

apt-get install -y gnupg2

echo '-----Install rvm-----'
apt-get update && \ 
    apt-add-repository ppa:rael-gc/rvm \
    apt-get install -y software-properties-common apt-add-repository ppa:rael-gc/rvm
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
apt-get update && \
    apt-get install -y rvm 
usermod -a -G rvm $USER

echo '-----Install ruby 2.7.2-----'
rvm install ruby 

echo '-----Install bundler-----'
apt-get install -y bundler

echo '-----Install rails 5.2-----'
gem install rails --version=5.2.6
