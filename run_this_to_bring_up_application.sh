# Run normally (e.g. without any proxy)

cp env.example .env
./gen-passwords.sh
mkdir -p ~/.jitsi-meet-cfg/{web,transcripts,prosody/config,prosody/prosody-plugins-custom,jicofo,jvb,jigasi,jibri}

## adjust config

nano .env

## fill/adjust
### PUBLIC_URL
### DOCKER_HOST_ADDRESS


docker-compose -f docker-compose-latest.yml up -d

## access on https://serbski-inkubator.de:8443

# Add recording & livestreaming to normal setup

## set up alsa loop device

### configure 5 capture/playback interfaces
echo "options snd-aloop enable=1,1,1,1,1 index=0,1,2,3,4" > /etc/modprobe.d/alsa-loopback.conf

### setup autoload the module
echo "snd-aloop" >> /etc/modules

### load module explicitly (if not loaded after reboot)
modprobe snd_aloop

### check that the module is loaded
lsmod | grep snd_aloop

## adjust config

### ENABLE_RECORDING=1
### JIBRI_LOGS_DIR=/config/logs/
### and maybe some more which do not have defaults

## different startup procedure

docker-compose -f docker-compose-latest.yml -f jibri-latest.yml up -d
