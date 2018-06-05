# Automatic provision webhooks in GitHub

## How to prepare

1. Copy contents of this dir into your local host
2. Install application: `python setup.py install`
3. You can remove contents of this dir from your localhost
4. Go to https://github.com/settings/tokens
5. Generate token with at least these permissions:
    * repo
    * admin:repo_hook
    * read:org
    * read:user
6. Save token somewhere


## How to run

* You should have **admin** permissions to add webhooks.
* You need info about Jenkins web-hooks URL and Jervis secret (ask Jenkins admin)
* Use comma-separated list of repositories

Script have inline documentation:

```
$ aurea-jervis-webhooks -h

Executing aurea-github-jervis-webhooks version 0.1.0.
List of arguments
usage: aurea-github-jervis-webhooks.py [-h] -t TOKEN [-o ORGANIZATION]
                                       [-j JENKINS] [-s SECRET] [-d] [-f FILE]
                                       [-r REPOSITORIES]

Automatic provision webhooks in GitHub for Jervis.

optional arguments:
  -h, --help            show this help message and exit
  -t TOKEN, --token TOKEN
                        Token for GitHub (should have at least: repo,
                        admin:repo_hook, read:org, read:user)
  -o ORGANIZATION, --org ORGANIZATION
                        Name of organization
  -j JENKINS, --jenkins JENKINS
                        Url of jenkins github-webhook API
  -s SECRET, --secret SECRET
                        Secret for Jervis
  -d, --delete          Add this param if you want to remove webhooks instead
                        of adding them
  -f FILE, --file FILE  File with list of repositories
  -r REPOSITORIES, --repositories REPOSITORIES
                        Comma separated list of repositories
```

### How to add webhook

```
aurea-jervis-webhooks \
    -t ${GIT_TOKEN} \
    -j http://jervis-public.aureacentral.com/github-webhook/ \
    -s ${JERVIS_SECRET} \
    -r mobilogy-jsteam-group-cellephones,mobilogy-arya-services-qawala
```

### How to remove webhook

Just add `-d` flag, and no need to provide `secret` in this case

```
aurea-jervis-webhooks \
    -t ${GIT_TOKEN} \
    -j http://jervis-public.aureacentral.com/github-webhook/ \
    -r mobilogy-jsteam-group-cellephones,mobilogy-arya-services-qawala
    -d
```