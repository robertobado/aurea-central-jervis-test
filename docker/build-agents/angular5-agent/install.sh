#!/bin/bash -x

#prepare apt-get
yum update -y
yum install -y \
            awscli docker.io bzip2 libfontconfig openssh-server curl sudo \
            xorg xvfb xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic \
            python-software-properties zip

cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
EOF

dnf install google-chrome-stable

yum install -y google-chrome-stable

#install Ant
ANT_TAR=apache-ant-${ANT_VERSION}-bin.tar.gz
curl -fsSL -o ${ANT_TAR} http://archive.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz
tar -xzf ${ANT_TAR}
mv apache-ant-${ANT_VERSION} /opt/ant
rm ${ANT_TAR}

#install Maven
MAVEN_TAR=apache-maven.tar.gz
mkdir -p /usr/share/maven /usr/share/maven/ref
curl -fsSL -o /tmp/${MAVEN_TAR} https://archive.apache.org/dist/maven/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz
tar -xzf /tmp/${MAVEN_TAR} -C /usr/share/maven --strip-components=1
ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
rm -f /tmp/${MAVEN_TAR}

#install Node.js and npm
mkdir /tmp/nodejs
curl -fsSL -o /tmp/nodejs/node-v8.6.0-linux-x64.tar.gz http://nodejs.org/dist/v8.6.0/node-v8.6.0-linux-x64.tar.gz
tar -xzf /tmp/nodejs/node-v8.6.0-linux-x64.tar.gz -C /usr/local --strip-components=1
rm -rf /tmp/nodejs/node-v8.6.0-linux-x64.tar.gz

#install npm
npm install -g --asRoot --unsafe-perm npm@5.5.1
npm install -g --asRoot --unsafe-perm @angular/cli --unsafe

/config-ssh.sh || true

#install PhantomJS
mkdir /tmp/phantomjs
curl -fsSL https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.8-linux-x86_64.tar.bz2 | tar -xj --strip-components=1 -C /tmp/phantomjs
cd /tmp/phantomjs
mv bin/phantomjs /usr/local/bin
ln -s /usr/local/bin/phantomjs /usr/bin/phantomjs
cd
rm -rf /tmp/* /var/lib/apt/lists/*
useradd --system --uid 72379 -m --shell /usr/sbin/nologin phantomjs

#install docker-compose
curl -fsSL -o /usr/local/bin/docker-compose https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-Linux-x86_64
chmod +x /usr/local/bin/docker-compose

echo "export DISPLAY=:99.0" >> /etc/bash.bashrc
