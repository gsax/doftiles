#!/bin/sh

gpg -qd /secrets/nextcloud-user.gpg | grep url | cut -d " " -f2
