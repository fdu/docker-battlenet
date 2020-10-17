#!/bin/sh

WINE_BIN=/opt/wine-staging/bin/wine
BATTLENET_BIN="$HOME/.wine/drive_c/Program Files (x86)/Battle.net/Battle.net.exe"
if [ ! -f "$BATTLENET_BIN" ]; then
  echo "Battle.net not found, assuming first run"
  $WINE_BIN /tmp/Battle.net-Setup.exe
fi
$WINE_BIN "$BATTLENET_BIN"
sleep infinity
