FROM ubuntu:14.04
MAINTAINER Alex Huang "nikshuang@163.com"
ENV REFRESHED_AT 2016-1-7

RUN apt-get -qq update
RUN apt-get install -yqq vim make gcc ctags
VOLUME [ "/volume" ]

WORKDIR ~/work
RUN /usr/bin/wget https://www.kernel.org/pub/linux/kernel/v2.6/linux-2.6.34.tar.xz
RUN /bin/tar xf linux-2.6.34.tar.xz
ADD vim.config.tar.bz2 ~/
