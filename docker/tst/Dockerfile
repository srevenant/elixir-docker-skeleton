FROM elixir:alpine

ARG MIX_ENV
ARG BUILD_ENV

# DO NOT need in production (dev & debug tools):
#   inotify-tools git openssh postgresql-client bash
# python3 = internal health check
# inotify = development only
# nodejs = assets compile
RUN [ ! $BUILD_ENV ] && exit 1 || \
    apk --no-cache update && \
    apk --no-cache add python3-dev libffi ca-certificates \
        inotify-tools git openssh bash \
        nodejs libffi-dev gcc libc-dev tar make
# NOTE: eventually merge these two after it's all working
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez
#    mkdir /etc/openldap ; \
#    echo "TLS_CACERT /app/docker/onelogin-ca.crt" > /etc/openldap/ldap.conf

# these may be over-written by docker-compose.yml, but the container may be run in a different manner too
WORKDIR /app/src
COPY src/mix.* /app/src/
RUN mix deps.get && \
    mix deps.compile
COPY src/ /app/src/
RUN sed -i -e 's/^\(\s*\)build_version: "[0-9].*$/\1build_version: "'$BUILD_VERSION'",/' mix.exs && \
    (cd assets && \
     npm install && \
     ./node_modules/.bin/brunch build --production ) && \
    mix phx.digest

COPY docker/$BUILD_ENV /docker/

CMD /docker/launch
