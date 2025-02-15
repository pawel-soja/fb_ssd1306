
.PHONY: all overlays overlays_install modules modules_install clean

all: overlays overlays_install modules modules_install
	sudo depmod -a
	sudo update-initramfs -u

modules:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD)/fbtft modules

modules_install:
	sudo make -C /lib/modules/$(shell uname -r)/build M=$(PWD)/fbtft modules_install

overlays/%.dtbo: overlays/%.dts
	dtc -@ -I dts -O dtb -o $@ $<

overlays: overlays/ssd1306-spi-128x32.dtbo

overlays_install:
	sudo cp overlays/*.dtbo /boot/firmware/overlays/

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD)/fbtft clean
	rm overlays/*.dtbo
