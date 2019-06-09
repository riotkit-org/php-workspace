ARG VERSION="5.2-apache"
ARG ENV_UID=1000
ARG ENV_GID=1000

FROM wordpress:${VERSION}

ARG ENV_UID
ARG ENV_GID

RUN set -x \
    && usermod -u $ENV_UID www-data \
    && groupmod -g $ENV_GID www-data
