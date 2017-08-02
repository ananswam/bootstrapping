# bootstrapping
General bootstrapping using Cython

This is a simple library to speed up bootstrap sampling for statistics using Cython. It contains only one useful function,
for which the documentation in the docstring should be easy enough to follow.

To install, clone the repository and simply run

<code>
python setup.py install
</code>

Of course, you'll need Cython + C compiler for this to work along with Numpy. The best way to make this work is to use
Anaconda and make sure you have gcc installed (on Mac or Linux/Unix) or Visual C++ (on Windows).

## Usage

Run the following command after installation to test the package.

<code>
python bootstrap_test.py
</code>

This should generate a random sample of standard normal variables and then use bootstrapping to estimate the distribution of the standard deviation. This should create a histogram of the bootstrapped standard deviations that is centered around 1.0. The function call should be illustrative enough to show how to use the bootstrap function in general.
