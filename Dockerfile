FROM ubuntu:16.04

RUN \
 echo "**** install build dependencies ****" && \
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
 	python-docutils && \
 echo "**** clone source ****" && \
 cd /opt && \
 git clone https://bitbucket.org/padavan/rt-n56u.git && \
 echo "**** build toolchain ****" && \
 cd /opt/rt-n56u/toolchain-mipsel && \
 bash clean_sources && \
 bash build_toolchain && \
 echo "**** build firmware ****" && \
 cd /opt/rt-n56u/trunk && \
 bash clear_tree && \
 bash build_firmware && \
 cp /opt/rt-n56u/trunk/images/*.trx /opt/ && \
 echo "**** clean up ****" && \
 rm -rf /opt/rt-n56u/ \
 		/var/cache/apt/archives/ \
 		/var/lib/apt/lists/*

VOLUME /firmware

CMD sh -c 'cp /opt/*.trx /firmware/ && chmod -R 777 /firmware/'
