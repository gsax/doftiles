#!/bin/sh

if [ $EUID -ne 0 ] ; then
	eval $(keychain -q --agents gpg --eval F94EBE10F06321A70109E7C574A62E84A0031125)
fi


