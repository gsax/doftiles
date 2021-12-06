#!/bin/sh

gpg -qd /home/gsx/.config/vdirsyncer/nextcloud-user.gpg | grep url | cut -d " " -f2
