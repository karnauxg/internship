FROM ubuntu:20.04

USER root

ARG GITlink
ARG r_env=production
ARG redmineDB=redmine
ARG redmineUSER=redmine
ARG redminePASS=redmine
ARG dbhost=localhost

ENV redmineDB ${redmineDB}
ENV redmineUSER ${redmineUSER}
ENV redminePASS ${redminePASS}
ENV dbhost ${dbhost}

COPY ./installRVM_docker.sh installRVM.sh
RUN sh installRVM.sh

WORKDIR /var
RUN apt-get install -y git
COPY ./buid_Redmine_docker.sh buid_Redmine.sh
COPY ./entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh buid_Redmine.sh
RUN sh buid_Redmine.sh $GITlink $redmineDB $redmineUSER $redminePASS $dbhost $r_env

EXPOSE 3000
# ENTRYPOINT ["sh", "/var/entrypoint.sh", "production", "$redmineDB", "$redmineUSER", "$redminePASS", "$dbhost" ]
# CMD ["production" "$redmineDB" "$redmineUSER" "$redminePASS" "$dbhost" "-d"]
CMD ["sh", "-c", "/var/entrypoint.sh production $redmineDB $redmineUSER $redminePASS $dbhost" ] 