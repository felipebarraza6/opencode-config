#!/usr/bin/env bash
set -euo pipefail

echo "=== Validando configuración de OpenCode ==="

CONFIG_FILE="$HOME/.config/opencode/opencode.jsonc"

if [ ! -f "$CONFIG_FILE" ]; then
  echo "ERROR: No existe $CONFIG_FILE"
  exit 1
fi

echo "→ Parseando opencode.jsonc..."
node -e "
const fs = require('fs');
const txt = fs.readFileSync('$CONFIG_FILE', 'utf8');
JSON.parse(txt);
console.log('✓ opencode.jsonc es JSON válido');
"

echo "→ Verificando agentes configurados..."
node -e "
const fs = require('fs');
const config = JSON.parse(fs.readFileSync('$CONFIG_FILE', 'utf8'));
const expected = ['orchestrator', 'builder', 'verifier', 'reviewer', 'deployer'];
const actual = Object.keys(config.agent || {});
const missing = expected.filter(a => !actual.includes(a));
if (missing.length > 0) {
  console.error('ERROR: Faltan agentes:', missing.join(', '));
  process.exit(1);
}
console.log('✓ Agentes esperados presentes:', actual.join(', '));
"

echo "→ Probando carga de OpenCode..."
opencode --version

echo "=== Validación completada ==="
