CC = g++
CFLAGS = -O3 -flto -Wall -Werror -std=c++11

ifeq ($(DEBUG), 1)
	CFLAGS += -g -DDEBUG
endif

ifeq ($(OPENCL_1_1), 1)
	CFLAGS += -DOPENCL_1_1
endif

vramfs: vramfs.cpp types.hpp
	$(CC) $(CFLAGS) -o vramfs vramfs.cpp `pkg-config fuse --cflags --libs` -l OpenCL

.PHONY: clean
clean:
	rm -f vramfs
