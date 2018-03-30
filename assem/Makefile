
cpuid:cpuid.o
	ld -dynamic-linker /lib/ld-linux.so.2 -o cpuid cpuid.o -lc -melf_i386
cpuid.o:cpuid.s
	as -o cpuid.o cpuid.s --32

clean:
	rm cpuid.o cpuid
