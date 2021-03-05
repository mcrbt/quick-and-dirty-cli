#!/bin/bash
##
## invoke - start background process and suppress any output
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

if [ $# -eq 0 ] || [ -z "$1" ]; then exit 0; fi
while [ "$1" == "invoke" ]; do shift; done

which "$1" &> /dev/null
if [ $? -ne 0 ]; then echo "no such command \"$1\""; exit 1; fi

$($@ &> /dev/null &)
exit 0
