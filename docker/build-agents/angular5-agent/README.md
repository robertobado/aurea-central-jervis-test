#### Description
The sourse for creation Jenkis agent docker image for Lyris HQ NodeJS/Angular5 projects.

#### Content
This image contains JDK 1.7, Ant 1.9.7, Maven 3.0.2, PHP Composer, AWS CLI, Docker, Docker-compose 1.9.0, Node.js 8.6.0, npm 5.5.1

#### Environments
- `JAVA_HOME` = /usr/lib/jvm/jdk1.7.0_80
- `ANT_HOME` = /opt/ant
- `MAVEN_HOME` = `M2_HOME` = /usr/share/maven
- `PATH` = ${PATH}:/opt/ant/bin:/usr/share/maven/bin:/usr/lib/jvm/jdk1.7.0_80/bin`
- `GIT_USER` - user for git's global parameter `git.user` (default is empty string)
- `GIT_EMAIL` - e-mail for git's global parameter `git.email` (default is empty string)

#### Instructions for building docker image
```
docker build -t jenkins-node8
```

#### Instructions for running docker image
```
docker run -it --rm jenkins-node8 bash
```

_Note: the docker image contains volumes `/var/run/docker.sock:/var/run/docker.sock` for Docker functionality and `/root/.m2` for Maven_

#### Instructions for pushing docker image
```
docker tag jenkins-node8 registry2.swarm.devfactory.com/aurea/jenkinsci/node:8
docker push registry2.swarm.devfactory.com/aurea/jenkinsci/node:8
```
