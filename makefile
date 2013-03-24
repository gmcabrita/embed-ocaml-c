OCAMLC ?= ocamlc
CC ?= gcc

default: bytecode

bytecode:
	mkdir -p bin
	$(OCAMLC) -i call.ml > call.mli
	$(OCAMLC) -c call.mli
	$(OCAMLC) -c call.ml
	$(OCAMLC) -c call_test.c
	ocamlmklib -o call_test_stubs call_test.o
	$(OCAMLC) -a -custom -o call.cma call.cmo -dllib dllcall_stubs.so
	$(OCAMLC) -output-obj call.ml -o call.o
	$(CC) -c call_test.c -o call_test.o -I"`ocamlc -where`" -lm -ldl
	$(CC) -o bin/call_test call.o call_test.o -L"`ocamlc -where`" -lcamlrun -lm -ldl -lcurses


run: default
	./bin/call_test


clean:
	rm -f bin/*
	rm -f *.cmi
	rm -f *.cmx
	rm -f *.cmo
	rm -f *.mli
	rm -f *.cma
	rm -f *.so
	rm -f *.o
	rm -f *.a
