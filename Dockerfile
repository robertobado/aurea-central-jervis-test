FROM rowanto/docker-java8-mvn-nodejs-npm

RUN npm install n -g && \
    n stable && \
    npm install -g @vue/cli

RUN apt-get install -y git && \
	cd /opt && \
	git clone https://github.com/v1pankaj/spring-boot-vuejs.git && \
	cd /opt/spring-boot-vuejs && \
    mvn --version && \
	mvn clean install

EXPOSE 8080
EXPOSE 8088

WORKDIR /opt/spring-boot-vuejs

ENTRYPOINT ["mvn", "--projects", "backend", "spring-boot:run"]
