FROM fluentd:v1.9-debian-1
LABEL maintainer "itechnicalguru <github@ralph-schuster.eu>"

USER root:root
RUN apt-get update && apt-get install -y -q --no-install-recommends \
    make \
    g++


# Change the default user and group to root.
# Needed to allow access to /var/log/docker/... files.

RUN gem install --no-document fluent-plugin-kubernetes_metadata_filter --version 2.4.5 \
    && gem install fluent-plugin-elasticsearch --no-document --version 4.0.7

COPY conf/fluent.conf /fluentd/etc/fluent.conf


