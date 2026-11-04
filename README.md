# Configuración personal de OpenCode V2

Configuración portable de OpenCode: agentes, permisos, modelos, reglas y skills.

## Qué incluye

| Archivo | Contenido |
|---|---|
| `opencode.jsonc` | Modelo por defecto, agentes (orchestrator, builder, verifier, reviewer, deployer), permisos y plugin DCP |
| `cli.json` | Preferencias de la TUI (tema, diffs, sidebar) |
| `dcp.jsonc` | Configuración de Dynamic Context Pruning |
| `rules/` | Reglas globales: idioma (español chileno) e ingeniería de software |
| `skills/` | Skills propias del flujo de trabajo |
| `AGENTS.md` | Convenciones de trabajo para agentes |
| `scripts/validate.sh` | Valida la config antes de commitear |

## Instalación en un equipo nuevo

```sh
# 1. Clonar en la ruta que OpenCode lee por defecto
git clone <URL-DEL-REPO> ~/.config/opencode

# 2. Autenticarse (las credenciales NO se versionan)
opencode auth login

# 3. Abrir OpenCode
#    En el primer arranque instala @tarquinen/opencode-dcp@3.2.0 solo.
opencode
```

Si `~/.config/opencode` ya existe:

```sh
mv ~/.config/opencode ~/.config/opencode.old
git clone <URL-DEL-REPO> ~/.config/opencode
```

## Requisitos

- OpenCode V2
- `bun` instalado (OpenCode lo usa para instalar plugins)
- Suscripción `opencode-go` activa

## Qué NO se versiona

- `service.json`: contraseña del servicio local. Se regenera solo.
- `node_modules/`, `package.json`, `bun.lock`: los recrea OpenCode.
- Credenciales y sesiones: viven en `~/.local/share/opencode/` y se crean con `opencode auth login`.

## Perfil de modelos

Optimizado para costo:

| Agente | Modelo | USD in/out por millón |
|---|---|---|
| default / orchestrator / builder | `deepseek-v4.1-flash` | 0.15 / 0.60 |
| verifier / deployer | `mimo-v2.6-flash` | 0.14 / 0.28 |
| reviewer | `qwen3.8-flash` | 0.15 / 0.47 |

Cambiar el modelo de una sesión puntual sin tocar el repo: `/models` en la TUI.

## Antes de commitear

```sh
./scripts/validate.sh
```

Verifica que el JSONC parsee, que no queden campos V1 deprecated, que `model`
tenga formato `provider/modelo` y que los agentes y permisos estén completos.
