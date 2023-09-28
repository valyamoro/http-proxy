CC_LINUX = cc
CC_WINDOWS = x86_64-w64-mingw32-gcc

CFLAGS_LINUX = -I/usr/include/microhttpd.h -lmicrohttpd
LDFLAGS_LINUX = -L/usr/lib/libmicrohttpd.so -lmicrohttpd

CFLAGS_WINDOWS = -I/path/to/windows/include -lmicrohttpd #здесь надо указать путь к загловочному файлу lmicrohttpd.h
LDFLAGS_WINDOWS = -L/path/to/windows/lib -lmicrohttpd #здесь надо указать путь к библиотеке lmicrohttpd.so

SRC = main.c

OUT = main

all: linux

linux: $(SRC)
	$(CC_LINUX) $(CFLAGS_LINUX) -o $(OUT) $(SRC) $(LDFLAGS_LINUX)

windows: $(SRC)
	$(CC_WINDOWS) $(CFLAGS_WINDOWS) -o $(OUT).exe $(SRC) $(LDFLAGS_WINDOWS)

run:
	./$(OUT)
