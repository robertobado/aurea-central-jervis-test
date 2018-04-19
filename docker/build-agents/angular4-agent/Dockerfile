#docker build -t registry2.swarm.devfactory.com/jmagalhaes/angular4:1.0.0 . -f Dockerfile.angular4 

FROM node:9.6

USER node
RUN mkdir /home/node/.npm-global
ENV PATH=/home/node/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
RUN npm install -g @angular/cli gulp-cli

EXPOSE 4200

