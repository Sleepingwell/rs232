/*
***************************************************************************
*
* Author: Simon Knapp
*
* Copyright (C) 2012 Simon Knapp
*
* sleepingwell@gmail.com
*
***************************************************************************
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation version 2 of the License.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License along
* with this program; if not, write to the Free Software Foundation, Inc.,
* 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*
***************************************************************************
*
* This version of GPL is at http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
*
***************************************************************************
*/

#include <Rdefines.h>
#include <R.h>
#include "rs232.h"

SEXP rs232_openComPort(SEXP portNumber, SEXP baudRate) {
    SEXP ans, CPClass;

    // check that the right types have been passed.
    if(!isInteger(portNumber)) error("portNumber must be an integer.");
    if(!isInteger(baudRate)) error("baudRate must be an integer.");

    // errors generated internally
    OpenComport(INTEGER(portNumber)[0], INTEGER(baudRate)[0]);

    // create the return value
    CPClass = MAKE_CLASS("rs232");
    PROTECT(ans = NEW_OBJECT(CPClass));
    SET_SLOT(ans, Rf_install("portNumber"), portNumber);
    SET_SLOT(ans, Rf_install("baudRate"), baudRate);

    // cleanup and return
    UNPROTECT(3);
    return ans;
}

SEXP rs232_closeComPort(SEXP portNumber) {
    // check that the right types have been passed.
    if(!isInteger(portNumber)) error("portNumber must be an integer.");
    CloseComport(INTEGER(portNumber)[0]);
    return R_NilValue;
}

SEXP rs232_writeByte(SEXP portNumber, SEXP byte) {
    if(SendByte(INTEGER(portNumber)[0], RAW(byte)[0])) error("error writing to com port");
    return R_NilValue;
}

SEXP rs232_writeBytes(SEXP portNumber, SEXP bytes) {
    int i, pn = INTEGER(portNumber)[0], len = Rf_length(bytes);
    unsigned char* p_bytes = RAW(bytes);
    for(i=0; i<len; ++i, ++p_bytes) if(SendByte(pn, *p_bytes)) error("error writing to com port");
    return R_NilValue;
}

SEXP rs232_writeString(SEXP portNumber, SEXP text) {
    char const* chars = CHAR(text);
    while(*chars != '\0') if(SendByte(INTEGER(portNumber)[0], (unsigned char)*chars)) error("error writing to com port");
    return R_NilValue;
}

SEXP rs232_readBytes(SEXP portNumber, SEXP maxCount) {
    int count, i, mc = INTEGER(maxCount)[0];
    unsigned char buf[4096], *p_buf, *p_res;
    SEXP res;
    if(mc > 4095) mc = 4095;
    count = PollComport(INTEGER(portNumber)[0], buf, mc);
    if(count) {
        PROTECT(res = allocVector(RAWSXP, count));
        p_buf = buf;
        p_res = RAW(res);
        for(i=0; i<count; ++i, ++p_buf, ++p_res) *p_res = *p_buf;
        UNPROTECT(1);
        return res;
    } else {
        return R_NilValue;
    }
}

SEXP rs232_isCTSEnabled(SEXP portNumber) {
    SEXP ans;
    PROTECT(ans = allocVector(INTSXP, 1));
    INTEGER(ans)[0] = IsCTSEnabled(INTEGER(portNumber)[0]);
    UNPROTECT(1);
    return ans;
}
