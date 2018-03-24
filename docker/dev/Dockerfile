FROM elixir:alpine

ENV INSTALL_BASE=/app
ARG MIX_ENV
ARG BUILD_ENV

WORKDIR $INSTALL_BASE

# DO NOT need in production (dev & debug tools):
#   inotify-tools git openssh postgresql-client bash
# python3 = internal health check
# inotify = development only
# nodejs = assets compile
RUN apk --no-cache update && \
    apk --no-cache add python3-dev libffi ca-certificates \
        inotify-tools git openssh bash \
        nodejs yarn libffi-dev gcc libc-dev tar make && \
    mix local.hex && \
    mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez
#    mix local.rebar3 && \
    #mix local.hex --force && \
#    mkdir /etc/openldap ; \
#    echo "TLS_CACERT /app/docker/onelogin-ca.crt" > /etc/openldap/ldap.conf

# these may be over-written by docker-compose.yml, but the container may be run in a different manner too
COPY app/ /app/
COPY docker/$BUILD_ENV /docker/
CMD /docker/launch
