CC=turbo cc
CFLAGS=-I$(PWD)/../libyaml/install/include -fPIC
LDFLAGS=-L$(PWD)/../libyaml/install/lib
LDSHARED=$(CC) -Wl,--export=PyInit__yaml

src/build/lib.linux-x86_64-cpython-311/yaml/_yaml.cpython-311-x86_64-linux-gnu.so:
	cd src && \
		CC="$(CC)" LDSHARED="$(LDSHARED)" CFLAGS="$(CFLAGS)" LDFLAGS=$(LDFLAGS) python3.11 setup.py build_ext

.PHONY: clean
clean:
	rm -rf ./src/build
