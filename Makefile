DOCKER_NAMESPACE =	armbuild/
NAME =			scw-distrib-alpine
VERSION =		latest
VERSION_ALIASES =	3.2.0 3.2 3 edge
TITLE =			Alpine Linux
DESCRIPTION =		Alpine Linux
SOURCE_URL =		https://github.com/scaleway/image-alpine
SHELL =			/bin/bash


all: help


##
## Image tools  (https://github.com/scaleway/image-tools)
##
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/scw-builder | bash
-include docker-rules.mk
