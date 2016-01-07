FROM ubuntu:14.04
MAINTAINER Alex Huang "nikshuang@163.com"
ENV REFRESHED_AT 2016-1-7

RUN apt-get -qq update
RUN apt-get install -yqq vim make gcc ctags linux-headers-`uname -r`

VOLUME [ "/opt" ]

ADD https://www.kernel.org/pub/linux/kernel/v2.6/linux-2.6.34.tar.xz ~/linux-2.6.34.tar.xz
RUN /bin/tar -xf /root/linux-2.6.34.tar.xz -C ~/
ADD vim.configs.tar.bz2 ~/
ADD kernel_sample.tar.bz2 ~/

WORKDIR ~/kernel_sample
RUN /usr/bin/ctags -R /root/linux-2.6.34
