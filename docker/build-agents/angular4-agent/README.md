# Angular 4 Base Agent

## Features

- Base Image: jenkins/slave:3.19-1
- Base Operational System: Debian 8 (Jessie)
- Supported tools:
	- java
	- node
	- npm
	- gulp
	- ng (Angular 4 Cli)

## Build

```
./build.sh
```

## Setting Up in the Jervis:

- Read the documentation at: https://confluence.devfactory.com/display/DE/Central+Jervis+Build+Agent+Library
- Use the `platforms.json`, `toolchains-debian8-stable.json` and `lifecycles-debian8-stable.json' files as a reference to setup your Jervis environment




