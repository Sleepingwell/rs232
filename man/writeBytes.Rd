\name{writeBytes}
\alias{writeBytes}
\alias{writeByte}

\title{Write byte(s) to (rs232) port.}

\usage{
writeByte(port, byte)

writeByte(port, bytes)
}

\arguments{
  \item{port}{An object of type \link{rs232-class} opened with a call to \code{\link{openComPort}}.}
  \item{byte}{A byte (coerced to type \link{raw} using as.raw) to be written to \code{port}.}
  \item{bytes}{A vector of bytes (coerced to type \link{raw} using as.raw) to be written to \code{port}.}
}

\note{
\code{writeByte} is really redudant and will achieve exactly the same thing as \code{writeBytes} with the
same arguments.
}

\value{\code{NULL}}

\author{Simon Knapp}

\examples{
port <- openComPort(as.integer(0), as.integer(110))
writeBytes(port, 1:5)
writeByte(port, 42)
closeComPort(port)
}
