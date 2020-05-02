FROM node:10-buster-slim
LABEL maintainer="Certificare C. Guychard<christophe@certificare.fr>"

# Generate locale C.UTF-8 for postgres and general locale data
ENV LANG C.UTF-8

# Container tooling

COPY container /container

# container building

RUN /container/build.sh 

USER builder
