# SOX audio tool
#FROM ubuntu:14.04
FROM meteorhacks/meteord:base
MAINTAINER Philipp Fauser <philipp@attic-studio.net>
RUN apt-get update 

# install sox and mp3 codec
RUN apt-get install -y sox
RUN apt-get install -y libsox-fmt-mp3
RUN apt-get install -y curl

# create folders
RUN mkdir /opt/files

# get audio logo
RUN curl https://dl.dropboxusercontent.com/u/5710883/noisefarm/audio_logo_1.mp3 > /opt/files/audio_logo_1.mp3
RUN curl https://dl.dropboxusercontent.com/u/5710883/noisefarm/audio_logo_2.mp3 > /opt/files/audio_logo_2.mp3
RUN curl https://dl.dropboxusercontent.com/u/5710883/noisefarm/audio_logo_3.mp3 > /opt/files/audio_logo_3.mp3
RUN curl https://dl.dropboxusercontent.com/u/5710883/noisefarm/audio_logo_4.mp3 > /opt/files/audio_logo_4.mp3
RUN curl https://dl.dropboxusercontent.com/u/5710883/noisefarm/audio_logo_5.mp3 > /opt/files/audio_logo_5.mp3
RUN ls -la

# change permissions
RUN chmod a+wx /opt
RUN chmod a+wx /opt/files
RUN chmod a+wx /opt/files/audio_logo_1.mp3
RUN chmod a+wx /opt/files/audio_logo_2.mp3
RUN chmod a+wx /opt/files/audio_logo_3.mp3
RUN chmod a+wx /opt/files/audio_logo_4.mp3
RUN chmod a+wx /opt/files/audio_logo_5.mp3

# Install PhantomJS
RUN set -e
RUN apt-get -y install libfreetype6 libfreetype6-dev fontconfig

RUN cd /usr/local/share/
RUN curl -L -O https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN tar xjf phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN ln -s -f /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/share/phantomjs
RUN ln -s -f /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs
RUN ln -s -f /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/bin/phantomjs

RUN rm phantomjs-2.1.1-linux-x86_64.tar.bz2

RUN phantomsjs --version