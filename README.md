# ayugram-bsd

FreeBSD port of AyuGram Desktop (`net-im/ayugram-desktop`).

## Install

    pkg install tg_owt tde2e
    git clone https://github.com/rediskap/ayugram-bsd.git
    doas cp -r ayugram-bsd/net-im/ayugram-desktop /usr/ports/net-im/
    cd /usr/ports/net-im/ayugram-desktop
    doas make install clean

Requires network access during build (sources are cloned from GitHub).
Tested on FreeBSD with the quarterly package branch.
