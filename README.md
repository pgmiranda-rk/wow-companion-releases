# WoW companion releases

Written by the release job (tools/release.sh in the private repository); changes made here by hand are overwritten.

    docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock alpine sh -c 'apk add --no-cache bash curl docker-cli docker-cli-compose >/dev/null && curl -fsSL https://pgmiranda-rk.github.io/wow-companion-releases/install.sh | bash'

It asks where World of Warcraft is (the folder holding _retail_ / _forever_), once: an upgrade remembers it.
Run it again to upgrade. `VERSION=<version>` installs another.

Then the companion, in Claude Code on the same computer (it reaches the coach at http://localhost:7710), in a
folder of its own so it is only in the sessions started there:

    mkdir wow-companion
    cd wow-companion
    claude plugin marketplace add pgmiranda-rk/wow-companion-releases
    claude plugin install wow-companion@wow-companion --scope project
    claude
