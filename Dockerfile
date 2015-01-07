FROM jenkins:1.585

USER root

COPY install-plugins.sh /tmp/install-plugins.sh
RUN sh /tmp/install-plugins.sh && rm -f /tmp/install-plugins.sh
RUN apt-get update && apt-get install -y docker.io --no-install-recommends && rm -rf /var/lib/apt/lists/*

USER jenkins
