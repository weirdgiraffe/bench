FROM debian:jessie

ENV DEBIAN_FRONTEND=noninteractive  
RUN echo "deb http://ftp.debian.org/debian/ jessie-backports main" > /etc/apt/sources.list.d/backports.list && \
	apt-get update && \
	apt-get -t jessie-backports install -y ghc cabal-install && \
	cabal update && cabal install bench
RUN apt-get install -qy locales
ENV LANG="en_US.UTF-8"
RUN echo "en_US.UTF-8 UTF-8">/etc/locale.gen && locale-gen
ENV PATH=/root/.cabal/bin:$PATH
