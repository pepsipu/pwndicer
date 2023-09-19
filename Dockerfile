FROM ubuntu:20.04
LABEL maintainer="pepsipu <pepsi@pepsi.pw>"

ENV DEBIAN_FRONTEND noninteractive

ENV TZ America/Los_Angeles

COPY setup.sh /opt/setup.sh
RUN chmod +x /opt/setup.sh && \
    /opt/setup.sh

RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

WORKDIR /ctf/work/

CMD ["/sbin/my_init"]
