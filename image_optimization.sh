#!/bin/bash 

# Resize images to max of 2000 pixels wide or tall
find /var/www/html/EspoCRM/data/upload/ * -exec convert \{} -verbose -resize 2000x2000\> \{} \;

# Optmize PNGs
pngquant /var/www/html/EspoCRM/data/upload/* --ext '' --force --skip-if-larger

# Optimize JPGs 
# prior to 2023-11-15
# find /var/www/html/EspoCRM/data/upload/* -exec jpegoptim -m 80 -t \{} \;
# 2023-11-15 MJG 
find /var/www/html/EspoCRM/data/upload/* -exec jpegoptim --nofix -T 5 -m 80 -t \{} \;

