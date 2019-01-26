FROM ubuntu:bionic

RUN apt-get update \
	&& apt-get -y dist-upgrade \
	&& apt-get -y install --no-install-recommends \
		software-properties-common \
		tzdata \
	&& apt-get clean

RUN add-apt-repository ppa:team-xbmc/ppa \
	&& apt-get -y update \
	&& apt-get -y install kodi \
	&& apt-get clean

RUN groupadd -r -g 1000 kodi \
	&& useradd -r -d /home/kodi -m -u 1000 -g 1000 kodi
