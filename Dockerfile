FROM ubuntu:14.04
MAINTAINER Alex Huang "nikshuang@163.com"
ENV REFRESHED_AT 2016-1-7

RUN apt-get -qq update
RUN apt-get install -yqq vim make gcc ctags linux-headers-3.16.0-57-generic crash linux-source libncurses-dev bc git
RUN [ "locale-gen", "zh_CN.GB18030" ]

ADD https://www.kernel.org/pub/linux/kernel/v2.6/linux-2.6.34.tar.bz2 root/
ADD vim.configs.tar.bz2 root/
ADD kernel_sample.tar.bz2 work/

WORKDIR work

RUN [ "tar", "xf", "/root/linux-2.6.34.tar.bz2" ]
RUN [ "ctags", "-R", "/work/linux-2.6.34" ]
