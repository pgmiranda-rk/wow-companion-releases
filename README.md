# WoW companion releases

Written by the release job (tools/release.sh in the private repository); changes made here by hand are overwritten.

    docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock alpine sh -c \
      'apk add --no-cache bash curl docker-cli docker-cli-compose >/dev/null && curl -fsSL \
       https://pgmiranda-rk.github.io/wow-companion-releases/install.sh | bash -s -- --wow "D:/Jogos/World of Warcraft"'

Run it again to upgrade. `VERSION=<version>` installs another.
