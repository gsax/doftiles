#!/bin/sh

gpg -qd /secrets/nextcloud-user.gpg | grep username | cut -d " " -f2
