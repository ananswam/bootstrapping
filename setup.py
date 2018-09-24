from distutils.core import setup
from Cython.Build import cythonize
from numpy import get_include
from distutils.extension import Extension
import os

numpyInclude = [get_include(), '.']


sourceFiles = ['random.pyx', 'lib.pyx']


ext_options = {}
ext_options['language'] = 'c'
ext_options['include_dirs'] = numpyInclude
extra_compile_args = []


# building part
modulename = 'bootstrapping'
extensions = [Extension(modulename+'.'+s.split('.')[0],[s], **ext_options) for s in sourceFiles]

setup(
    name = modulename,
    packages = [modulename],
    package_dir = {modulename : '.'},
    package_data = {modulename: ['random.pxd', 'lib.pxd']},
    ext_modules = cythonize(extensions)

)

