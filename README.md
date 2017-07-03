# komodo-pydbgp
Repackaging of the Komodo python remote debugging package for building into usable python wheels.

Works with all versions of python 2.2->2.7 and 3.0->3.6, with sane backoff to pure python implementations when 
the pre-compiled shared library extensions are not available (which is rare). Tested with Komodo 9.2 and 10.2.2
Using the 10.2.2.89895 build of the Komodo Python remote debugging bindings. Exact packages used can be found in 
the __pkgs__ directory.

```bash
$ pip install komodo-pydbgp
$ pydbgp --help
$ dbgpproxy --help
$ pydbgp -d localhost:9000 myscript.py
```

```python-interpreter
>>> import dbgp.client
>>> dbgp.client.brk()
```

general instructions on using the Komodo remote debugger can be found here: http://docs.activestate.com/komodo/9.2/debugpython.html#debugpython_top

The origional packages can be downloaded from ActiveState: http://code.activestate.com/komodo/remotedebugging/
