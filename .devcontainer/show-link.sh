#!/bin/bash
CONFIG="/etc/xray/g2ray.json"
UUID=$(grep -o '"id": *"[^"]*"' "$CONFIG" | head -1 | grep -o '"[^"]*"$' | tr -d '"')
if [ -z "$UUID" ]; then echo "[g2ray] UUID پیدا نشد."; exit 1; fi

SNI="${CODESPACE_NAME}-443.app.github.dev"

# URL-encoded JSON for extra:
# {"xPaddingBytes":"10-50","xPaddingObfsMode":true,"xPaddingMethod":"tokenish","xPaddingPlacement":"queryInHeader","xPaddingKey":"Bertyy","xPaddingHeader":"Bertyy"}
EXTRA='%7B%22xPaddingBytes%22%3A%2210-50%22%2C%22xPaddingObfsMode%22%3Atrue%2C%22xPaddingMethod%22%3A%22tokenish%22%2C%22xPaddingPlacement%22%3A%22queryInHeader%22%2C%22xPaddingKey%22%3A%22Bertyy%22%2C%22xPaddingHeader%22%3A%22Bertyy%22%7D'

LINK="vless://${UUID}@94.130.50.12:443?encryption=none&security=tls&sni=${SNI}&host=${SNI}&fp=chrome&allowInsecure=1&type=xhttp&mode=packet-up&path=%2F&extra=${EXTRA}#dark-node-351a6a"

echo ""
echo "================================================"
echo "  $LINK"
echo "================================================"
echo ""
