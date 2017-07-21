#! /bin/bash

#### Some useful functions for Emulation and ROMs ####

GetSystemsList () {									### Gets a list of emulated systems from hyperspin-fe.com
	wget -q https://hyperlist.hyperspin-fe.com/ -O raw_webpage.tmp			### Raw dump of a webpage to get list of emulated systems
	grep "largefont" raw_webpage.tmp | grep -v align > dirty.list			### Uses keyword 'largefont' to disguish lines of text which have the system names on them
	sed -i 's|.*largefont\W>||g' dirty.list						### Cleaning up some stuff
	sed -i 's|<\/span><\/td>||g' dirty.list						### More of the same
	mv dirty.list systems.list							### Renames the list once cleaned up
	rm raw_webpage.tmp								### Removes temporary html source
}
