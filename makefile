OCAMLC ?= ocamlc
CC ?= gcc

default: bytecode

bytecode:
	mkdir -p bin
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
	rm -f *.o
