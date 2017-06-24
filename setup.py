import sys
from setuptools import setup

version = '10.2.2.89895'

pkgdir = 'python2/dbgp'
vert = '-py2'
scripts = [
    'dbgp = dbgp.__main__:__main__',
     'dbgpClient = dbgp.__main__:__main__',
     'pydbgp = dbgp.__main__:__main__',
     'dbgpproxy = dbgp.proxy:__main__'
     ]

if (sys.version_info > (3, 0)):
    pkgdir = 'python3/dbgp'
    vert='-py3'
    scripts.append(
        'py3_dbgp = dbgp.__main__:__main__')

if 'sdist' in sys.argv:
    ## MASSIVE HACK
    version += vert
    
setup(
    name='komodo-pydbgp',
    author = "Doug Napoleone",
    version=version,
    packages=['dbgp'],
    package_dir={'dbgp': pkgdir},
    package_data={'dbgp': ['*/*.so', '*/*.pyd']},
    entry_points={
        'console_scripts': scripts
    },
    classifiers = [
        'Environment :: Plugins',
        'Intended Audience :: Developers',
        'Programming Language :: Python :: 2',
        'Programming Language :: Python :: 2.3',
        'Programming Language :: Python :: 2.4',
        'Programming Language :: Python :: 2.5',
        'Programming Language :: Python :: 2.6',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.0',
        'Programming Language :: Python :: 3.1',
        'Programming Language :: Python :: 3.2',
        'Programming Language :: Python :: 3.3',
        'License :: OSI Approved :: MIT License',
        'Operating System :: MacOS',
        'Operating System :: Microsoft :: Windows',
        'Operating System :: POSIX :: Linux',
        
    ],
    
)
