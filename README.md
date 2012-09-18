A very simple R package for Windows and Linux for reading/writing from/to an rs232 port.

# Getting the R package

You can get the latest source and windows binary versions of the package under the [download link](https://github.com/Sleepingwell/rs232/downloads).

# Building the R Package From Source

- Clone this repository into a directory named rs232.

### Windows Specific

- Install the appropriate version of [Rtools](http://cran.r-project.org/bin/windows/Rtools/) for your version of R.

- Make sure the appropriate paths are on the system path. I use the command:
    <pre><codeblock>set PATH=C:\R\R-2.14.1\bin;C:\Rtools\bin;C:\Rtools\MinGW\bin;C:\Rtools\MinGW64\bin;%PATH%</codeblock></pre>
from a batch file on my machine.

- To build the windows version (rs232\_&lt;version&gt;.zip) of the package, run the command:
    <pre><codeblock>R CMD INSTALL --build rs232</codeblock></pre>
from the directory above the directory rs232

### Windows and Linux

- To build the source version of the package, type:
    <pre><codeblock>R CMD build gridsum</codeblock></pre>
to build the gzip version (rs232_&lt;version&gt;.gz) of the package.

- To install direcly you can type
<pre><codeblock>R CMD INSTALL rs232</codeblock></pre>

#Learning

Once the package is installed, you can type:
<pre><codeblock>library(rs232)
?rs232</codeblock></pre>
To access the package documentation.

# Warning

At the time of writing, the author did not have easy access to a machine with serial ports... and hence this code has not been tested. Please let me know if it has bugs.
