FROM jenkinsci/slave

USER root

ARG DOCKER_REGISTRY_URL=registry2.swarm.devfactory.com
ARG DOCKER_REGISTRY_USER=service.tc.nexus
ARG DOCKER_REGISTRY_PASSWORD

RUN apt-get update && \
    apt-get install -y curl vim git htop wget net-tools dnsutils unzip python-pip git  && \
    curl -o- https://download.docker.com/linux/debian/dists/stretch/pool/stable/amd64/docker-ce_18.03.0~ce-0~debian_amd64.deb > docker.deb && \
    dpkg -i docker.deb || rm docker.deb && \
    apt --fix-broken -y install && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
    echo deb http://ppa.launchpad.net/ansible/ansible-2.5/ubuntu trusty main >>  /etc/apt/sources.list && \
    apt-get update && \
    apt-get install ansible  -y && \
    pip uninstall docker-py; pip uninstall docker; pip install docker docker-compose "pywinrm>=0.2.2" PyVmomi python-dateutil boto boto3 botocore && \
    docker -H docker-build.aureacentral.com login -u $DOCKER_REGISTRY_USER -p $DOCKER_REGISTRY_PASSWORD $DOCKER_REGISTRY_URL
ADD files/kubernetes.py /usr/lib/python2.7/dist-packages/ansible/modules/clustering/kubernetes.py
