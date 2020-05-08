#!/bin/bash
##
## cfgsync - copy configuration files of root to all local user directories
## Copyright (C) 2020 Daniel Haase
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program. If not, see <http://www.gnu.org/licenses/gpl.txt>.
##

TITLE="cfgsync"
VERSION="0.1.0"
AUTHOR="Daniel Haase"
QUIET=1

APP="$0"

function version
{
	echo "$TITLE version $VERSION"
	echo " - copy configuration files of root to all users"
	echo "copyright (c) 2020 $AUTHOR"
}

function usage
{
	version
	echo ""
	echo "usage:  $APP [--version | --help]"
	echo ""
	echo "  -V | --version"
	echo "    print version information"
	echo ""
	echo "  -h | --help"
	echo "    print this usage information"
	echo ""
}

function checkcmd
{
	local C="$1"
	if [ $# -eq 0 ] || [ -z "$C" ]; then return 0; fi
	which "$C" &> /dev/null
	if [ $? -ne 0 ]; then echo "command \"$C\" not found"; exit 2; fi
	return 0
}

function sync
{
	local pth="$1"
	if [ $# -eq 0 ] || [ -z "$pth" ]; then return 1; fi
	if [[ "$pth" == "/root/"* ]]; then pth="${pth:6}"; fi
	if [ ! -e "/root/$pth" ]; then echo "file \"/root/$pth\" not found"; return 1; fi
	local dir="$(dirname $pth)"

	for user in /home/*; do
		if [ ! -d "$user/$dir" ]; then
			if [ "$dir" != "." ] && [ "$dir" != ".." ]; then
				if [ $QUIET -eq 0 ]; then echo "creating directory \"$user/$dir\"..."; fi
				mkdir -p "$user/$dir"
			fi
		fi

		if [ $QUIET -eq 0 ]; then echo "copying \"$pth\" to \"$user/$pth\"..."; fi
		cp -ru "/root/$pth" "$user/$pth"
	done
}

checkcmd "basename"
checkcmd "cp"
checkcmd "dirname"
checkcmd "mkdir"

APP=$(basename $APP)

if [ $EUID -ne 0 ]; then
	echo "please run \"$APP\" as user \"root\""
	exit 1
fi

if [ $# -eq 1 ]; then
	if [ "$1" == "-V" ] || [ "$1" == "--version" ]; then version; exit 0
	elif [ "$1" == "-h" ] || [ "$1" == "--help" ]; then usage; exit 0
	else usage; exit 3; fi
fi

#sync ".bashrc"
#sync ".xinitrc"
#sync ".config/openbox"
#sync ".screenlayout"

if [ $QUIET -eq 0 ]; then echo "done"; fi
exit 0