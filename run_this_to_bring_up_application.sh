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

