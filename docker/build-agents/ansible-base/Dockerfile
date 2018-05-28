FROM jenkinsci/slave

USER root

RUN apt-get update
RUN apt-get install -y curl vim git htop wget net-tools dnsutils unzip python-pip git 
RUN curl -o- https://download.docker.com/linux/debian/dists/stretch/pool/stable/amd64/docker-ce_18.03.0~ce-0~debian_amd64.deb > docker.deb
RUN dpkg -i docker.deb || rm docker.deb
RUN apt --fix-broken -y install
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
RUN echo deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main >>  /etc/apt/sources.list
RUN apt-get update
RUN apt-get install ansible  -y
RUN pip uninstall docker-py; pip uninstall docker; pip install docker "pywinrm>=0.2.2"; \
    pip install PyVmomi
ADD files/kubernetes.py /usr/lib/python2.7/dist-packages/ansible/modules/clustering/kubernetes.py
