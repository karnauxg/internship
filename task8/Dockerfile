FROM ubuntu:20.04

ARG GITlink
ARG redmineDB
ARG redmineUSER
ARG redminePASS

# COPY ./installRVM_docker.sh installRVM.sh
COPY ./installMySQL_docker.sh installMySQL.sh
# COPY ./testRedmineWebrick.sh testRedmineWebrick.sh


# RUN sh installRVM.sh
RUN sh installMySQL.sh $redmineDB $redmineUSER $redminePASS

EXPOSE 3000

# CMD /bin/sh -c /installMySQL.sh -g 'daemon off;'

