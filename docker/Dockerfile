FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y software-properties-common curl
RUN apt-add-repository -y ppa:webupd8team/java
RUN apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y vim git htop wget net-tools dnsutils unzip docker.io oracle-java8-installer python-pip git socat
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
RUN git clone --recursive https://github.com/samrocketman/jenkins-bootstrap-jervis.git --depth=1 /opt/jervis/
RUN apt-get upgrade -y 
ADD files/entrypoint.sh /entrypoint.sh
WORKDIR /opt/jervis/
RUN ./jenkins-bootstrap-shared/jenkins_bootstrap.sh
EXPOSE 8080
EXPOSE 50000
EXPOSE 9000

ENTRYPOINT /entrypoint.sh
