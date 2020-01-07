FROM ubuntu:bionic
MAINTAINER Alexander Paul <alex.paul@.wustl.edu>

LABEL \
  description="Docker image to run BayesTyper (https://github.com/bioinformatics-centre/BayesTyper)"

RUN apt-get update && apt-get install -y \
  wget && \
  apt-get clean all

WORKDIR /opt

ENV BAYESTYPER_VERSION=v1.5

RUN wget https://github.com/bioinformatics-centre/BayesTyper/releases/download/${BAYESTYPER_VERSION}/bayesTyper_v1.5_linux_x86_64.tar.gz && \
  tar -zxvf bayesTyper_${BAYESTYPER_VERSION}_linux_x86_64.tar.gz && \
  rm bayesTyper_${BAYESTYPER_VERSION}_linux_x86_64.tar.gz && \
  mv bayesTyper_${BAYESTYPER_VERSION}_linux_x86_64 bayesTyper && \
  ln -s /opt/bayesTyper/bin/* /usr/bin/

WORKDIR /