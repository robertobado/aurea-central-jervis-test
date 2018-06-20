FROM registry2.swarm.devfactory.com/aurea/lyris-hq/base-java8:1.0

ARG BUILD_DATE
ARG VERSION=1.0
ARG DEBIAN_FRONTEND=noninteractive

LABEL com.trilogy.company="Aurea" \
    com.trilogy.team="MS.DockerProduction" \
    com.trilogy.product="lyris-hq" \
    com.trilogy.service="jenkins-agent" \
    com.trilogy.stage="dev" \
    com.trilogy.maintainer.skype="luismachadoreis" \
    com.trilogy.maintainer.email="luis.reis@aurea.com" \
    version="${VERSION}" \
    build-date="${BUILD_DATE}"

ENV ANT_VERSION=1.9.7 \
    MAVEN_VERSION=3.0.2 \
    MAVEN_CONFIG=/root/.m2 \
    MAVEN_OPTS="-Xms1024M -Xmx2048M" \
    ANT_HOME=/opt/ant \
    PHANTOMJS_BIN=/usr/local/bin \
    MAVEN_HOME=/usr/share/maven \
    M2_HOME=/usr/share/maven \
    GIT_EMAIL="" \
    GIT_NAME="" \
    DOCKER_COMPOSE_VERSION=1.13.0

ENV PATH=${PATH}:${ANT_HOME}/bin:${MAVEN_HOME}/bin

RUN yum install -y curl

ARG user=jenkins
ARG group=jenkins
ARG uid=10000
ARG gid=10000

ENV HOME /home/${user}
RUN groupadd -g ${gid} ${group}
RUN useradd -c "Jenkins user" -d $HOME -u ${uid} -g ${gid} -m ${user}
LABEL Description="This is a base image, which provides the Jenkins agent executable (slave.jar)" Vendor="Jenkins project" Version="3.20"

ARG VERSION=3.20
ARG AGENT_WORKDIR=/home/${user}/agent

RUN curl --create-dirs -sSLo /usr/share/jenkins/slave.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${VERSION}/remoting-${VERSION}.jar \
  && chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/slave.jar

USER root

COPY ./install.sh /install.sh
COPY ./assets/settings.xml ${MAVEN_CONFIG}/settings.xml
COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /install.sh /entrypoint.sh && \
    sync && \
    /install.sh && \
    rm -f /install.sh

USER ${user}
ENV AGENT_WORKDIR=${AGENT_WORKDIR}
RUN mkdir /home/${user}/.jenkins && mkdir -p ${AGENT_WORKDIR}

VOLUME /home/${user}/.jenkins
VOLUME ${AGENT_WORKDIR}
WORKDIR /home/${user}
