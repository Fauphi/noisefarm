# SOX audio tool
#FROM ubuntu:14.04
FROM meteorhacks/meteord:base
MAINTAINER Philipp Fauser <philipp@attic-studio.net>
RUN apt-get update

COPY scripts/install_binbuild_tools.sh $METEORD_DIR/install_binbuild_tools.sh
COPY scripts/rebuild_npm_modules.sh $METEORD_DIR/rebuild_npm_modules.sh

RUN bash $METEORD_DIR/install_binbuild_tools.sh
RUN bash $METEORD_DIR/rebuild_npm_modules.sh

# install ffmpeg
RUN apt-get install -y libav-tools
RUN ln -s /usr/bin/avconv /usr/bin/ffmpeg

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

# install ID3 tag python lib
RUN apt-get install -y python-pip
RUN pip install mutagen