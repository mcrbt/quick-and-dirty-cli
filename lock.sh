#!/bin/bash
##
## lock - screen locker configuration for "xscreensaver"
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

function checkcmd
{
	local c="$1"
	if [ $# -eq 0 ] || [ -z "$c" ]; then return 0; fi
	which "$c" &> /dev/null
	if [ $? -ne 0 ]; then echo "command \"$c\" not found"; exit 1; fi
	return 0
}

checkcmd "env"
checkcmd "xdg-screensaver"
checkcmd "xsecurelock"

env XSECURELOCK_AUTH_BACKGROUND_COLOR="black" \
	XSECURELOCK_DISCARD_FIRST_KEYPRESS=1 \
	XSECURELOCK_DATETIME_FORMAT="%a, %b %d, %Y - %H:%M" \
	XSECURELOCK_SHOW_DATETIME=1 \
	XSECURELOCK_SHOW_HOSTNAME=0 \
	XSECURELOCK_SHOW_USERNAME=0 \
	XSECURELOCK_PASSWORD_PROMPT="time_hex" \
	xsecurelock -- xdg-screensaver activate &> /dev/null &
exit 0
