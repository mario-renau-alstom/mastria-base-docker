FROM ubuntu:xenial
MAINTAINER Mario Renau <mario.renau@alstomgroup.com>

ENV DEBIAN_FRONTEND noninteractive
# Install Oracle Java 8
ENV JAVA_VER 8
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN apt-get update
RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update && \
    apt-get install -y --no-install-recommends locales && \
    locale-gen en_US.UTF-8 && \
    # apt-get dist-upgrade -y && \
    apt-get --purge remove openjdk* && \
    echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && \
    apt-get update && \
    apt-get install -y --no-install-recommends oracle-java8-installer && \
    apt-get install oracle-java8-set-default && \
    apt-get autoremove && \
    apt-get clean all
