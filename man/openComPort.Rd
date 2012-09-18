\name{openComPort}
\alias{openComPort}

\title{Open a com (rs232) port.}

\usage{
openComPort(portNumber, baudRate)
}

\arguments{
  \item{portNumber}{The number of the port (will be coerced to integer by as.integer).}
  \item{baudRate}{The baud rate for the port (will be coerced to integer by as.integer).}
}

\details{
Opens the comport, comportnumber starts with 0 (see the list of numbers).
Baudrate is expressed in baud per second i.e 115200 (see the list of possible baudrates).
}

\section{Warning}{
As I have not tested this package, I'm not sure what the consequences of calling \code{openComPort}
with the same port number are. Futher, I'm not sure what would happen if one did this and then closed
any one of the ports opened... I presume that this would close all of them.
}

\value{An object of type \link{rs232-class}.}

\section{Port Numbers}{
\tabular{lll}{
# \tab Linux \tab windows\cr
0 \tab ttyS0 \tab COM1\cr
1 \tab ttyS1 \tab COM2\cr
2 \tab ttyS2 \tab COM3\cr
3 \tab ttyS3 \tab COM4\cr
4 \tab ttyS4 \tab COM5\cr
5 \tab ttyS5 \tab COM6\cr
6 \tab ttyS6 \tab COM7\cr
7 \tab ttyS7 \tab COM8\cr
8 \tab ttyS8 \tab COM9\cr
9 \tab ttyS9 \tab COM10\cr
10 \tab ttyS10 \tab COM11\cr
11 \tab ttyS11 \tab COM12\cr
12 \tab ttyS12 \tab COM13\cr
13 \tab ttyS13 \tab COM14\cr
14 \tab ttyS14 \tab COM15\cr
15 \tab ttyS15 \tab COM16\cr
16 \tab ttyUSB0 \tab n.a.\cr
17 \tab ttyUSB1 \tab n.a.\cr
18 \tab ttyUSB2 \tab n.a.\cr
19 \tab ttyUSB3 \tab n.a.\cr
20 \tab ttyUSB4 \tab n.a.\cr
21 \tab ttyUSB5 \tab n.a.
}
}

\section{Baud Rates}{
\tabular{ll}{
Linux \tab windows\cr
50 \tab n.a.\cr
75 \tab n.a.\cr
110 \tab 110\cr
134 \tab n.a.\cr
150 \tab n.a.\cr
200 \tab n.a.\cr
300 \tab 300\cr
600 \tab 600\cr
1200 \tab 1200\cr
1800 \tab n.a.\cr
2400 \tab 2400\cr
4800 \tab 4800\cr
9600 \tab 9600\cr
19200 \tab 19200\cr
38400 \tab 38400\cr
57600 \tab 57600\cr
115200 \tab 115200\cr
230400 \tab 128000\cr
460800 \tab 256000\cr
500000 \tab n.a.\cr
576000 \tab n.a.\cr
921600 \tab n.a.\cr
1000000 \tab n.a.
}
}

\author{Simon Knapp}

\examples{
port <- openComPort(as.integer(0), as.integer(110))
bytes <- readBytes(port)
closeComPort(port)
}
