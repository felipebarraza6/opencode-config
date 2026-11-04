#!/usr/bin/env bash
# Valida la configuración de OpenCode V2 antes de commitear.
# Uso: ./scripts/validate.sh [directorio-de-config]
set -euo pipefail

CONFIG_DIR="${1:-$HOME/.config/opencode}"
CONFIG_FILE="$CONFIG_DIR/opencode.jsonc"

if [ ! -f "$CONFIG_FILE" ]; then
  echo "ERROR: no existe $CONFIG_FILE"
  exit 1
fi

echo "=== Validando configuración de OpenCode V2 ==="

node - "$CONFIG_FILE" <<'NODE'
const fs = require("fs");
const file = process.argv[2];
const raw = fs.readFileSync(file, "utf8");

// JSONC: se quitan comentarios de línea completa (las URLs viven en strings).
const clean = raw.replace(/^\s*\/\/.*$/gm, "").trim();

let cfg;
try {
  cfg = JSON.parse(clean);
} catch (e) {
  console.error("ERROR: opencode.jsonc no parsea:", e.message);
  process.exit(1);
}
console.log("✓ JSONC válido");

const DEPRECATED = ["plugin", "provider", "agent", "permission", "autoupdate", "small_model"];
const found = DEPRECATED.filter((k) => k in cfg);
if (found.length) {
  console.error("ERROR: campos V1 deprecated:", found.join(", "));
  process.exit(1);
}
console.log("✓ Sin campos deprecated");

if (!cfg.model || !/^[^/]+\/[^/]+$/.test(cfg.model)) {
  console.error("ERROR: 'model' debe tener formato provider/modelo:", cfg.model);
  process.exit(1);
}
console.log("✓ Modelo por defecto:", cfg.model);

const REQUIRED = ["orchestrator", "builder", "verifier", "reviewer", "deployer"];
const agents = cfg.agents || {};
const missing = REQUIRED.filter((a) => !(a in agents));
if (missing.length) {
  console.error("ERROR: faltan agentes:", missing.join(", "));
  process.exit(1);
}

let bad = 0;
for (const [id, a] of Object.entries(agents)) {
  if (a.model && !/^[^/]+\/[^/]+$/.test(a.model)) {
    console.error(`ERROR: agente '${id}' tiene modelo inválido: ${a.model}`);
    bad++;
  }
  if (!a.system && !a.description) {
    console.error(`ERROR: agente '${id}' no tiene 'system' ni 'description'`);
    bad++;
  }
  for (const p of a.permissions || []) {
    if (!p.action || !p.resource || !p.effect) {
      console.error(`ERROR: agente '${id}' tiene un permiso incompleto:`, JSON.stringify(p));
      bad++;
    }
    if (!["allow", "deny", "ask"].includes(p.effect)) {
      console.error(`ERROR: agente '${id}' efecto inválido: ${p.effect}`);
      bad++;
    }
  }
}
if (bad) process.exit(1);
console.log(`✓ ${Object.keys(agents).length} agentes coherentes`);

const plugins = cfg.plugins || [];
for (const p of plugins) {
  const ok = typeof p === "string" || (p && typeof p.package === "string");
  if (!ok) {
    console.error("ERROR: entrada de 'plugins' inválida:", JSON.stringify(p));
    process.exit(1);
  }
}
console.log(`✓ ${plugins.length} plugin(s) declarados`);
NODE

echo "=== Validación completada ==="
