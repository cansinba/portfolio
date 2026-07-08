#!/usr/bin/env bash
# capture.sh — repeatable case-study screenshot capture.
# Produces desktop (1440w) + mobile (375w) PNGs into public/assets/<project>/.
#
# Usage:
#   ./scripts/capture.sh <url> <project> <name>
# Example:
#   ./scripts/capture.sh https://cansinbayir.com/work/sample sample template
#     → public/assets/sample/template-desktop.png
#     → public/assets/sample/template-mobile.png
#
# Env overrides:
#   CHROME=/path/to/chrome   (defaults to the macOS Google Chrome bundle)

set -euo pipefail

URL="${1:?usage: capture.sh <url> <project> <name>}"
PROJECT="${2:?project name required (folder under public/assets/)}"
NAME="${3:?capture name required}"

CHROME="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUTDIR="$ROOT/public/assets/$PROJECT"
mkdir -p "$OUTDIR"

shoot() {
  local w="$1" h="$2" suffix="$3"
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars \
    --window-size="${w},${h}" \
    --screenshot="$OUTDIR/${NAME}-${suffix}.png" "$URL" >/dev/null 2>&1
  echo "  → public/assets/$PROJECT/${NAME}-${suffix}.png (${w}px)"
}

echo "Capturing $URL"
shoot 1440 2400 desktop
shoot 375 2600 mobile
echo "Done."
