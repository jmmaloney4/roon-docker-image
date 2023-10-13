FROM ubuntu@sha256:a9038002b9b29c77c93b1c562ca2bee51313c6f5208c8d90b91929db62e96930
# Based on https://github.com/mikedickey/RoonServer

# For GitHub container registry
LABEL org.opencontainers.image.source https://github.com/jmmaloney4/roon-docker-image

RUN apt-get update \
	&& apt-get install -y ffmpeg curl bzip2 cifs-utils libasound2 gpg \
	&& apt-get -y clean && apt-get -y autoclean

ENV ROON_DATAROOT=/var/roon/
ENV ROON_ID_DIR /var/roon/

# tini https://github.com/krallin/tini
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini.asc /tini.asc
RUN gpg --batch --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7 \
 && gpg --batch --verify /tini.asc /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

# Location of Roon's latest Linux installer
ENV ROON_INSTALLER roonserver-installer-linuxx64.sh
ENV ROON_INSTALLER_URL http://download.roonlabs.com/builds/${ROON_INSTALLER}
ENV MONO_LOG_LEVEL=message

# Grab installer and script to run it
ADD ${ROON_INSTALLER_URL} /tmp
COPY run_installer.sh /tmp
RUN chmod 700 /tmp/${ROON_INSTALLER} /tmp/run_installer.sh
RUN mkdir -p ${ROON_DATAROOT}

# Run the installer, answer "yes" and ignore errors
RUN /tmp/run_installer.sh

# Your Roon data will be stored in /var/roon; /music is for your music
VOLUME [ "/var/roon", "/music" ]

# This starts Roon when the container runs
CMD ["/opt/RoonServer/start.sh"]
