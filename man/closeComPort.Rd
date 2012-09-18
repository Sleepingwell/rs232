\name{closeComPort}
\alias{closeComPort}
\alias{close.rs232}

\title{Close a com (rs232) port.}

\usage{
closeComPort(port)
close(port)
}

\arguments{
  \item{port}{An object of type \link{rs232-class} opened with a call to \code{\link{openComPort}}.}
}

\value{\code{NULL}}

\section{Warning}{
As I have not tested this package, I'm not sure what the consequences of calling \code{openComPort}
with the same port number are. Futher, I'm not sure what would happen if one did this and then closed
any one of the ports opened... I presume that this would close all of them.
}

\author{Simon Knapp}

\seealso{\code{\link{openComPort}}.}

\examples{
port <- openComPort(as.integer(0), as.integer(110))
bytes <- readBytes(port)
closeComPort(port)
# or
close(port)
}
