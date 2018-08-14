FROM ubuntu:16.04

RUN \
 echo "**** install pre-requisites ****" && \
 apt-get update && \
 apt-get install -y \
 	apt-utils \
 	sudo \
 	kmod \
 	autoconf \
 	automake \
 	autopoint \
 	bison \
 	build-essential \
 	flex \
 	gawk \
 	gettext \
 	git \
 	gperf \
 	libtool \
 	pkg-config \
 	zlib1g-dev \
 	libgmp3-dev \
 	libmpc-dev \
 	libmpfr-dev \
 	texinfo \
 	python-docutils

RUN \
 echo "**** clone source ****" && \
 cd /opt && \
 git clone https://bitbucket.org/padavan/rt-n56u.git

RUN \
 echo "**** build toolchain ****" && \
 cd /opt/rt-n56u/toolchain-mipsel && \
 bash clean_sources && \
 bash build_toolchain

RUN \
 echo "**** build firmware ****" && \
 cd /opt/rt-n56u/trunk && \
 bash clear_tree && \
 bash build_firmware

VOLUME /firmware

CMD sh -c 'cp /opt/rt-n56u/trunk/images/*.trx /firmware/ && chmod -R 777 /firmware/'
