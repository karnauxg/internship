FROM ubuntu:20.04

ARG DEVOPS
ENV DEVOPS "noname"

COPY ./varNginx.sh varNginx.sh
RUN chmod +x varNginx.sh
RUN apt-get update \
    && apt-get install -y nginx 

EXPOSE 80

CMD /bin/sh -c /varNginx.sh && nginx -g 'daemon off;'

