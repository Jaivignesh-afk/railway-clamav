#!/bin/sh
# Injects CLAMD_CONF_* and FRESHCLAM_CONF_* environment variables into their
# respective configuration files. This script is based on:
# https://github.com/mko-x/docker-clamav/blob/136fd83e5a7bad2e63fc87497be45d11eb838e94/debian/buster/envconfig.sh
set -e

# These paths should be kept in sync with upstream image specifications:
# https://github.com/Cisco-Talos/clamav-docker/blob/main/clamav/1.3/alpine/Dockerfile#L62-L85
CLAMD_CONF_FILE_PATH="/clamav/etc/clamav/clamd.conf"
FRESHCLAM_CONF_FILE_PATH="/clamav/etc/clamav/freshclam.conf"

for OUTPUT in $(env | awk -F "=" '{print $1}' | grep "^CLAMD_CONF_"); do
    test "$OUTPUT" = "CLAMD_CONF_FILE" && continue  # skip configuration file variable

    TRIMMED="${OUTPUT/CLAMD_CONF_/}"
    grep -q "^$TRIMMED " $CLAMD_CONF_FILE_PATH && sed "s/^$TRIMMED .*/$TRIMMED ${!OUTPUT}/" -i $CLAMD_CONF_FILE_PATH ||
        sed "$ a\\$TRIMMED ${!OUTPUT}" -i $CLAMD_CONF_FILE_PATH
done

for OUTPUT in $(env | awk -F "=" '{print $1}' | grep "^FRESHCLAM_CONF_"); do
    test "$OUTPUT" = "FRESHCLAM_CONF_FILE" && continue  # skip configuration file variable

    TRIMMED="${OUTPUT/FRESHCLAM_CONF_/}"
    grep -q "^$TRIMMED " $FRESHCLAM_CONF_FILE_PATH && sed "s/^$TRIMMED .*/$TRIMMED ${!OUTPUT}/" -i $FRESHCLAM_CONF_FILE_PATH ||
        sed "$ a\\$TRIMMED ${!OUTPUT}" -i $FRESHCLAM_CONF_FILE_PATH
done
