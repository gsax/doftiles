#!/bin/sh

gpg -qd /home/gsx/.config/vdirsyncer/nextcloud-user.gpg | grep username | cut -d " " -f2
