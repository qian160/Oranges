foo=1.c
pwd=/home/s081/MyOS
boot:clearlog
	nasm -o boot.bin boot.asm
	dd if=boot.bin of=boot.img bs=512 count=1 conv=notrunc
	
pm:clearlog
	nasm -o pmtest.bin pmtest.asm
	dd if=pmtest.bin of=pmtest.img bs=512 count=1 conv=notrunc
clean:clearlog
	rm boot.bin
	rm pmtest.bin
	rm pmtest2.com
	rm pmtest2.bin
	
mount:clearlog
	nasm -o pmtest3.com pmtest3.asm
	sudo mount -o loop pm.img /mnt/floppy
	sudo cp pmtest3.com /mnt/floppy
	sudo umount /mnt/floppy

echo:clearlog
	echo 1
	echo 2
	echo $(foo)
	echo $(pwd)

clearlog:
	cat /dev/null > bochsout.txt
