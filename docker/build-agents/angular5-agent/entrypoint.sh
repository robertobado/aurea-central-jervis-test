#!/bin/bash

if [ -z "${NEXUS_RELEASES_LOGIN}" ]; then NEXUS_RELEASES_LOGIN=${NEXUS_LOGIN}; fi
if [ -z "${NEXUS_SNAPSHOTS_LOGIN}" ]; then NEXUS_SNAPSHOTS_LOGIN=${NEXUS_LOGIN}; fi
if [ -z "${NEXUS_THIRDPARTY_LOGIN}" ]; then NEXUS_THIRDPARTY_LOGIN=${NEXUS_LOGIN}; fi
if [ -z "${NEXUS_SITES_LOGIN}" ]; then NEXUS_SITES_LOGIN=${NEXUS_LOGIN}; fi

sed -i "s/NEXUS_RELEASES_LOGIN/${NEXUS_RELEASES_LOGIN}/g" ${MAVEN_CONFIG}/settings.xml
sed -i "s/NEXUS_RELEASES_PASSWORD/${NEXUS_RELEASES_PASSWORD}/g" ${MAVEN_CONFIG}/settings.xml
sed -i "s/NEXUS_SNAPSHOTS_LOGIN/${NEXUS_SNAPSHOTS_LOGIN}/g" ${MAVEN_CONFIG}/settings.xml
sed -i "s/NEXUS_SNAPSHOTS_PASSWORD/${NEXUS_SNAPSHOTS_PASSWORD}/g" ${MAVEN_CONFIG}/settings.xml
sed -i "s/NEXUS_THIRDPARTY_LOGIN/${NEXUS_THIRDPARTY_LOGIN}/g" ${MAVEN_CONFIG}/settings.xml
sed -i "s/NEXUS_THIRDPARTY_PASSWORD/${NEXUS_THIRDPARTY_PASSWORD}/g" ${MAVEN_CONFIG}/settings.xml
sed -i "s/NEXUS_SITES_LOGIN/${NEXUS_SITES_LOGIN}/g" ${MAVEN_CONFIG}/settings.xml
sed -i "s/NEXUS_SITES_PASSWORD/${NEXUS_SITES_PASSWORD}/g" ${MAVEN_CONFIG}/settings.xml

git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"

nohup /usr/bin/Xvfb :99 &
