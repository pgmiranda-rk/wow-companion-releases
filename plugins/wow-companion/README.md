# wow-companion

The live World of Warcraft companion for Claude Code. It needs the coach running on this computer
(the install page: https://pgmiranda-rk.github.io/wow-companion-releases), which it reaches at
http://localhost:7710.

In a folder of its own, so the companion is only in the sessions started there:

    mkdir wow-companion
    cd wow-companion
    claude plugin marketplace add pgmiranda-rk/wow-companion-releases
    claude plugin install wow-companion@wow-companion --scope project
    claude        # then say hello

Claude Code asks once for each of the coach's tools, and once to start the game's live watch (a `curl … | sh`
from the coach): allow them for this project.
