#!/bin/bash
# Set UTUTO info for xsWelcome
#
# (C)2013 Diego Gabriel Calbo Elizndo <dcalbo@ututo.org>
#
# Copyright (C) 2006, 2013 The UTUTO Project
# Distributed under the terms of the GNU General Public License v3
#
# $Header: $#

RELEASE=`cat /ututo.lastversion | grep -o -P '(?<=\().*(?=\))'`
CODENAME="`/usr/libexec/uget/bin/select_cpu-type.sh` optimization"
EDITION=`cat /ututo.lastversion | cut -d' ' -f1`
DESCRIPTION="UTUTO XS GNU/Linux"

echo "RELEASE=$RELEASE" > ~/.ututoxs/xsWelcome/info
echo "CODENAME=$CODENAME" >> ~/.ututoxs/xsWelcome/info
echo "EDITION=$EDITION" >> ~/.ututoxs/xsWelcome/info
echo "DESCRIPTION=$DESCRIPTION" >> ~/.ututoxs/xsWelcome/info

