#!/bin/sh

gpg -qd /secrets/nextcloud-user.gpg | grep password | cut -d " " -f2
