FROM lsiobase/alpine:3.6
MAINTAINER sparklyballs

# install build packages
RUN \
 apk add --no-cache --virtual=build-dependencies \
	autoconf \
	automake \
	freetype-dev \
	g++ \
	gcc \
	jpeg-dev \
	lcms2-dev \
	libffi-dev \
	libpng-dev \
	libwebp-dev \
	linux-headers \
	make \
	openjpeg-dev \
	openssl-dev \
	python3-dev \
	tiff-dev \
	zlib-dev && \

# install runtime packages
 apk add --no-cache \
	curl \
	freetype \
	git \
	lcms2 \
	libjpeg-turbo \
	libwebp \
	openjpeg \
	openssl \
	p7zip \
	py3-lxml \
	py3-pip \
	python3 \
	tar \
	tiff \
	unrar \
	unzip \
	vnstat \
	wget \
	xz \
	zlib && \

# add pip packages
 pip install --no-cache-dir -U \
	pip && \
 pip install --no-cache-dir -U \
	cheetah \
	configparser \
	ndg-httpsclient \
	notify \
	paramiko \
	pillow \
	psutil \
	pyopenssl \
	requests \
	setuptools \
	urllib3 \
	virtualenv && \

# clean up
 apk del --purge \
	build-dependencies && \
 rm -rf \
	/root/.cache \
	/tmp/*
