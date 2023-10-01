OS := $(shell uname)
OUTPUT_DIR = build

ifeq ($(OS), Linux)
    CC = gcc
    CFLAGS = -Wall -O2
    OUT = main
    RUN_CONMAND = build/./$(OUT)
else ifeq ($(OS), Windows_NT)
    CC = gcc
    CFLAGS = -Wall -O2
    OUT = main.exe
    RUN_CONMAND = build/$(OUT)
else
    $(error Unsupported OS: $(OS))
endif

all:
	make build_file

check_output_dir:
	@if [ ! -d $(OUTPUT_DIR) ]; then \
	mkdir -p $(OUTPUT_DIR); \
	fi \

build_file:
	make check_output_dir;
	$(CC) $(CFLAGS) -o build/$(OUT) main.c

run:
	$(RUN_CONMAND)

clean:
	rm -r build
