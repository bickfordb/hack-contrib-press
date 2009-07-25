all: print-env small

print-env: PrintEnv.hs ../Hack/Contrib/Press.hs
	ghc -i.. --make -o print-env PrintEnv.hs

small: Small.hs ../Hack/Contrib/Press.hs
	ghc -i.. --make -o small Small.hs

clean: 
	- rm print-env
	- rm small
	- rm *.hi *.o
