\name{writeBytes}
\alias{writeBytes}
\alias{writeByte}
\alias{writeString}

\title{Write byte(s) or a string to a (rs232) port.}

\usage{
writeByte(port, byte)
writeBytes(port, bytes)
writeString(port, string)
}

\arguments{
  \item{port}{An object of type \link{rs232-class} opened with a call to \code{\link{openComPort}}.}
  \item{byte}{A byte (coerced to type \link{raw} using \code{\link{as.raw}}) to be written to \code{port}.}
  \item{bytes}{A vector of bytes (coerced to type \link{raw} using \code{\link{as.raw}}) to be written to \code{port}.}
  \item{string}{A string to be written to \code{port}.}
}

\note{
\code{writeByte} is really redudant and will achieve exactly the same thing as \code{writeBytes} with the
same arguments. \code{writeByte} may however be slightly more efficient for writing single bytes \code{writeBytes}
will be much more efficient for writing multiple bytes.
}

\value{\code{NULL}}

\author{Simon Knapp}

\examples{
# Open a com port
port <- openComPort(0, 110)

# Write the bytes 1 through 5 to it.
writeBytes(port, 1:5)

# Write the byte 42 to it.
writeByte(port, 42)

# Write a string to the port.
writeString(port, 'hello world')

# Close the port.
closeComPort(port)
}
