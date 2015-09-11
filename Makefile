NAME =			alpine
VERSION =		latest
VERSION_ALIASES =	3.2.0 3.2 3 edge
TITLE =			Alpine Linux
DESCRIPTION =		Alpine Linux
SOURCE_URL =		https://github.com/scaleway/image-alpine

IMAGE_VOLUME_SIZE =	50G
IMAGE_BOOTSCRIPT =	stable
IMAGE_NAME =		Alpine Linux 3.2


##
## Image tools  (https://github.com/scaleway/image-tools)
##
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/scw-builder | bash
-include docker-rules.mk
