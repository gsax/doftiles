#!/bin/sh

if [ $EUID -ne 0 ] ; then
	eval $(keychain -q --agents gpg --eval 8A3D3173096D160B8FE5C6ABBE0A1B11ED41DD27)
fi


