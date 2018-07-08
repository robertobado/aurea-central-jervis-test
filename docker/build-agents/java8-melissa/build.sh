#!/usr/bin/env bash

docker pull registry2.swarm.devfactory.com/aurea/smartleads:base-java
docker pull registry2.swarm.devfactory.com/aurea/smartleads:tomcat-ci
docker pull registry2.swarm.devfactory.com/aurea/smartleads:melissa-ci

docker build -t registry2.swarm.devfactory.com/aurea/smartleads:jenkins-agent-java8-melissa . -f Dockerfile

#docker push registry2.swarm.devfactory.com/aurea/smartleads:jenkins-agent-java8-melissa