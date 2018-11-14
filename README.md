# Spotify in Docker with Alsa Sound

This will build & run Spotify in a docker container in linux.

If you have a high quality amplifier and headphones, you will hear a big difference between the default PulseAudio driver and the raw ALSA sound driver.

## Usage

  - Find the card & output device you want to use. 
    - Run ``cat /proc/asound/cards`` to list the cards, find the card number ($N)
    - Run ``ls -l /proc/asound/card$N/$DEVICE/info`` to find the device you want to use
    - Modify the .asoundrc to specify that card & device number
  - Run ``./build.sh`` to build the docker container
  - Run ``./run.sh`` to run spotify

