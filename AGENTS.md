# AGENTS.md — OpenCode Global Config

Este archivo contiene las reglas globales para cualquier proyecto que use esta configuración de OpenCode.

## Stack y convenciones por defecto

- Respeta el stack tecnológico del proyecto en el que trabajes.
- Lee siempre `README.md` y este `AGENTS.md` antes de proponer cambios.
- Reutiliza patrones existentes; no inventes APIs ni dependencias.

## Flujo de trabajo

```
Especificar → Planificar → Construir → Verificar → Revisar → Publicar
```

1. **Orchestrator** analiza y planifica.
2. **Builder** implementa.
3. **Verifier** ejecuta tests y validaciones.
4. **Reviewer** revisa el diff y emite decisión.
5. **Deployer** prepara el despliegue con aprobación humana.

## Reglas de seguridad

- Nunca incluyas secretos en prompts, archivos de contexto o logs.
- No modifiques infraestructura ni desplegues a producción sin aprobación.
- Pide confirmación antes de migraciones destructivas.
- No hagas push ni merge automáticos.

## Testing

- Toda feature debe incluir tests acordes a su estrategia.
- Ejecuta las validaciones del proyecto antes de reportar éxito.
- Comandos comunes: `pytest`, `ruff check .`, `mypy .`, `npm test`, `npm run lint`, `npm run typecheck`, `go test ./...`, `cargo test`.

## Git

- Commits pequeños y descriptivos.
- Usa ramas por tarea.
- No commitees directamente a `main`/`master` sin aprobación.
