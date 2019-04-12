#!/bin/sh

WINE_BIN=/opt/wine-staging/bin/wine
BATTLENET_BIN='/root/.wine/drive_c/Program Files (x86)/Battle.net/Battle.net.exe'
if [ ! -f "$BATTLENET_BIN" ]; then
  echo "Battle.net not found, assuming first run"
  $WINE_BIN /root/.wine/drive_c/Battle.net-Setup.exe
fi
$WINE_BIN "$BATTLENET_BIN"
sleep infinity
