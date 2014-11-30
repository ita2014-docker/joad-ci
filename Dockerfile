FROM jenkins:1.585

USER root

COPY install-plugins.sh /tmp/install-plugins.sh
RUN sh /tmp/install-plugins.sh && rm -f /tmp/install-plugins.sh

USER jenkins
