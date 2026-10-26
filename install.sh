#!/usr/bin/env bash
# The WoW companion's coach on this computer, from https://pgmiranda-rk.github.io/wow-companion-releases:
# the latest release, or VERSION=<version>. Run it again to upgrade. Everything after `bash -s --` goes to
# the installer (--wow "D:/Jogos/World of Warcraft", --bridge-key "ssh-ed25519 …", --ci, --network NAME).
# Needs Docker with its socket (docker, docker compose), curl and tar: from a Docker Desktop's shell, or
#   docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock alpine sh -c \
#     'apk add --no-cache bash curl docker-cli docker-cli-compose >/dev/null && curl -fsSL \
#      https://pgmiranda-rk.github.io/wow-companion-releases/install.sh | bash -s -- --wow "D:/Jogos/World of Warcraft"'
set -euo pipefail
FROM='https://pgmiranda-rk.github.io/wow-companion-releases'
VERSION="${VERSION:-$(curl -fsSL "$FROM/latest.json" | sed -n 's/.*"version":"\([^"]*\)".*/\1/p')}"
[ -n "$VERSION" ] || { echo "no release to install from $FROM" >&2; exit 1; }
DIR=$(mktemp -d)
trap 'rm -rf "$DIR"' EXIT
curl -fsSL "$FROM/releases/$VERSION/bundle.tar.gz" | tar -xz -C "$DIR"
echo "release $VERSION"
exec sh "$DIR/setup.sh" install "$@"
