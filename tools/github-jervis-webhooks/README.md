# Automatic provision webhooks in GitHub

## How to prepare

1. Go to https://github.com/settings/tokens
2. Generate token with at least these permissions:
    * repo
    * admin:repo_hook
    * read:org
    * read:user
3. Save token somewhere

## How to install

### Installation from binaries

**These instructions can be shared for product/saasops teams** (URL available for everyone)

1. Open this directory https://drive.google.com/open?id=1-Cmm-yZ3OnwAg1aYxZwzaneTWrvVxNMG
2. Download `.egg` OR `.whl` file matched to your python version (`python --version`)
3. Install package

*For `.egg` you need `easy_install` preinstalled (`pip install easy_install`)*

```bash
$ easy_install aurea_github_jervis_webhooks-0.1.0-py2.7.egg
OR
$ easy_install aurea_github_jervis_webhooks-0.1.0-py3.6.egg
```

*For `.whl` you need `wheel` preinstalled (`pip install wheel`)*

```bash
$ pip install aurea_github_jervis_webhooks-0.1.0-py2-none-any.whl
OR
$ pip install aurea_github_jervis_webhooks-0.1.0-py3-none-any.whl
```

### Installation from sources

1. Copy contents of this dir into your local host
2. Install application: `python setup.py install`

## How to run

* You should have **admin** permissions to add webhooks.
* You need info about Jenkins web-hooks URL and Jervis secret (ask Jenkins admin)
* Use comma-separated list of repositories

Script have inline documentation:

```bash
$ aurea-jervis-webhooks -h

Executing aurea-jervis-webhooks version 0.1.0.
List of arguments
usage: aurea-jervis-webhooks [-h] -t TOKEN [-o ORGANIZATION]
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

```bash
aurea-jervis-webhooks \
    -t ${GIT_TOKEN} \
    -j http://jervis-public.aureacentral.com/github-webhook/ \
    -s ${JERVIS_SECRET} \
    -r mobilogy-jsteam-group-cellephones,mobilogy-arya-services-qawala
```

### How to remove webhook

Just add `-d` flag, and no need to provide `secret` in this case

```bash
aurea-jervis-webhooks \
    -t ${GIT_TOKEN} \
    -j http://jervis-public.aureacentral.com/github-webhook/ \
    -r mobilogy-jsteam-group-cellephones,mobilogy-arya-services-qawala
    -d
```