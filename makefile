VIRTUALENV_WHEEL=wheelhouse/virtualenv-15.1.0-py2.py3-none-any.whl

export PYTHONPATH=$(VIRTUALENV_WHEEL)

PY2BOOTSTRAP=python2.7
PY3BOOTSTRAP=python3

PYTHON2=.env2/bin/python
PYTHON3=.env3/bin/python

PYTHON2SRC=$(wildcard python2/dbpg/*.py) $(wildcard python2/dbpg/*/*.so) $(wildcard python2/dbpg/*/*.py) $(wildcard python2/dbpg/*/*.pyd)
PYTHON3SRC=$(wildcard python3/dbpg/*.py) $(wildcard python3/dbpg/*/*.so) $(wildcard python3/dbpg/*/*.py) $(wildcard python3/dbpg/*/*.pyd)


$(PYTHON2): makefile requirements.txt $(VIRTUALENV_WHEEL)
	@-rm -rf .env2
	@$(PY2BOOTSTRAP) -m virtualenv --prompt="(py2dbpg)" --extra-search-dir=wheelhouse .env2
	@$(PYTHON2) -m pip install -r requirements.txt -f wheelhouse
    
$(PYTHON3): makefile requirements.txt $(VIRTUALENV_WHEEL)
	@-rm -rf .env3
	@$(PY3BOOTSTRAP) -m virtualenv --prompt="(py3dbpg)" --extra-search-dir=wheelhouse .env3
	@$(PYTHON3) -m pip install -r requirements.txt -f wheelhouse


py2wheel: $(PYTHON2) $(PYTHON2SRC) setup2.py
	@$(PYTHON2) setup2.py bdist_wheel
	@$(PYTHON2) setup2.py bdist_src

py3wheel: $(PYTHON3) $(PYTHON3SRC) setup3.py
	@$(PYTHON3) setup3.py bdist_wheel
	@$(PYTHON3) setup3.py bdist_src

wheels: py2wheel py3wheel

clean:
	@-rm -rf bin build dist
	@-rm -rf .env2 .env3
	@-rm -rf *.egg-info
    
default: wheels

all: clean default

.DEFAULT_GOAL := default

.PHONY: all default clean wheels py2wheel py3wheel
