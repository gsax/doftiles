#!/bin/sh

gpg -qd /home/gsx/.config/vdirsyncer/nextcloud-user.gpg | grep password | cut -d " " -f2
