# SP-TFF
Overview
SeisPolPy is an open-source project which aims to provide a Python library for processing seismic time series. So far, SeisPolPy provides two, well known, methods that allow the extraction of relevant information from the seismological time series (see [CIT1975], [CIT1986]), as well as a new method developed by the authors. This latter method (RSTFR) consists of an adaptation of already existing methods and improves them by presenting the option of taking advantage of sparsity to process the data.

SeisPolPy main objective is to empower its users with reliable and efficient methods to make the task of processing seismic time series more straightforward.

Installation
SeisPolPy is currently running and tested on Linux (32 and 64 bit) with Python 3.8.

PyPI
For installing the package through PyPI just run:

pip3 install SeisPolPy
or:

python3 -m pip install SeisPolPy
Building and Installing
To build the SeisPolPy library, in the root folder, run:

python3 -m build
which will generate the .whl and .tar.gz files and place them inside the folder dist. Having generated these files, still in the root folder, run:

pip3 install dist/SeisPolPy-**replacewithcurrentversion**-py3-none-any.whl
or:

pip3 install dist/SeisPolPy-**replacewithcurrentversion**.tar.gz
Note

After finishing the library installation, please download the folder sharedClib, here present, and place the .so files in the folder where the SeisPolPy functions are being imported. These were created with the Cython package to improve the code efficiency, which was necessary, due to the high complexity present in the matrices operations performed in some of the implemented methods.

Note

SeisPolPy is not yet available at PyPI. The library will only be uploaded upon it's release.

Example
Documentation and Changelog
Both the documentation and changelog can be found at SeisPolPydocs.

Contribution
We encourage everyone to contribute to SeisPolPy progress. We can't do this without you!

Contributors
Eduardo Almeida - Maintainer - EduardoAlm
Hamzeh Mohammadigheymasi - Maintainer - Hamzeh
Paul Crocker - Maintainer - crockercaria
See also the list of all the contributors that participated in this project.

License
This project is licensed under the MIT License - check the LICENSE file for details.

References
[CIT1975]	Flinn, E. A. "Signal analysis using rectilinearity and direction of particle motion." Proceedings of the IEEE 53.12 (1965): 1874-1876.
[CIT1986]	Vidale, John E. "Complex polarization analysis of particle motion." Bulletin of the Seismological society of America 76.5 (1986): 1393-1405.
