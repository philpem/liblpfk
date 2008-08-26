CFLAGS=-fPIC -g -I./include
SONAME=liblpfk.so.1

.PHONY:	all clean

all:	liblpfk.so lpfktest lpfklife
	ldconfig -n .

clean:
	-rm -f lpfktest liblpfk.so*
	-rm -f src/*.o test/*.o
	-rf -f src/*~ test/*~ *~

liblpfk.so:	src/liblpfk.o
	$(CC) -shared -Wl,-soname,$(SONAME) -o $@ $<

lpfktest:	test/lpfktest.o
	$(CC) -o $@ $< -L. -llpfk

lpfklife:	test/lpfklife.o
	$(CC) -o $@ $< -L. -llpfk

