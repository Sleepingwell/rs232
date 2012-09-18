\name{isCTSEnabled}
\alias{isCTSEnabled}

\title{Check the status of the CTS-pin at the serial port.}

\usage{
isCTSEnabled(port)
}

\arguments{
  \item{port}{An object of type \link{rs232-class} opened with a call to \code{\link{openComPort}}.}
}

\value{\code{True} if the CTS-pin is enabled, \code{Fasle} otherwise.}

\author{Simon Knapp}

\examples{
# Open a port and check the status of the CTS pin.
port <- openComPort(as.integer(0), as.integer(110))
bytes <- isCTSEnabled(port)
closeComPort(port)
}
