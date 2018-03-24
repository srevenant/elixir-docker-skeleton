# Elixir in Docker

A strawman folder for an elixir project running within docker

* Folder `app/` contains the elixir/phoenix application.  Create with `mix phx.new --database mysql NAME`
* Folder `docker/` contains the docker build bits, with support for multiple environments in each sub folder
* The launch script for dev is `docker/launch-dev`
* It will build static assets (with npm) if `src/assets/node_modules` is missing.

## Developing

The `./local` command is a useful wrapper for docker-compose.  It prints out what it is running, so you can adjust to suite your needs.  You can get a full syntax by just running the command `./local`

### Running

To startup:

	./local dev up --build

This will build and launch the app in docker, running on `localhost:5000`.  If you want to skip docker build and just run the app:

	./local dev up

The folders `docker` and `app` are imported into the container, so it will watch for live changes.

### Connecting a shell / iex

You can connect a shell to your running service with:

	./local dev sh

And from there you can run iex:

	cd src; iex
