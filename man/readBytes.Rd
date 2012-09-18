\name{readBytes}
\alias{readBytes}

\title{Read a number of bytes from a (rs232) port.}

\usage{
readBytes(port, maxCount = 4095)
readByte(port)
}

\arguments{
  \item{port}{An object of type \link{rs232-class} opened with a call to \code{\link{openComPort}}.}
  \item{maxCount}{The maximum number of bytes to read from the port. Values of greater than 4095 will be reduced to 4095.}
}

\details{
\code{readByte(port)} reads a single byte and is equivalent to \code{readBytes(port, maxCount=1)}.
}

\value{
A vector of bytes (type \link{raw}).
}

\author{Simon Knapp}

\examples{
port <- openComPort(as.integer(0), as.integer(110))
bytes <- readBytes(port)
closeComPort(port)
}
