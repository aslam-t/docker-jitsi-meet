#!/bin/bash

echo "Update the .debs in web/ with recent versions of"
echo "jitsi-meet-web"
echo "jitsi-meet-web-config"
echo "packages from the build in the jitsi-meet repo!"

JITSI_RELEASE=unstable make

