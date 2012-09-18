\name{writeString}
\alias{writeString}

\title{Write a string to (rs232) port.}

\usage{
writeString(port, string)
}

\arguments{
  \item{port}{An object of type \link{rs232-class} opened with a call to \code{\link{openComPort}}.}
  \item{string}{A string to be written to \code{port}.}
}

\value{\code{NULL}}

\author{Simon Knapp}

\examples{
port <- openComPort(as.integer(0), as.integer(110))
writeString(port, 'hello world')
closeComPort(port)
}
