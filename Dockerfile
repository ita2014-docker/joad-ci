FROM jenkins:1.592

ENV DOCKER_VERSION 1.4.1
ENV DOCKER_HOST tcp://172.17.42.1:2375

USER root
RUN curl -L https://get.docker.io/builds/Linux/x86_64/docker-${DOCKER_VERSION} -o /usr/local/bin/docker && \
    chmod +x /usr/local/bin/docker

USER jenkins
COPY plugins.txt /plugins.txt
RUN /usr/local/bin/plugins.sh /plugins.txt
