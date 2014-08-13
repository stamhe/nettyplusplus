CC=g++ -g3 -ansi -Wall 
OBJ=\
Select.o \
SelectSocket.o \
SocketPool.o \
Worker.o \
Server.o 

all: $(OBJ)
	ar rs libnetty++.a $(OBJ)

sample: sample.o all
	$(CC) -o sample sample.o $(OBJ) -lMyThread -lpthread -lSocket

.cpp.o:
	$(CC) -c $<

clean:
	rm -f *.o

mrproper: clean
	rm -f *~
	rm -f libnetty++.a
	rm -f server
	rm -f sample

install: all
	mkdir -p /usr/local/include/netty++
	install -D -m 666 *.h /usr/local/include/netty++
	install -D -m 666 *.a /usr/local/lib

