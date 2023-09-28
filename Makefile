compile:
	cc main.c -o main -I$/usr/include/microhttpd.h -L$/usr/lib/libmicrohttpd.so -lmicrohttpd
run:
	./hellobrowser
