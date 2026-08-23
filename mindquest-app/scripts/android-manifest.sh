#!/usr/bin/env bash
# Ergaenzt die Berechtigung fuer den Schrittzaehler (Android 10+).
set -e
M="android/app/src/main/AndroidManifest.xml"
[ -f "$M" ] || { echo "AndroidManifest nicht gefunden — erst 'npx cap add android' laufen lassen."; exit 1; }
grep -q ACTIVITY_RECOGNITION "$M" || \
  sed -i.bak 's|<application|<uses-permission android:name="android.permission.ACTIVITY_RECOGNITION" />\n\n    <application|' "$M"
echo "AndroidManifest ergaenzt."
