FROM ubuntu:14.04
MAINTAINER Alex Huang "nikshuang@163.com"
ENV REFRESHED_AT 2016-1-7

RUN apt-get -qq update
RUN apt-get install -yqq vim make gcc ctags linux-headers-3.16.0-57-generic crash

VOLUME [ "/opt" ]

ADD https://www.kernel.org/pub/linux/kernel/v2.6/linux-2.6.34.tar.xz ~/linux-2.6.34.tar.xz
RUN [ "/bin/tar", "-xf", '~/linux-2.6.34.tar.xz', "-C", "~" ]
ADD vim.configs.tar.bz2 ~/
ADD kernel_sample.tar.bz2 ~/

WORKDIR ~/kernel_sample
RUN [ "ctags", "-R", "~/linux-2.6.34" ]
