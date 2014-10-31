docker-rbenv
============

__Docker image with rbenv and ruby 2.1.4 installed on non-root account__

basic usage
-----

    docker run -i -t cthulhu666/docker-rbenv
    $ ruby -v
    ruby 2.1.4p265 (2014-10-27 revision 48166) [x86_64-linux]
     
using as base image example
---------------------------

Create Dockerfile

    FROM cthulhu666/docker-rbenv
    RUN sudo apt-get update && apt-get install -y libmysqlclient-dev # install extra packages
    ADD . /app
    WORKDIR /app
    RUN bundle install
    RUN gem install foreman && rbenv rehash # remember to rehash after installing executables
    EXPOSE 8080
    
build it:

    docker build -t myapp .

run your app:

    docker run -d -P myapp foreman start 


