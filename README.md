# bootstrapping
General bootstrapping using Cython

This is a simple library to speed up bootstrap sampling for statistics using Cython. It contains only one useful function,
for which the documentation in the docstring should be easy enough to follow.

To install, clone the repository and simply run

python setup.py install

Of course, you'll need Cython + C compiler for this to work along with Numpy. The best way to make this work is to use
Anaconda and make sure you have gcc installed (on Mac or Linux/Unix) or Visual C++ (on Windows).
