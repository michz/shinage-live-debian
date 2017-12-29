shinage-live-debian
===================

Build a Debian based live system bootable from USB flash drive or optical disks.


Prerequisites
-------------
You need a running debian system to build the live image.
Furthermore you need the package ```live-build```.


Installation
------------
Go to directory ```live``` and execute:

    lb build

This may take up to 30 minutes.

At the end, a file ```live-image-amd64.hybrid.iso``` is generated.
You can burn this file to an optical drive or to a flash drive.
(For example,
see: https://wiki.archlinux.org/index.php/USB_flash_installation_media#Using_dd )


Customization
-------------
To make a customized live system follow these steps.
(Assumption: Your usb pen drive is detected as ```/dev/sdc```.)

* Burn to an usb pen drive of at least 1GB in size (for example using dd).
  Afterwards there should be at least one partition and a lot of unpartitioned space.
* Create a new partition using the unpartitioned space.
  For example type ```fdisk /dev/sdc```, get bounds of free space with ```F```
  and create a new partition typing ```n``` and following the displayed steps.
  (Usually you can just confirm the suggested values.)
  Then save the new partition by typing ```w```.
* Format the newly created partition as ext4, for example using ```mkfs.ext4```:
  ```mkfs.ext4 -L persistence /dev/sdc3```
  (Assuming that the newly created partition is available as ```/dev/sdc3```.)
* Create a mountpoint for the new partition: ```mkdir /mnt/persistence```
* Mount the persistence partition: ```mount /dev/sdc3 /mnt/persistence```
* Go to mounted persistence file system: ```cd /mnt/persistence```
* Create file ```persistence.conf``` with content ```/p union```
* Create a directory ```p``` and go into it: ```cd p```
* If you want to, you can put there a new release of the shinage-player software.
  Download it from https://github.com/michz/shinage-player/releases and name the zip file
  **exactly** ```shinage-player.zip```.
  It will be installed automatically on boot.
* You can also create a directory called ```config``` containing a file ```config.yml```.
  In this file you can set configuration options for the application, see:
  https://github.com/michz/shinage-player/blob/master/www/signage/app/config/config.yml
* After all do not forget to ```umount /mnt/persistence```.


License
-------
MIT


