# Elixir in Docker

A strawman folder for an elixir project running within docker

* Folder `src/` contains the elixir/phoenix application.  Create with `mix phx.new --database mysql NAME` and rename it to `src/`.
* Folder `docker/` contains the docker build bits, with support for multiple environments in each sub folder
* The launch script for dev is `docker/{env}/launch`
* The `./local` command is a useful wrapper for docker-compose.  It prints out what it is running, so you can adjust to suite your needs.  You can get a full syntax by just running the command `./local`
* Three environs are supported by `./local` which are: dev, tst or prd.  Dev mounts your local folder into the container, where tst compiles it into the container image.

## Developing

Build your image (with internal data):

    ./local tst build

Run Phoenix (http://localhost:4000):

    ./local tst up

When first run no db exists and it will error.  While it is running, run a ecto.create task (from an alternate terminal):

    ./local tst run phx mix ecto.create

This will build and launch the app in docker, running on `localhost:4000`.  If you want to skip docker build and just run the app (after the image exists):

	./local tst up

If you want your local folders mounted into the container instead, work from the `dev` image instead of `tst` (`./local dev ...`).  When in `dev` mode, the folders `docker/` and `src/` are imported into the container, so it will watch for live changes.

## Connecting a shell / iex

You can connect a shell to your running service with:

	./local dev sh

And from there you can run iex:

	cd src; iex
