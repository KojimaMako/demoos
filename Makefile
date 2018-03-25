#AS=i686-elf-as
#LD=i686-elf-ld
#OBJCOPY=i686-elf-objcopy
AS=as
LD=ld
OBJCOPY=objcopy
QEMU=qemu-system-i386

LDFALGS += -Ttext 0

.PHONY=clean all run


all: bootsect

bootsect: bootsect.s
	$(AS) -o bootsect.o bootsect.s
	$(LD) $(LDFALGS) -o bootsect bootsect.o
	cp -f bootsect bootsect.sym
	$(OBJCOPY) -R .pdr -R .comment -R .note -S -O binary bootsect

run: bootsect
	$(QEMU) -boot a -fda bootsect


clean:
	rm -f  bootsect *.o bootsect.sym
