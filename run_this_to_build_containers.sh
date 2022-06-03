#!/bin/bash

echo "Update the .debs in web/ with recent versions of"
echo "jitsi-meet-web"
echo "jitsi-meet-web-config"
echo "packages from the build in the jitsi-meet repo!"

JITSI_RELEASE=unstable make

# or to update containers from docker hub:

JITSI_RELEASE=unstable FORCE_REBUILD=1 make

# if you want to keep known-good versions, tag the "latest" containers
# for i in prosody web jvb jicofo jibri ;  do docker image tag jitsi/$i:latest jitsi/$i:latesttestok ; done

