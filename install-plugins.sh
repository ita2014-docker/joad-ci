#!/bin/sh

mkdir -p /tmp/WEB-INF/plugins
cd /tmp

for plugin in \
    git-client \
    scm-api \
    git \
    docker-build-step
do
    curl -L https://updates.jenkins-ci.org/latest/${plugin}.hpi -o WEB-INF/plugins/${plugin}.hpi
done

zip -g /usr/share/jenkins/jenkins.war WEB-INF/plugins/* && rm -rf /tmp/WEB-INF
