FROM elixir:alpine

ARG MIX_ENV
ARG BUILD_ENV

WORKDIR /app/src

# DO NOT need in production (dev & debug tools):
#   inotify-tools git openssh postgresql-client bash
# python3 = internal health check
# inotify = development only
# nodejs = assets compile
RUN [ ! $BUILD_ENV ] && exit 1 || \
    apk --no-cache update && \
    apk --no-cache add python3-dev libffi ca-certificates \
        inotify-tools git openssh bash \
        nodejs libffi-dev gcc libc-dev tar make && \
    mix local.hex --force && \
    mix local.rebar --force && \
    mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez

# these will be mounted in by docker-compose
CMD /docker/launch
