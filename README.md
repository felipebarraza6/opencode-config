# 🧠 OpenCode Global Config

> Configuración personal de [OpenCode](https://opencode.ai) para trabajar con agentes especializados en ingeniería de software. Hecha por [@felipebarraza6](https://github.com/felipebarraza6).

Esta configuración convierte a OpenCode en un orquestador de flujo de trabajo, no en un simple chatbot que escribe código. La idea es simple: **antes de construir, se planifica; antes de publicar, se verifica y se revisa.**

---

## ✨ ¿Qué es esto?

OpenCode es una herramienta poderosa, pero con un agente genérico puede perderse entre "haz esto", "arregla aquello" y "¿por qué cambiaste ese archivo?". Esta config organiza el trabajo en **cinco roles especializados**, cada uno con permisos mínimos y un modelo acorde a su tarea.

El flujo es:

```
Especificar → Planificar → Construir → Verificar → Revisar → Publicar
```

Y la IA nunca despliega a producción sin que un humano diga "sí, dale".

---

## 🎭 Los cinco agentes

| Agente | Rol | Modelo | Proveedor | Permisos |
|---|---|---|---|---|
| **🧭 Orchestrator** | Analiza el repo, entiende el objetivo y escribe un plan verificable. | `kimi-code/k3` | Kimi Code directo | Lee y planifica. No edita ni ejecuta bash. |
| **🔨 Builder** | Implementa el plan aprobado, agrega tests y valida localmente. | `kimi-code/kimi-for-coding` | Kimi Code directo | Lee y edita. Pregunta antes de bash. |
| **✅ Verifier** | Ejecuta tests, lint y type checking. Solo reporta evidencia. | `kimi-code/kimi-for-coding` | Kimi Code directo | Lee y ejecuta bash. No edita. |
| **🔍 Reviewer** | Revisa el diff contra criterios de aceptación, seguridad y calidad. | `kimi-code/k3` | Kimi Code directo | Revisa. No edita en la primera pasada. |
| **🚀 Deployer** | Prepara release, migraciones y comandos de deploy. | `kimi-code/kimi-for-coding-highspeed` | Kimi Code directo | Prepara. Nunca deploya solo. |

Todos los modelos de Kimi se usan a través del proveedor **Kimi Code directo** (`https://api.kimi.com/coding/v1`), usando tu propia suscripción.

---

## 🚀 Instalación

1. Clona este repo donde quieras tenerlo como referencia:

```bash
git clone https://github.com/felipebarraza6/opencode-config.git
```

2. Copia la configuración a tu directorio global de OpenCode:

```bash
cp opencode-config/opencode.jsonc ~/.config/opencode/opencode.jsonc
cp opencode-config/rules/chileno.md ~/.config/opencode/rules/
cp opencode-config/rules/software-engineering.md ~/.config/opencode/rules/
cp -r opencode-config/skills/* ~/.config/opencode/skills/
```

3. **Agrega tu API key de Kimi Code** en el archivo local (nunca en el repo):

```bash
# Edita ~/.config/opencode/opencode.jsonc
# Busca la sección "kimi-code" y reemplaza:
# "apiKey": ""
# por:
# "apiKey": "tu-api-key-de-kimi-code"
```

> 🔒 **Nunca subas tu API key.** El repo público tiene `"apiKey": ""` como placeholder y `.gitignore` ignora archivos sensibles.

4. Verifica que todo cargue bien:

```bash
opencode --version
```

---

## 🕹️ Uso

Desde la terminal, invoca al agente que corresponda:

```bash
opencode @orchestrator "Necesito agregar un endpoint de login con OAuth2"
```

```bash
opencode @builder "Implementa el plan del archivo docs/tasks/2026-08-06-login-oauth2.md"
```

```bash
opencode @verifier "Ejecuta todas las validaciones del proyecto"
```

```bash
opencode @reviewer "Revisa el diff de la rama feature/login-oauth2"
```

```bash
opencode @deployer "Prepara el deploy a staging del release v1.4.0"
```

---

## 📁 Estructura del repo

```
opencode-config/
├── opencode.jsonc              # Configuración principal de OpenCode
├── AGENTS.md                   # Reglas globales para cualquier proyecto
├── rules/
│   ├── chileno.md              # Barrera lingüística: español neutro chileno
│   └── software-engineering.md # Principios, flujo y restricciones
├── skills/
│   ├── analyze-repository/     # SKILL.md
│   ├── plan-feature/
│   ├── implement-change/
│   ├── run-validation/
│   ├── review-diff/
│   └── prepare-deploy/
├── scripts/
│   └── validate.sh             # Script para validar la config
└── README.md                   # Este archivo
```

---

## 🛡️ Principios que rigen esta config

1. **Primero especificar, después implementar.**
2. **Una responsabilidad por agente.**
3. **La evidencia es obligatoria.**
4. **Permisos mínimos.**
5. **Cambios pequeños y reversibles.**
6. **La IA propone y ejecuta; el equipo decide.**
7. **Automatizar el ciclo, no el juicio.**

---

## 🧪 Validar la configuración

```bash
bash scripts/validate.sh
```

Esto verifica que:
- `~/.config/opencode/opencode.jsonc` existe y es JSON válido.
- Los cinco agentes están configurados.
- OpenCode carga correctamente.

---

## 🙋‍♂️ ¿Por qué existe esto?

Porque quería una forma de usar la IA para acelerar sin perder el control. No se trata de que la IA haga todo sola, sino de que cada parte del trabajo caiga en el agente correcto, con las herramientas justas y la aprobación humana en los momentos que importan.

Si te sirve, usala. Si tenés ideas para mejorarla, abrí un issue o un PR.

---

## 📄 Licencia

MIT — usala, modificála y compartila.

Hecho con 🤖 + ☕ por [@felipebarraza6](https://github.com/felipebarraza6).
