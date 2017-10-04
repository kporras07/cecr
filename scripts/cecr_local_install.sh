#!/usr/bin/env bash
SITE_UUID="38a4f0bd-03fa-41a2-ba03-13282e717797"
ahoy drush cc drush
echo "Installing..."
ahoy drush si cecr --account-pass=admin -y
echo "Set site uuid..."
ahoy drush config-set "system.site" uuid "$SITE_UUID" -y
echo "Importing config..."
if [ -f ./config/sync/core.extension.yml ] ; then ahoy drush cim -y ; fi
echo "Cleaning cache..."
ahoy drush cr
