
all: examples-dir

examples-dir: 
	make -C examples

clean: 
	make -C examples clean
