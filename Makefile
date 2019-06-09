.SILENT:

PREPARE := $(shell test -e .env || cp .env-default .env)
IS_ENV_PRESENT := $(shell test -e .env && echo -n yes)
SUDO=sudo
NAME=wp
ENV_UID := $(shell id -u)
ENV_GID := $(shell id -g)
COMPOSE=ENV_UID=${ENV_UID} ENV_GID=${ENV_GID} docker-compose -p ${NAME}
IMAGE=wordpress:${VERSION}

ifeq ($(IS_ENV_PRESENT), yes)
	include .env
	export $(shell sed 's/=.*//' .env)
endif

## This help screen
help:
	printf "${COLOR_COMMENT}Usage:${COLOR_RESET}\n"
	printf " make [target]\n\n"
	printf "${COLOR_COMMENT}Available targets:${COLOR_RESET}\n"
	awk '/^[a-zA-Z\-\_0-9\.@]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf " ${COLOR_INFO}%-16s${COLOR_RESET}\t\t%s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

## Get docker-compose args for debugging
get_compose_args:
	echo bash -c \"${COMPOSE}\"

## Start the development environment
start:
	set -x; ${SUDO} bash -c "${COMPOSE} up -d --build"

## Stop the environment
stop:
	set -x; ${SUDO} bash -c "${COMPOSE} down"