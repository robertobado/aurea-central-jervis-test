FROM jenkinsci/slave

USER root

#Instal essentials
RUN apt-get update && \
  apt-get install -y apt-utils dnsutils git curl netcat maven vim nano net-tools htop unzip && \
  apt-get upgrade -y

ADD .mavenrc /home/jenkins/