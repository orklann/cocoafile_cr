CC = cc
CFLAGS = -O2 -fPIC
AR = ar
TARGET = libcocoafile.a

all: $(TARGET)

$(TARGET): cocoafile.o
	$(AR) rcs $(TARGET) cocoafile.o

cocoawebview.o: cocoafile.m
	$(CC) $(CFLAGS) -c cocoafile.m

clean:
	rm -f *.o *.a
