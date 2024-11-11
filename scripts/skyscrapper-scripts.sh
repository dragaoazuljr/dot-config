#!bin/bash

# Gather fase
Skyscraper -p msx -s screenscraper -u $SKYSCRAPER_USER:$SKYSCRAPER_PASS -i "/media/Linux/roms/Microsoft - MSX" -t 4
Skyscraper -p pcengine -s screenscraper -u $SKYSCRAPER_USER:$SKYSCRAPER_PASS -i "/media/Linux/roms/NEC - PC Engine CD - TurboGrafx-CD" -t 4
Skyscraper -p gba -s screenscraper -u $SKYSCRAPER_USER:$SKYSCRAPER_PASS -i "/media/Linux/roms/Nintendo - Game Boy Advance" -t 4
Skyscraper -p gbc -s screenscraper -u $SKYSCRAPER_USER:$SKYSCRAPER_PASS -i "/media/Linux/roms/Nintendo - Game Boy Color" -t 4
Skyscraper -p gc -s screenscraper -u $SKYSCRAPER_USER:$SKYSCRAPER_PASS -i "/media/Linux/roms/Nintendo - GameCube" -t 4
Skyscraper -p n64 -s screenscraper -u $SKYSCRAPER_USER:$SKYSCRAPER_PASS -i "/media/Linux/roms/Nintendo - Nintendo 64" -t 4
Skyscraper -p snes -s screenscraper -u $SKYSCRAPER_USER:$SKYSCRAPER_PASS -i "/media/Linux/roms/Nintendo - Super Nintendo Entertainment System" -t 4
Skyscraper -p dreamcast -s screenscraper -u $SKYSCRAPER_USER:$SKYSCRAPER_PASS -i "/media/Linux/roms/Sega - Dreamcast" -t 4
Skyscraper -p megacd -s screenscraper -u $SKYSCRAPER_USER:$SKYSCRAPER_PASS -i "/media/Linux/roms/Sega - Mega-CD - Sega CD" -t 4
Skyscraper -p megadrive -s screenscraper -u $SKYSCRAPER_USER:$SKYSCRAPER_PASS -i "/media/Linux/roms/Sega - Mega Drive - Genesis" -t 4
Skyscraper -p saturn -s screenscraper -u $SKYSCRAPER_USER:$SKYSCRAPER_PASS -i "/media/Linux/roms/Sega - Saturn" -t 4
Skyscraper -p psx -s screenscraper -u $SKYSCRAPER_USER:$SKYSCRAPER_PASS -i "/media/Linux/roms/Sony - PlayStation" -t 4
Skyscraper -p ps2 -s screenscraper -u $SKYSCRAPER_USER:$SKYSCRAPER_PASS -i "/media/Linux/roms/Sony - PlayStation 2" -t 4
Skyscraper -p ps3 -s screenscraper -u $SKYSCRAPER_USER:$SKYSCRAPER_PASS -i "/media/Linux/roms/Sony - PlayStation 3" -t 4
Skyscraper -p psp -s screenscraper -u $SKYSCRAPER_USER:$SKYSCRAPER_PASS -i "/media/Linux/roms/Sony - PlayStation Portable" -t 4

#Create metada fase
Skyscraper -p msx -f pegasus -i "/media/Linux/roms/Microsoft - MSX"
Skyscraper -p pcengine -f pegasus -i "/media/Linux/roms/NEC - PC Engine CD - TurboGrafx-CD" -t 4
Skyscraper -p gba -f pegasus -i "/media/Linux/roms/Nintendo - Game Boy Advance" -t 4
Skyscraper -p gbc -f pegasus -i "/media/Linux/roms/Nintendo - Game Boy Color" -t 4
Skyscraper -p gc -f pegasus -i "/media/Linux/roms/Nintendo - GameCube" -t 4
Skyscraper -p n64 -f pegasus -i "/media/Linux/roms/Nintendo - Nintendo 64" -t 4
Skyscraper -p snes -f pegasus -i "/media/Linux/roms/Nintendo - Super Nintendo Entertainment System" -t 4
Skyscraper -p dreamcast -f pegasus -i "/media/Linux/roms/Sega - Dreamcast" -t 4
Skyscraper -p megacd -f pegasus -i "/media/Linux/roms/Sega - Mega-CD - Sega CD" -t 4
Skyscraper -p megadrive -f pegasus -i "/media/Linux/roms/Sega - Mega Drive - Genesis" -t 4
Skyscraper -p saturn -f pegasus -i "/media/Linux/roms/Sega - Saturn" -t 4
Skyscraper -p psx -f pegasus -i "/media/Linux/roms/Sony - PlayStation" -t 4
Skyscraper -p ps2 -f pegasus -i "/media/Linux/roms/Sony - PlayStation 2" -t 4
Skyscraper -p ps3 -f pegasus -i "/media/Linux/roms/Sony - PlayStation 3" -t 4
Skyscraper -p psp -f pegasus -i "/media/Linux/roms/Sony - PlayStation Portable" -t 4
