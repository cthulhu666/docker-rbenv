FROM debian:jessie
MAINTAINER jakub.gluszecki@gmail.com

RUN apt-get update && \
    apt-get install -y sudo build-essential libssl-dev libreadline6-dev curl git-core

ADD bin/ /usr/sbin/
RUN chmod 755 /usr/sbin/install-rbenv.sh

RUN useradd -m -d /home/ruby -p ruby ruby && adduser ruby sudo && chsh -s /bin/bash ruby

RUN install-rbenv.sh

USER ruby
ENV HOME /home/ruby
