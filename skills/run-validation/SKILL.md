# run-validation

Ejecuta el conjunto de validaciones del proyecto.

## Cuándo usar

- Después de que un Builder termina una implementación.
- Antes de una revisión.
- Cuando se sospecha de una regresión.

## Pasos

1. Lee `AGENTS.md` o documentación del proyecto para identificar los comandos oficiales de validación.
2. Ejecuta los comandos en orden: lint → type check → tests.
3. Captura la salida completa.
4. Clasifica el resultado como `PASS`, `FAIL`, `BLOCKED` o `NOT_RUN`.
5. Si falla, identifica los archivos y tests afectados.

## Comandos comunes

- Python: `ruff check .`, `mypy .`, `pytest`
- Node: `npm run lint`, `npm run typecheck`, `npm test`
- Go: `go vet ./...`, `go test ./...`
- Rust: `cargo check`, `cargo clippy`, `cargo test`

## Salida esperada

- Lista de comandos ejecutados.
- Resultado de cada uno.
- Clasificación global.
- Archivos o tests fallidos, si los hay.

## Restricciones

- No modifiques código durante la validación.
- Si un comando no existe, reporta `NOT_RUN` y explica por qué.
