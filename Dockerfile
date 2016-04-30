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
RUN curl https://dl.dropboxusercontent.com/u/5710883/audio_logo.mp3 > /opt/files/audio_logo.mp3
RUN ls -la

# change permissions
RUN chmod a+wx /opt
RUN chmod a+wx /opt/files
RUN chmod a+wx /opt/files/audio_logo.mp3
