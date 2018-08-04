This is Ansible Base agent's Dockerfile

Image automatically logins to docker registry **registry2.swarm.devfactory.com**

**service.tc.nexus** user is used to login to docker registry.

It is possible to build image with another docker registry url and user. 
To do this there are build args used:
- DOCKER_REGISTRY_URL
- DOCKER_REGISTRY_USER

You can set your values during the build.

To build image you need to pass DOCKER_REGISTRY_PASSWORD build argument

```bash
docker build --build-arg DOCKER_REGISTRY_PASSWORD=<PASSWORD> -t registry2.swarm.devfactory.com/aurea/central/jervis/agents/ansible-base:latest .
```

DOCKER_REGISTRY_PASSWORD is always required during image build to avoid hardcoded password in git repo.

After successfull build, the image can be pushed to the registry

```bash
docker push registry2.swarm.devfactory.com/aurea/central/jervis/agents/ansible-base:latest
```

Make sure that the image is working and won't brake any builds.

