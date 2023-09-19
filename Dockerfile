FROM ubuntu:20.04
LABEL maintainer="pepsipu <pepsi@pepsi.pw>"

ENV DEBIAN_FRONTEND noninteractive
ENV LC_CTYPE C.UTF-8
ENV TZ America/Los_Angeles

COPY setup.sh /opt/setup.sh
RUN chmod +x /opt/setup.sh && \
    /opt/setup.sh

ENV TERM xterm-256color
WORKDIR /ctf/work/

CMD ["/bin/bash"]
