CFLAGS=-fPIC -g -I./include
SONAME=liblpfk.so.1

.PHONY:	all clean

all:	liblpfk.so lpfktest
	ldconfig -n .

clean:
	-rm -f lpfktest
	-rm -f liblpfk.so*
	-rm -f src/*.o
	-rm -f test/*.o

liblpfk.so:	src/liblpfk.o
	$(CC) -shared -Wl,-soname,$(SONAME) -o $@ $<

lpfktest:	test/lpfktest.o
	$(CC) -o $@ $< -L. -llpfk
