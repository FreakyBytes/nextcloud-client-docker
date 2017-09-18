FROM alpine:latest
MAINTAINER Martin Peters

ARG USER=ncsync
ARG USER_UID=1000
ARG USER_GID=1000

ENV NC_USER=username \
    NC_PASS=password \
    NC_URL="" \
    NC_TRUST_CERT=false \
    NC_SOURCE_DIR="/media/nextcloud/" \
    NC_SILENT=false


# create group and user
RUN groupadd --gid $USER_GID $USER && useradd --uid $USER_UID --gid $USER_GID -m $USER

# update repositories and install nextcloud-client
RUN apk update && apk add nextcloud-client

# add run script
ADD run.sh /usr/bin/run.sh

USER $USER
CMD /usr/bin/run.sh
