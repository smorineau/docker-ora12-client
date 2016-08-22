FROM ubuntu:trusty
RUN mkdir /tools
WORKDIR /tools
RUN apt-get -y update \
 && apt-get -y install \
 	inotify-tools \
 	libaio1 \
 	make \
 	rlwrap \
 	unzip \
 && apt-get clean
COPY instantclient-basiclite-linux.x64-12.1.0.2.0.zip .
COPY instantclient-sqlplus-linux.x64-12.1.0.2.0.zip .
RUN unzip instantclient-basiclite-linux.x64-12.1.0.2.0.zip \
 && rm instantclient-basiclite-linux.x64-12.1.0.2.0.zip \
 && unzip instantclient-sqlplus-linux.x64-12.1.0.2.0.zip \
 && rm instantclient-sqlplus-linux.x64-12.1.0.2.0.zip

ENV LD_LIBRARY_PATH /tools/instantclient_12_1
ENV SQLPATH /tools/instantclient_12_1

RUN echo "alias sql+='rlwrap sqlplus'" >> /root/.bashrc

COPY startup.sh /usr/bin/startup.sh
COPY commands/ /usr/local/bin/
COPY ora-env /etc/environment
COPY login.sql /tools/instantclient_12_1/login.sql
RUN chmod +x /usr/bin/startup.sh /usr/local/bin/*

WORKDIR /sql-src
ENTRYPOINT ["/usr/bin/startup.sh"]
