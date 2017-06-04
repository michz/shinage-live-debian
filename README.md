shinage-live-debian
===================

Build a Debian based live system bootable from USB flash drive or optical disks.

Prerequisites
-------------
You need a running debian system to build the live image.
Furthermore you need the package ```live-build```.

Installation
------------
Go to the root directory of the repository.
Check out the player repository:

    git clone https://github.com/michz/shinage-player.git

Go to directory ```live``` and execute:

    lb build

This may take up to 30 minutes.

At the end, a file ```live-image-amd64.hybrid.iso``` is generated.
You can burn this file to an optical drive or to a flash drive.
(For example,
see: https://wiki.archlinux.org/index.php/USB_flash_installation_media#Using_dd )


License
-------
MIT


