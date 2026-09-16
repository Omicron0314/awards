#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
lean --version
lake build --wfail
lake env lean -DwarningAsError=true Proof.lean
python3 - <<'PY'
from pathlib import Path
import re
text = Path('Proof.lean').read_text()
found = re.search(r'\b(sorry|admit|axiom|unsafe|extern|native_decide|partial)\b', text)
if found:
    raise SystemExit(f'Prohibited token: {found.group()}')
print('Lean source scan passed.')
PY
lake env leanchecker --verbose Proof
echo 'Bundled kernel replay passed (not an independent checker implementation).'
