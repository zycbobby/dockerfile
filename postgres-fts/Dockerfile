FROM postgres:9.3

MAINTAINER curry


COPY docker-entrypoint-im.sh /docker-entrypoint-im.sh
COPY sources.list /etc/apt/sources.list

#COPY zhconfig.sh /zhconfig.sh

RUN ["/bin/bash", "-c", "apt-get update"]
RUN ["/bin/bash", "-c", "apt-get install -y --force-yes vim wget git build-essential tar postgresql-server-dev-9.3 screen"]
RUN ["/bin/bash", "-c", "wget -q -O - http://www.xunsearch.com/scws/down/scws-1.2.1.tar.bz2 | tar xjf - "]
RUN ["/bin/bash", "-c", "cd scws-1.2.1;./configure;make install"]
RUN ["/bin/bash", "-c", "git clone https://github.com/amutu/zhparser.git"]
RUN ["/bin/bash", "-c", "cd zhparser;SCWS_HOME=/usr/local make && make install"]
#RUN ["/bin/bash", "-c", "cd /; chmod +x zhconfig.sh"]

#ENV PG_MAJOR 9.3
#ENV PG_VERSION 9.3.6-1.pgdg70+1
#ENV PATH /usr/lib/postgresql/$PG_MAJOR/bin:$PATH
#ENV PGDATA /var/lib/postgresql/data
#VOLUME /var/lib/postgresql/data

ENTRYPOINT ["/docker-entrypoint-im.sh"]

#EXPOSE 5432
#CMD ["./zhconfig.sh"]
