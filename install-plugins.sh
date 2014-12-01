#!/bin/sh

mkdir -p /tmp/joad-ci
cd /tmp/joad-ci
mkdir -p WEB-INF/plugins META-INF

for plugin in \
    git \
    matrix-project \
    scm-api \
    credentials \
    mailer \
    ssh-credentials \
    git-client \
    github \
    github-api \
    docker-build-step
do
    curl -L https://updates.jenkins-ci.org/latest/${plugin}.hpi -o WEB-INF/plugins/${plugin}.hpi
done

unzip -p /usr/share/jenkins/jenkins.war META-INF/MANIFEST.MF \
    | sed "/^\s*$/q" >META-INF/MANIFEST.MF

zip -d /usr/share/jenkins/jenkins.war META-INF/JENKINS.SF
zip -d /usr/share/jenkins/jenkins.war META-INF/JENKINS.RSA
zip -g /usr/share/jenkins/jenkins.war META-INF/MANIFEST.MF
zip -g /usr/share/jenkins/jenkins.war WEB-INF/plugins/*

rm -rf /tmp/joad-ci
