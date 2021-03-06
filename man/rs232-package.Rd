\name{rs232-package}
\alias{rs232-package}
\alias{rs232}
\docType{package}

\title{A very small interface for talking to an rs232 thingy.}

\description{
Provides a very simple interface to talk to rs232 devices. This is a very thin wrapper over
the interface provided by the library http://www.teuniz.net/RS-232/. Further advice
and documenation can be found there.

The Author of this packages has never tested nor used it (at the time of writing he did not
have access to a machine with com ports). The package thrown together quickly
for someone else to see if they had any use for it. If they do (or anyone else does),
then maybe more work will be done on it... so please let me know if it is any use to you!
}

\details{
\tabular{ll}{
Package: \tab rs232\cr
Type: \tab Package\cr
Version: \tab 0.1.1\cr
Date: \tab 2012-09-18\cr
License: \tab GPL version 2\cr
}
The main functions are \code{\link{openComPort}}, \code{\link{closeComPort}}, \code{\link{writeBytes}}, \code{\link{readBytes}} and \code{\link{writeString}}.
}

\author{
Simon Knapp

Maintainer: Simon Knapp <sleepingwell@gmail.com>
}
