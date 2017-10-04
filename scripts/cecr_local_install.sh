#!/usr/bin/env bash
DRUSH="./vendor/bin/drush"
SITE_ALIAS="@cecr.cecr.dev"
SITE_UUID="38a4f0bd-03fa-41a2-ba03-13282e717797"
$DRUSH $SITE_ALIAS cc drush
echo "Installing..."
$DRUSH $SITE_ALIAS si cecr --account-pass=admin -y
echo "Set site uuid..."
$DRUSH $SITE_ALIAS config-set "system.site" uuid "$SITE_UUID" -y
echo "Importing config..."
if [ -f ./config/sync/core.extension.yml ] ; then $DRUSH $SITE_ALIAS cim -y ; fi
echo "Cleaning cache..."
$DRUSH $SITE_ALIAS cr
