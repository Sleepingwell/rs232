#***************************************************************************
#
# Author: Simon Knapp
#
# Copyright (C) 2012 Simon Knapp
#
# sleepingwell@gmail.com
#
#***************************************************************************
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#
#**************************************************************************
#
# This version of GPL is at http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
#
#**************************************************************************

setClass('rs232', representation(portNumber='integer', baudRate='integer'))

openComPort <- function(portNumber, baudRate) .Call(rs232_openComPort, as.integer(portNumber), as.integer(baudRate))
closeComPort <- close.rs232 <- function(port) .Call(rs232_closeComPort, port@portNumber)

writeByte <- function(port, byte) invisible(.Call(rs232_writeByte, port@portNumber, as.raw(byte)))
writeBytes <- function(port, bytes) invisible(.Call(rs232_writeBytes, port@portNumber, as.raw(bytes)))
writeString <- function(port, text) invisible(.Call(rs232_writeString, port@portNumber, as.character(text)))

readBytes <- function(port, maxCount=4095) .Call(rs232_readBytes, port@portNumber, as.integer(maxCount))

isCTSEnabled <- function(port) as.logical(.Call(rs232_isCTSEnabled, port@portNumber))
