FROM ubuntu:20.04
LABEL maintainer="pepsipu <pepsi@pepsi.pw>"

ENV TZ America/Los_Angeles
RUN ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime

RUN apt -y update
RUN apt -y install curl tzdata
RUN bash -c "$(curl -fsSL https://sh.pepsi.pw/)"

ENV LC_CTYPE C.UTF-8
ENV TERM xterm-256color

WORKDIR /pwn/

CMD ["/bin/bash"]
