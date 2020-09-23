FROM ubuntu:latest
ENV BACKUP_BIN_DIR=/opt/backup/bin \
    BACKUP_DIR=/etc/backup/data


# install go and git
RUN apt-get update \
    && apt-get install -y git \
    && apt-get install -y wget

# install zip and unzip
RUN set -x \
    && apt-get update \
    && apt-get install -y zip \
    && apt-get install -y unzip \
    && apt-get install -y curl