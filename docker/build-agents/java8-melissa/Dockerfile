FROM registry2.swarm.devfactory.com/aurea/smartleads:melissa-ci

RUN yum update -y && \
  yum install -y vim nano net-tools htop dnsutils git curl netcat bzip2 mc && \
  yum upgrade -y

LABEL com.trilogy.company="Aurea" \
    com.trilogy.team="Product" \
    com.trilogy.product="smartleads" \
    com.trilogy.service="jenkins-agent" \
    com.trilogy.stage="dev" \
    com.trilogy.maintainer.skype="smart.maxx" \
    com.trilogy.maintainer.email="konstantyn.maksimczyk@aurea.com"

ENV HOME=/home/jenkins \
    MAVEN_VERSION=3.3.9 \
    MAVEN_OPTS="-Xms256m -Xmx1024M" \
    MAVEN_HOME=/usr/share/maven \
    M2_HOME=/usr/share/maven \
    GIT_NAME="Konstantyn Maksimczyk" \
    GIT_EMAIL="konstantyn.maksimczyk@aurea.com"

ENV PATH=${PATH}:${ANT_HOME}/bin:${MAVEN_HOME}/bin

#install Maven
RUN mkdir -p ${MAVEN_HOME} ${MAVEN_HOME}/ref && \
  curl -fsSL -o /tmp/apache-maven.tar.gz https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
  tar -xzf /tmp/apache-maven.tar.gz -C ${MAVEN_HOME} --strip-components=1 && \
  rm -f /tmp/apache-maven.tar.gz && \
  ln -s ${MAVEN_HOME}/bin/mvn /usr/bin/mvn && \
  curl -fsSL -o /usr/local/bin/docker-compose https://github.com/docker/compose/releases/download/1.9.0/docker-compose-linux-x86_64 && \
  chmod +x /usr/local/bin/docker-compose

RUN groupadd -g 10000 jenkins && \
  useradd -c "Jenkins user" -d $HOME -u 10000 -g 10000 -m jenkins
LABEL Description="This is a base image, which provides the Jenkins agent executable (slave.jar)" Vendor="Jenkins project" Version="3.19"

ARG VERSION=3.19
ARG AGENT_WORKDIR=/home/jenkins/agent

RUN curl --create-dirs -sSLo /usr/share/jenkins/slave.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${VERSION}/remoting-${VERSION}.jar \
  && chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/slave.jar

USER jenkins
ENV AGENT_WORKDIR=${AGENT_WORKDIR}
RUN mkdir /home/jenkins/.jenkins && mkdir -p ${AGENT_WORKDIR}

VOLUME /home/jenkins/.jenkins
VOLUME ${AGENT_WORKDIR}
WORKDIR /home/jenkins

