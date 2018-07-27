ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV DEBIAN_FRONTEND=teletype

ENV DEBUG_MODE_BASE=1

ENV LNG=en_US

ENV LOCALE=UTF-8

ENV CONFIG_DIR=/data/teamcity_agent/conf

ENV AGENT_DIST=/opt/buildagent

ENV JAVA_HOME=/usr/lib/jvm/jdk-8-oracle-x64

ENV JVM_MS=1024M

ENV JVM_MX=2048M

ENV LANG=en_US.UTF-8

ENV LANGUAGE=en_US:en

ENV LC_ALL=en_US.UTF-8

ENV TC_IP=10.69.11.123

ENV SERVER_URL=http://teamcity.swarm.devfactory.com

ENV SERVER_NAME=teamcity.swarm.devfactory.com

ENV NEXUS_PATH=https://nexus.devfactory.com/repository

ENV CLASSPATH=/usr/java/jdk/lib/tools.jar:./

ENV CONFIG_FILE=/data/teamcity_agent/conf/buildAgent.properties

ENV LOG_DIR=/opt/buildagent/logs

ENV JAVA_1_8_HOME=/usr/java/jdk

ENV JRE_HOME=/usr/bin/..

ENV TEAMCITY_AGENT_MEM_OPTS=-Xms1024M -Xmx2048M

ENV TEAMCITY_AGENT_OPTS=

ENV devenv=/opt/kerio/autobuild

ENV GRADLE_HOME=/opt/kerio/autobuild/gradle

ENV HOME=/root

ENV JDK_18=/usr/lib/jvm/jdk-8-oracle-x64

ENV JDK_18_x64=/usr/lib/jvm/jdk-8-oracle-x64

ENV JDK_HOME=/usr/lib/jvm/jdk-8-oracle-x64

ENV JRE_17=/usr/lib/jvm/default-java

ENV JRE_17_x64=/usr/lib/jvm/default-java

ENV KSIGN_KEY_DEFAULT=/opt/kerio/autobuild/uchk-keys/default.key

ENV LOGNAME=root

ENV PHANTOMJS=/usr/bin/phantomjs

ENV SHELL=/bin/bash

ENV SHLVL=1

ENV USER=root

ENV USERNAME=root

ENV TC_PATH=/opt/buildagent

ENV DOCKER_HOST=docker-build.aureacentral.com:2375

ENV TEAMCITY_BUILD_INIT_PATH=/opt/buildagent/lib/serviceMessages.jar:/opt/buildagent/lib/runtime-util.jar:/opt/buildagent/plugins/gradle-runner/lib/gradle-runner-common.jar

EXPOSE 9090/tcp

VOLUME /data/teamcity_agent/conf


ENTRYPOINT ["/entrypoint.sh"]

