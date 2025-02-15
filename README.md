# Fixed SSD1306 kernel module for 128x32 display

The display with the 128x32 SSD1306 controller included in the Environmental Sensor Board does not work properly on Raspberry PI (6.6.74+rpt-rpi-v6).
Specifically, the reason is the incorrect configuration of the column and row end addresses for 128x32 resolution, where the driver can handle 128x64 resolution.

The repository contains a fix for the `fb_ssd1306.c` file and a new `ssd1306-spi-128x32.dts` file containing the modified target resolution.

# Building & Install
```sh
mkdir -p ~/Projects
cd ~/Projects
git clone https://github.com/pawel-soja/fb_ssd1306.git
cd fb_ssd1306
make all
```

Now add the line to the `config.txt` file located in the `/boot` directory:
```sh
dtoverlay=ssd1306-spi-128x32
```
