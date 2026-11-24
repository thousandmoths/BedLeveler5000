#!/usr/bin/env bash
# Run Bed Leveler 5000 from source on any Linux distro (incl. Arch/CachyOS).
# Uses a private venv with the pinned PySide6 wheel, which bundles Qt Data
# Visualization, so no system Qt packages are needed.
# Usage: ./run_from_source.sh [BedLeveler5000|PrinterInfoWizard|InspectorG-code]
set -euo pipefail
here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
venv="$here/.venv"
app="${1:-BedLeveler5000}"
if [ ! -x "$venv/bin/python" ]; then
    python3 -m venv "$venv"
    "$venv/bin/pip" install -r "$here/Buildsystem/requirements-runtime.txt"
fi
exec "$venv/bin/python" "$here/src/$app.py"
