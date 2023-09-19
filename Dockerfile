FROM ubuntu:20.04
LABEL maintainer="pepsipu <pepsi@pepsi.pw>"

ENV DEBIAN_FRONTEND noninteractive

COPY setup.sh /opt/setup.sh
RUN chmod +x /opt/setup.sh && \
    /opt/setup.sh

WORKDIR /ctf/work/

CMD ["/sbin/my_init"]
