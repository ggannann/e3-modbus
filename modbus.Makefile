#
#  Copyright (c) 2017 - Present  Jeong Han Lee
#  Copyright (c) 2017 - Present  European Spallation Source ERIC
#
#  The program is free software: you can redistribute
#  it and/or modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation, either version 2 of the
#  License, or any newer version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#
#  You should have received a copy of the GNU General Public License along with
#  this program. If not, see https://www.gnu.org/licenses/gpl-2.0.txt
#
# Author  : Jeong Han Lee
# email   : han.lee@esss.se
# Date    : Monday, November 20 09:31:24 CET 2017
# version : 0.0.1

# Get where_am_I before include driver.makefile.
# After driver.makefile, where_am_I is the epics base,
# so we cannot use it


where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(REQUIRE_TOOLS)/driver.makefile

APP:=modbusApp
APPDB:=$(APP)/Db
APPSRC:=$(APP)/src

#USR_INCLUDES += -I$(where_am_I)/$(APPSRC)

TEMPLATES += $(wildcard $(APPDB)/*.template)


SOURCES   += $(APPSRC)/modbusInterpose.c
SOURCES   += $(APPSRC)/drvModbusAsyn.c
DBDS      += $(APPSRC)/modbusSupport.dbd
HEADERS   += $(APPSRC)/drvModbusAsyn.h

