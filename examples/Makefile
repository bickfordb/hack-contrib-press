all: print-env

print-env: PrintEnv.hs ../Hack/Contrib/Press.hs
	ghc -i.. --make -o print-env PrintEnv.hs

clean: 
	- rm print-env
	- rm *.hi *.o
