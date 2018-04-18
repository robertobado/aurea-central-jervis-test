# Angular 4 Base Agent

## Features

- Base Image: Official Node 9.x image
- Base Operational System: Debian 8 (Jessie)
- Supported tools:
	- node
	- npm
	- gulp
	- ng (Angular 4 Cli)

- This image can be used to compile as can be used to RUN as a develop environment

## Build

```
./build.sh
```

## Using as Dev Environment


Run the container locally inside the same path where is your project

```
docker run \
    -it --rm --name angular4-builder \
    -v "$PWD":/usr/src/myapp \
    -w /usr/src/myapp \
    -p 4200:4200 \
    registry2.swarm.devfactory.com/aurea/central/jervis/agents/angular4:latest bash
```

Start playing:

```
npm install
ng build
ng serve --host=0.0.0.0 --disable-host-check
```

## Setting Up in the Jervis:

- Read the documentation at: https://confluence.devfactory.com/display/DE/Central+Jervis+Build+Agent+Library
- Use the platforms.json and toolchains-debianJesse-stable.json as a reference to setup your Jervis environment




