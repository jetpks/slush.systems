---
date: 2023-03-03T08:41:20-07:00
cover: ""
tags: [arch, install, thinkpad]
keywords: []
description: >-
  Initial arch linux install steps on my Thinkpad X1-Yoga
showFullContent: false
hideComments: false
title: Install
draft: true
---

Welcome welcome welcome. Today we're installing Arch Linux on a 14" Thinkpad X1
Yoga 5th Gen.

As is tradition, I've done this once and now I'm doing it again to redo my
partitions. Right now we have LUKS on partition, and we're switching to LVM on
LUKS so we can get encrypted swap & hibernation support.

- [LVM on LUKS](https://wiki.archlinux.org/title/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS)
- [Encrypted Swap w/
  suspend-to-disk](https://wiki.archlinux.org/title/dm-crypt/Swap_encryption)

## Already Done

- Downloaded the install media
- Verified the signature
- dd'd it onto a usb stick
- Disabled SecureBoot (for now) on the new machine
- Booted into the live image

## Now

### Network

- `iwctl`
- `[iwd]# station wlan0 connect Pluto`
- enter passphrase
- verify we've got an address `ip a s`
- verify we've got connectivity `curl -IL https://wiki.archlinux.org/`
- set the time `timedatectl set-ntp true`

### Partition

We need 2 partitions:

1. /boot 1gb fat32 + esp flag (uefi)
2. the whole rest of the disk as a pv
  - on the pv:
    - swap (2x ram for hibernation support) 32G
    - root -- the rest

#### Bounds

We use sectors for parition bounds. Parted says 512b sectors, so we need to do
our math with that assumption. The SSD controller actually uses 4k sectors, but
exposes them as 512b for legacy reasons. It's fine. This detail only matters so
you know that we're really using 4k sectors and these 512b sectors are just
pretend.

For the 1gb boot part:
1 gb * 1024 mb/gb * 1024 kb/mb * 1024 b/kb / 512 bytes/sector = 2097152 sectors

Offset 1mb (2048s) from the beginning of the disk, so that makes our bounds:
/boot 2048s 2099200s

For the pv. Again we offset 1mb (2048s) from the end of the last part, so that
makes our start 2101248s. For the end, we just stop 2048s from the end of the
disk, so -2048s.
pv 2101248s -2048s

#### Execution

`parted /dev/nvme0n1`

```
unit s
print
mklabel gpt
print
mkpart primary fat32 2048s 2099200s
mkpart primary 2101248s -2048s
align-check opt 1
align-check opt 2
toggle esp 1
print
quit
```

I probably should have included the output of some of these commands, but it's
now weeks later and I don't have it.

### Boot filesystem & LVM setup

ez
```sh
mkfs.fat -F 32 /dev/nvme0n1p1
```

let's lvm this son of a bitch.

looks like we're going to 
```sh
cryptsetup luksFormat /dev/nvme0n1p2
# YES
# passphrase
# verify passphrase
cryptsetup open /dev/nvme0n1p2 cryptlvm
# passphrase
pvcreate /dev/mapper/cryptlvm
vgcreate vg0 /dev/mapper/cryptlvm
lvcreate -L 32G vg0 -n swap
lvcreate -l 100%FREE vg0 -n root
```

cool

### filesystems

```sh
mkswap /dev/vg0/swap
mkfs.ext4 -m 1 -L root /dev/vg0/root
```

Yea, i'd like to give btrfs a shot, but i'm so familiar with ext4 and it's so
stable I don't really want to move away from it.

`-m 1` sets reserved block percentage to 1%; down from the default 5%. (5% is a
shit load of reserved blocks on a 1tb disk)
`-L root` sets the label to root

Don't forget to write down where your superblock backups are. I put mine in my
password manager.

# Actually installing

## mirrors

```
reflector --connection-timeout 2 --threads 4 --sort age --save
/etc/pacman.d/mirrorlist --country US --score 20
```

`cat /etc/pacman.d/mirrorlist` to verify


## install

```sh
pacstrap -K /mnt base linux linux-firmware fish lvm2 intel-ucode neovim tp_smapi man-db man-pages texinfo
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/America/Denver /etc/localtime
hwclock --synctohc
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
```

edit /etc/mkinitcpio.conf & update HOOKS

order matters, we're setting up the boot process.

```mkinitcpio.conf
HOOKS=(base systemd autodetect modconf kms keyboard sd-vconsole block sd-encrypt
lvm2 filesystems fsck)
```

`passwd` -- setup a root password

### boot loader

gotta pull several sets of directions together here.

First, we're doing systemd-boot. We've gotta write the configs & setup the
device IDs for our luks/lvm scheme, and finally microcode

```
bootctl install
```

i am getting tired, lots happened

updated /boot/loader/entries/arch{,-fallback}.conf, /boot/loader/loader.conf
(maybe?) from the original notes

installed rsync, iwd

enabled systemd-{networkd,resolved} iwd

chsh -s /usr/bin/fish

useradd eric

pacman -S sudo

updated /etc/crypttab.initramfs

updated /etc/mkinitcpio.conf

mkinitcpio -P

touch /etc/vconsole.conf



