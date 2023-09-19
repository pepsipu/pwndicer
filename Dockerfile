FROM ubuntu:20.04
LABEL maintainer="pepsipu <pepsi@pepsi.pw>"

ENV TZ America/Los_Angeles

RUN apt -y update && apt -y install curl
RUN bash -c "$(curl -fsSL https://pwn.pepsi.pw/)"

ENV LC_CTYPE C.UTF-8
ENV TERM xterm-256color

WORKDIR /pwn/

CMD ["/bin/bash"]
