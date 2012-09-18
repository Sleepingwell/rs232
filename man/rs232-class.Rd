\name{rs232-class}
\Rdversion{1.1}
\docType{class}
\alias{rs232-class}

\title{Class \code{"rs232"}}

\description{Encapsulates access to a com (rs232) port.}

\section{Objects from the Class}{
Objects of this class MUST be create by calling \code{\link{openComPort}} and \strong{**MUST NOT**} be created
by calls of the form \code{new("rs232", ...).}
}

\section{Slots}{
  \describe{
    \item{\code{portNumber}:}{Object of class \code{"integer"} containing the number of the port.}
    \item{\code{baudRate}:}{Object of class \code{"integer"} containing the baud rate of the port.}
  }
}

\section{Methods}{
No methods defined with class "rs232" in the signature.
}

\author{Simon Knapp}

\examples{
# Show the details of the class
showClass("rs232")

# Open, use and close the port.
port <- openComPort(0, 110)
bytes <- readBytes(port)
closeComPort(port)
}

\keyword{classes}
